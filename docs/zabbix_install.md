# Zabbix

## Set Up Zabbix on Docker

To set up Zabbix on Docker, we will utilize Docker Compose to install the `zabbix-server`, `zabbix-web`, `postgres`, and `zabbix-agent` components, using the specified images:

- [zabbix/zabbix-server-pgsql:alpine-7.0-latest](https://hub.docker.com/r/zabbix/zabbix-server-pgsql)
- [zabbix/zabbix-web-nginx-pgsql:alpine-7.0-latest](https://hub.docker.com/r/zabbix/zabbix-web-nginx-pgsql)
- [zabbix-agent:alpine-7.0-latest](https://hub.docker.com/r/zabbix/zabbix-agent)
- [postgres:16-bullseye](https://hub.docker.com/_/postgres)

To perform the installation, follow the steps below:

1. First, create a directory to store the Docker Compose file:
    ```bash
    $ mkdir zabbix && cd zabbix
    ```
2. Then, create the Docker Compose file:
    ```bash
    $ nano docker-compose.yml
    ```
    - Save the content below to the file:
    ```yml
    services:
      zabbix-server:
        container_name: "zabbix-server"
        image: zabbix/zabbix-server-pgsql:alpine-7.0-latest
        restart: always
        ports:
          - 10051:10051
        networks:
          zabbix-net:
            ipv4_address: 172.18.0.2
        volumes:
          - /etc/localtime:/etc/localtime:ro
          - /etc/timezone:/etc/timezone:ro
          - ./zabbix-server:/var/lib/zabbix/export
          - ./zabbix-server:/var/lib/zabbix/snmptraps
        environment:
          ZBX_CACHESIZE: 4096M
          ZBX_HISTORYCACHESIZE: 1024M
          ZBX_HISTORYINDEXCACHESIZE: 1024M
          ZBX_TRENDCACHESIZE: 1024M
          ZBX_VALUECACHESIZE: 1024M
          DB_SERVER_HOST: "zabbix-db"
          DB_PORT: 5432
          POSTGRES_USER: "zabbix"
          POSTGRES_PASSWORD: "zabbix123"
          POSTGRES_DB: "zabbix-db"
        labels:
          com.zabbix.description: "Zabbix server with PostgreSQL database support"
          com.zabbix.company: "Zabbix LLC"
          com.zabbix.component: "zabbix-server"
          com.zabbix.dbtype: "pgsql"
          com.zabbix.os: "alpine"
        stop_grace_period: 30s

      zabbix-web:
        container_name: "zabbix-web"
        image: zabbix/zabbix-web-nginx-pgsql:alpine-7.0-latest
        restart: always
        depends_on:
          - zabbix-server
        ports:
          - 8080:8080
        networks:
          zabbix-net:
            ipv4_address: 172.18.0.3
        volumes:
          - /etc/localtime:/etc/localtime:ro
          - /etc/timezone:/etc/timezone:ro
          - ./cert/:/usr/share/zabbix/conf/certs/:ro
        environment:
          ZBX_MEMORYLIMIT: "1024M"
          ZBX_SERVER_HOST: "zabbix-server"
          DB_SERVER_HOST: "zabbix-db"
          DB_PORT: 5432
          POSTGRES_USER: "zabbix"
          POSTGRES_PASSWORD: "zabbix123"
          POSTGRES_DB: "zabbix-db"
        labels:
          com.zabbix.description: "Zabbix frontend on Nginx web-server with PostgreSQL database support"
          com.zabbix.company: "Zabbix LLC"
          com.zabbix.component: "zabbix-frontend"
          com.zabbix.webserver: "nginx"
          com.zabbix.dbtype: "pgsql"
          com.zabbix.os: "alpine"
        healthcheck:
          test: ["CMD", "curl", "-f", "http://localhost:8080/ping"]
          interval: 10s
          timeout: 5s
          retries: 3
          start_period: 30s
        stop_grace_period: 10s

      postgres:
        container_name: "zabbix-db"
        image: postgres:16-bullseye
        restart: always
        networks:
          zabbix-net:
            ipv4_address: 172.18.0.4
        volumes:
          - db_vol:/var/lib/postgresql/data
        environment:
          POSTGRES_USER: "zabbix"
          POSTGRES_PASSWORD: "zabbix123"
          POSTGRES_DB: "zabbix-db"

      zabbix-agent:
        container_name: "zabbix-agent"
        image: zabbix/zabbix-agent:alpine-7.0-latest
        restart: always
        depends_on:
          - zabbix-server
        networks:
          zabbix-net:
            ipv4_address: 172.18.0.5
        volumes:
          - /etc/localtime:/etc/localtime:ro
          - /etc/timezone:/etc/timezone:ro
          - /run/docker.sock:/var/run/docker.sock
        environment:
          ZBX_HOSTNAME: "zabbix-host"
          ZBX_SERVER_HOST: "zabbix-server"
          ZBX_ENABLEREMOTECOMMANDS: "1"
        stop_grace_period: 5s

    networks:
      zabbix-net:
        name: zabbix-net
        driver: bridge
        ipam:
          config:
            - subnet: 172.18.0.0/16
              gateway: 172.18.0.1

    volumes:
      db_vol:
    ```
3. Then run the docker compose with the command below:
    ```bash
    $ docker compose up -d
    ```
4. Verify if Zabbix is up and running:
    ```bash
    $ docker ps
    ```
5. To identify listening ports on the container, follow these steps:
    1. Get the PID of the Docker container:
    ```bash
    $ docker inspect -f '{{.State.Pid}}' <CONTAINER_NAME_OR_ID>
    ```
    2. Use `nsenter` to run `ss -ltn` inside the container namespace:
    ```bash
    $ sudo nsenter -t <PID> -n ss -ltn
    ```
6. To access the Zabbix UI, go to `localhost:8080`. If you encounter an error, wait for the database to start and try again. Sign in using the credentials `Admin:zabbix`.

## Zabbix Discover Hosts

Configure Zabbix Discovery to scan the specified network for hosts.

1. On the Zabbix UI, go to `Alerts` > `Actions` > `Discovery actions`, then click on `Create action`.
    1. On the `Action` tab, set the `Name`, then click on `Add` under `Conditions` and set:
        - Type: `Discovery rule`
        - Operator: `equals`
        - Discovery rules: `Local network`
        - Click `Add`.
    2. On the `Operations` tab, click on `Add` under `Operations`, then set:
        - Operations: `Add host`
        - Click `Add`.
    3. Click `Add`.
2. Go to `Data collection` > `Discovery`, then click on the `Local network` and set:
    1. IP range: `192.168.57.1-10`
    2. Update interval: `5m`
    3. Under `Checks`, remove the `Zabbix agent "system.uname"`, then add:
        1. Add the `ICMP ping`.
        2. Add the `HTTP` on port `80`.
        3. Add the `SSH` on port `22`.
    4. Check the `Enable` box, then click on `Update`.
3. Wait a few minutes for the hosts to appear in `Monitoring` > `Hosts`, or restart the zabbix-server container using the command below:
    ```bash
    $ docker restart zabbix-server
    ```

## Configure Zabbix Agent on the Zabbix Server (Docker Container)

Configure Zabbix Agent to gather data for the Zabbix Server.

1. On the Zabbix GUI, go to `Monitoring` > `Hosts`, then click on the `Zabbix Server` > `Host` and configure it with the parameters below:
    - Host name: `zabbix-host`
    - Visible name: `Zabbix Server`
    - Templates:
        - `Linux by Zabbix agent`
        - `Zabbix server health`
    - Host groups: `Zabbix servers`
    - Interface:
        - IP address: Leave empty
        - DNS name: `zabbix-agent`
        - Connect to: `DNS`
        - Port: 10050
    - Then click on `Update`.
2. Check the configuration of the Zabbix Agent:
    - Open the configuration file:
        ```bash
        $ docker exec -it zabbix-agent vi /etc/zabbix/zabbix_agentd.conf
        ```
    - The parameters should be as below:
        ```yml
        Server=zabbix-server                    # Zabbix Server IP or DNS name (on Docker network)
        ServerActive=zabbix-server:10051        # Zabbix Server IP/DNS:Port (Docker network)
        Hostname=zabbix-host                    # Hostname set at Zabbix UI
        ```
3. After a couple of minutes, check if the host status on the Zabbix GUI becomes green.
4. Run on the Docker Host the zabbix-server command below to reload the configuration file if needed:
    ```bash
    $ docker exec -it zabbix-server zabbix_server -R config_cache_reload
    ```

## Configure Zabbix Agent on the Docker Host (Kali Linux)

The steps below show how to configure the Zabbix Agent on the Docker host, which is an Debian-based Linux distribution (Kali Linux):

1. On the Zabbix GUI, go to `Monitoring` > `Hosts`, on the hosts list click on the `IP address` corresponding to the `Docker host`, then click on `Host` to set the parameters below:
    - Host name: `kali`
    - Visible name: `Kali Linux`
    - Templates: `Templates/Operating systems` > `Linux by Zabbix agent`
    - Host groups: `Discovered hosts`
    - Interfaces:
        - IP Address: `192.168.57.1`
        - Connect to: `IP`
        - Port: `10052`
    - Then click `Update`.
2. Go to `Data collection` > `Discovery`, then click on `Local network`:
    1. On `IP range`, remove the Docker Host IP address to avoid the Zabbix Discovery to be, adding the default Zabbix agent listening port (10050).
3. On the Kali Linux, install the Zabbix Agent:
    ```bash
    $ sudo apt install zabbix-agent
    ```
4. Configure server IP address at the Zabbix Agent config file:
    - Open the configuration file:
        ```bash
        $ sudo nano /etc/zabbix/zabbix_agentd.conf
        ```
    - Set the parameters below:
        ```yml
        Server=172.18.0.2                    # Zabbix Server IP address (on Docker network)
        ListenPort=10052                     # Zabbix Agent listen port (on Docker Host)
        ServerActive=172.18.0.2:10051        # Zabbix Server IP:Port (on Docker network)
        Hostname=kali                        # Hostname set at Zabbix GUI
        ```
5. Enable and restart the Zabbix Agent:
    ```bash
    $ sudo systemctl enable zabbix-agent
    $ sudo systemctl restart zabbix-agent
    ```
6. After a couple of minutes, check if the host status on the Zabbix GUI becomes green.
7. Run on the Docker Host the zabbix-server command below to reload the configuration file if needed:
    ```bash
    $ docker exec -it zabbix-server zabbix_server -R config_cache_reload
    ```

## Configure Zabbix Agent on an VirtualBox VM (Ubuntu Server)

The steps below show how to configure the Zabbix Agent on an VirtualBox VM, which is an Debian-based Linux distribution (Ubuntu Server):

1. On the Zabbix GUI, go to `Monitoring` > `Hosts`, on the hosts list click on the `IP address` corresponding to the `VirtualBox VM`, then click on `Host` to set the parameters below:
    - Host name: `ubuntu-server`
    - Visible name: `Ubuntu Server`
    - Templates: `Templates/Operating systems` > `Linux by Zabbix agent`
    - Host groups: `Virtual machines`
    - Interfaces:
        - IP address: `192.168.57.3`
        - Connect to: `IP`
        - Port: `10050`
    - Then click `Update`.
2. On the Ubuntu Server, install the Zabbix Agent:
    ```bash
    $ sudo apt install zabbix-agent
    ```
3. Configure server IP address at the Zabbix Agent config file:
    - Open the configuration file:
        ```bash
        $ sudo nano /etc/zabbix/zabbix_agentd.conf
        ```
    - Set the parameters below:
        ```yml
        Server=192.168.57.1                        # Docker Host IP Address
        ServerActive=192.168.57.1:10051            # Docker Host IP:Port (mapped to Zabbix Server)
        Hostname=ubuntu-server                     # Hostname set at Zabbix GUI
        ```
4. Enable and restart the Zabbix Agent:
    ```bash
    $ sudo systemctl enable zabbix-agent
    $ sudo systemctl restart zabbix-agent
    ```
5. After a couple of minutes, check if the host status on the Zabbix GUI becomes green.
7. Run on the Docker Host the zabbix-server command below to reload the configuration file if needed:
    ```bash
    $ docker exec -it zabbix-server zabbix_server -R config_cache_reload
    ```

## TROUBLESHOOTING

### Important files for troubleshooting

1. Zabbix files on docker:
    - Display the log files:
        ```bash
        $ docker logs zabbix-server
        $ docker logs zabbix-agent
        $ docker logs zabbix-web
        $ docker logs zabbix-db
        ```
    - Configuration files:
        ```bash
        $ docker exec -it zabbix-server vi /etc/zabbix/zabbix_server.conf
        $ docker exec -it zabbix-agent vi /etc/zabbix/zabbix_agentd.conf
        ```
2. Zabbix files on Debian-based Linux distributions:
    - Print the entire log file:
        ```bash
        $ cat /var/log/zabbix/zabbix_agentd.log
        ```
    - Print the last 20 lines of the log file in real time:
        ```bash
        $ tail -f -n 20 /var/log/zabbix/zabbix_agentd.log
        ```
    - Configuration file:
        ```bash
        $ sudo nano /etc/zabbix/zabbix_agentd.conf
        ```
