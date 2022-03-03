
## Source

Still <https://medium.com/swlh/using-docker-compose-to-build-zigbee-infrastructure-336983a6ad67>

## First PostgreSQL

### docker-compose.yml

Add 

    postgres:
        container_name: postgres-ha
        image: postgres
        ports:
        - "5432:5432"
        volumes:
        - ./data-postgres/:/var/lib/postgresql/data/
        deploy:
        resources:
            limits:
            memory: 250M

Run

    touch .env

Add/edit

    POSTGRES_USER=postgres-ha
    POSTGRES_PASSWORD=IOT1234
    POSTGRES_DB=ha


#### ERATA!
I stedet for `.env` som jeg ikke kan få til at virke, prøv at til føje, følgende til `postgres` servicesen i `docker-compose.yml`

    environment:
        POSTGRES_DB:       ha
        POSTGRES_USER:     postgres-ha
        POSTGRES_PASSWORD: IOT1234

samlet

      postgres:
            container_name: postgres-ha
            image: postgres
            ports:
            - "5432:5432"
            volumes:
            - ./data-postgres/:/var/lib/postgresql/data/
            environment:
            POSTGRES_DB:       ha
            POSTGRES_USER:     postgres-ha
            POSTGRES_PASSWORD: IOT1234

Add: 

    homeassistant:
        container_name: home-assistant
        depends_on:
        - mosquitto
        - postgres
        image: homeassistant/home-assistant:stable
        volumes:
        - ./data-ha:/config
        environment:
        - TZ=Europe/Copenhagen
        deploy:
        resources:
            limits:
            memory: 250M
        restart: always
        ports:
        - 8123:8123

Run

    mkdir data-ha
    touch data-ha/configuration.yaml

Add to `data-ha/configuration.yaml`

    # Configure a default setup of Home Assistant (frontend, api, etc)
    default_config:
    # Text to speech
    tts:
    - platform: google_translate
    group: !include groups.yaml
    automation: !include automations.yaml
    script: !include scripts.yaml
    scene: !include scenes.yaml
    recorder:
    purge_keep_days: 30
    db_url: "postgresql://postgres-ha:IOT1234@192.168.1.232:5432/ha"
    mqtt:
    discovery: true
    broker: 192.168.1.232
    birth_message:
        topic: 'hass/status'
        payload: 'online'
    will_message:
        topic: 'hass/status'
        payload: 'offline'