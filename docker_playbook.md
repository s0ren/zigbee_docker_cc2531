## Install image

Se <https://www.raspberrypi.com/software/>


## ssh til raspi

    ssh pi@192.168.1.232 

## Updates...

    sudo apt-get update && sudo apt-get upgrade

## Install docker 

Fra <https://dev.to/elalemanyo/how-to-install-docker-and-docker-compose-on-raspberry-pi-1mo>

    curl -sSL https://get.docker.com | sh

    sudo usermod -aG docker [user_name]
    sudo usermod -aG docker ${USER}
    groups ${USER}

med `pi` indsat:

    sudo usermod -aG docker pi
    sudo usermod -aG docker ${USER}
    groups ${USER}

## Docker compose

    sudo apt-get install libffi-dev libssl-dev
    sudo apt install python3-dev
    sudo apt-get install -y python3 python3-pip

    sudo pip3 install docker-compose

## Docker as service

    sudo systemctl enable docker