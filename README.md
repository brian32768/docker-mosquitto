# docker-mosquitto

2020-07-20 this swarm set up worked just fine but I have to run home-assistant
in compose because of its dependence on the serial port for the Nortek USB Zigbee device.
So I moved mosquitto over there to home-assistant.

This is my MQTT server. I'm running TCP and WebSockets
and I have it behind a reverse proxy for WebSockets.

## Configuration

mosquitto.conf is a config file that's mounted when the
docker container starts.

Ports to open on the host network are 1883 and 9001.

* 1883 is for MQTT
* 9001 is for MQTT over WebSockets

## Launch

I use Swarm now so run

   docker stack deploy -c docker-compose.yml mosquitto

## Send a message

   docker exec -it mosquitto mosquitto_pub -t cc/flexlm -q 1 -d -m "`date +%H:%M:%S`"

## Receive messages (subscribe)

   docker exec -it mosquitto mosquitto_sub -t cc/# -q 1 -d

## Resources

https://hub.docker.com/_/eclipse-mosquitto
