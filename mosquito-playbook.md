

## Source

<https://medium.com/swlh/using-docker-compose-to-build-zigbee-infrastructure-336983a6ad67>

## post install

### data dir

    mkdir data-mosquitto
    mkdir data-mosquitto/config
    wget "https://raw.githubusercontent.com/eclipse/mosquitto/master/mosquitto.conf" -P ./data-mosquitto/config
    # touch docker-compose.yml
    # touch restart

more ...

    mkdir data-mosquitto/data
    sudo chmod o+w ./data-mosquitto/data
    sudo chown 1883:1883 ./data-mosquitto/data -R

and

    mkdir data-mosquitto/log
    sudo touch ./data-mosquitto/log/mosquitto.log
    sudo chmod o+w ./data-mosquitto/log
    sudo chmod o+w ./data-mosquitto/log/mosquitto.log
    sudo chown 1883:1883 ./data-mosquitto/log -R

Start

    ./restart.sh

check 

    docker-compose ps

## Mosquitto config

Til `./data-mosquitto/config/mosquitto.conf`, tilføj (i toppen f.eks):

    persistence true
    persistence_location /mosquitto/data/
    log_dest file /mosquitto/log/mosquitto.log

    allow_anonymous true
    listener 1883
    