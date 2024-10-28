# Zabbix

## Set Up Zabbix on Docker

To set up Zabbix on Docker, we will utilize Docker Compose to install the `zabbix-server`, `zabbix-web`, `postgres`, and `zabbix-agent` components, using the specified images:

- [zabbix/zabbix-server-pgsql:alpine-7.0-latest](https://hub.docker.com/r/zabbix/zabbix-server-pgsql)
- [zabbix/zabbix-web-nginx-pgsql:alpine-7.0-latest](https://hub.docker.com/r/zabbix/zabbix-web-nginx-pgsql)
- [zabbix-agent:alpine-7.0-latest](https://hub.docker.com/r/zabbix/zabbix-agent)
- [postgres:16-bullseye](https://hub.docker.com/_/postgres)

To perform the installation follow the steps below:

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
        ports:
          - 8080:8080
          - 8443:8443
        networks:
          zabbix-net:
            ipv4_address: 172.18.0.3
        volumes:
          - /etc/localtime:/etc/localtime:ro
          - /etc/timezone:/etc/timezone:ro
          - ./cert/:/usr/share/zabbix/conf/certs/:ro
        depends_on:
          - zabbix-server
        environment:
          DB_SERVER_HOST: "zabbix-db"
          DB_PORT: 5432
          POSTGRES_USER: "zabbix"
          POSTGRES_PASSWORD: "zabbix123"
          POSTGRES_DB: "zabbix-db"
          ZBX_MEMORYLIMIT: "1024M"
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
        ports:
          - 5432:5432
        networks:
          zabbix-net:
            ipv4_address: 172.18.0.4
        volumes:
          - ./pgsql-volume:/var/lib/postgresql/data
        environment:
          POSTGRES_USER: "zabbix"
          POSTGRES_PASSWORD: "zabbix123"
          POSTGRES_DB: "zabbix-db"

      zabbix-agent:
        container_name: "zabbix-agent"
        image: zabbix/zabbix-agent:alpine-7.0-latest
        restart: always
        ports:
          - 10050:10050
          - 31999:31999
        networks:
          zabbix-net:
            ipv4_address: 172.18.0.5
        volumes:
          - /etc/localtime:/etc/localtime:ro
          - /etc/timezone:/etc/timezone:ro
          - /run/docker.sock:/var/run/docker.sock
        depends_on:
          - zabbix-server
        environment:
          ZBX_HOSTNAME: "zabbix-host"
          ZBX_SERVER_HOST: "zabbix-server"
          ZBX_ENABLEREMOTECOMMANDS: "1"
        stop_grace_period: 5s

    networks:
      zabbix-net:
        driver: bridge
        ipam:
          config:
            - subnet: 172.18.0.0/16
              gateway: 172.18.0.1

    volumes:
      zbx_db16:
    ```
3. Then run the docker compose with the command below:
    ```bash
    $ docker compose up -d
    ```
4. Verify if Zabbix is up and running:
    ```bash
    $ docker ps
    ```
5. To access the Zabbix UI, go to `localhost:8080`. If you encounter an error, wait for the database to start and try again. Sign in using the credentials `Admin:zabbix`.

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
    3. Under `Checks` > `Actions` set:
        1. Remove the `system.uname`.
        2. Add the `ICMP ping`.
        3. Add the `HTTP` on port `80`.
        4. Add the `SSH` on port `22`.
    4. Check the `Enable` box, then click on `Update`.
3. Wait a few minutes for the hosts to appear in `Monitoring` > `Hosts`, or restart the zabbix-server container using the command below:
    ```bash
    $ docker restart zabbix-server
    ```

## Configure Agent on Zabbix Server (Docker Container)

Configure Zabbix Agent to gather data for the Zabbix Server.

1. On the Zabbix GUI, go to `Monitoring` > `Hosts`, then click on the `Zabbix Server` > `Host` and configur it with the parameters below:
    - Host name: `zabbix-host`
    - Visible name: `Zabbix Server`
    - Templates:
        - `Linux by Zabbix agent`
        - `Zabbix server health`
    - Host groups: `Zabbix servers`
    - Interface:
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
        Server=zabbix-server                    # Zabbix Server IP/DNS name
        ServerActive=zabbix-server:10051        # Zabbix Server IP/DNS:Port
        Hostname=zabbix-host                    # Hostname set at Zabbix UI
        ```
3. Run the command below on the zabbix-server to reload the configuration file if needed:
    ```bash
    $ docker exec -it zabbix-server zabbix_server -R config_cache_reload
    ```
4. After a couple of minutes check if the host status on the Zabbix GUI becomes green.

## Configure the Zabbix Agent on the Docker Host

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
2. Go to `Data collection` > `Discovery`, Then click on `Local network`:
    1. On `IP range`, remove the Docker Host IP address to avoid the Zabbix Discovery to be adding the default Zabbix agent listening port (10050).
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
        Server=172.18.0.2                    # Zabbix Server IP address
        ListenPort=10052                    # Zabbix Agent listen port
        ServerActive=172.18.0.2:10051        # Zabbix Server IP:Port
        Hostname=kali                        # Hostname set at Zabbix GUI
        ```
5. Enable and restart the Zabbix Agent:
    ```bash
     $ sudo systemctl enable zabbix-agent
    $ sudo systemctl restart zabbix-agent
    ```
6. Run the command below using the zabbix-server container id:
    ```bash
    $ docker exec -it zabbix-server zabbix_server -R config_cache_reload
    ```
7. After a couple of minutes check if the host status on the Zabbix GUI becomes green.

## Configure Zabbix Agent on an VirtualBox VM

The steps below show how to configure the Zabbix Agent on an VirtualBox VM, which is an Debian-based Linux distribution (Ubuntu Server):

1. On the Zabbix GUI, go to `Monitoring` > `Hosts`, on the hosts list click on the `IP address` corresponding to the `VirtualBox VM`, then click on `Host` to set the parameters below:
    - Host name: `ubuntu-server`
    - Visible name: `Ubuntu Server`
    - Templates: `Templates/Operating systems` > `Linux by Zabbix agent`
    - Host groups: `Virtual machines`
    - Interfaces:
        - Ip address: `192.168.57.3`
        - Connect to: `IP`
        - Port: `10050`
    - Then click `Update`.
2. On the Unbuntu Server, install the Zabbix Agent:
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
        Server=192.168.57.1                        # Zabbix Server IP Address (Docker Host IP)
        ServerActive=192.168.57.1:10051            # Zabbix Server IP:Port
        Hostname=ubuntu-server                    # Hostname set at Zabbix GUI
        ```
4. Enable and restart the Zabbix Agent:
    ```bash
     $ sudo systemctl enable zabbix-agent
    $ sudo systemctl restart zabbix-agent
    ```
5. Run the command below using the zabbix-server container id:
    ```bash
    $ docker exec -it zabbix-server zabbix_server -R config_cache_reload
    ```
6. After a couple of minutes check if the host status on the Zabbix GUI becomes green.

## TROUBLESHOOTING

### Important files for troubleshooting

1. Zabbix files on docker:
    - Log files:
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
    - Log file:
        ```bash
        $ tail -f /var/log/zabbix/zabbix_agentd.log
        ```
    - Configuration file:
        ```bash
        $ sudo nano /etc/zabbix/zabbix_agentd.conf
        ```

