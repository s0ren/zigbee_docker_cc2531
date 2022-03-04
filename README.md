# zigbee_docker_cc2531

Please see the `main` branch for playbooks

Klik ind på 
* Home Assistant: http://192.168.1.232:8123/
* Zigbee2Mqtt web front end: http://192.168.1.232:8080/

Ssh til raspien med 

    $ ssh pi@192.168.1.232` 

brug pw _`raspberry`_

Se _mqtt_ meddelelser med 

    $ docker-compose exec mosquitto mosquitto_sub -t "#"
