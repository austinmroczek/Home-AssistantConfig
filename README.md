# Home-AssistantConfig
My home-assistant configuration 

## Basic Setup
First [upgrade python](https://raspberrypi.stackexchange.com/questions/116118/updating-python-3-7-to-3-8) to. 3.9

Using Home Assistant Core on [Raspberry Pi](https://www.home-assistant.io/docs/installation/raspberry-pi/)

Autostart is enabled by [systemd](https://home-assistant.io/docs/autostart/systemd/)

## Other
For issues with python package 'av' not installing properly, which caused skybell to stop working:
The ffmpeg included with Raspbian Buster is old/wrong.  Need to [upgrade ffmpeg](https://linuxconfig.org/how-to-install-the-deb-multimedia-repository-with-vlc-kodi-and-ffmpeg-on-debian-10-buster#h2-how-to-import-the-repository-key)

## mosquitto setup

Set up the mosquitto MQTT server [docker image](https://hub.docker.com/_/eclipse-mosquitto)

`mkdir ~pi/mosquitto`
`mkdir ~pi/mosquitto/config`
`touch ~pi/mosquitto/config/mosquitto.conf`
`mkdir ~pi/mosquitto/data`
`mkdir ~pi/mosquitto/log`

Add the following to mosquitto.conf:

```txt
persistence true
persistence_location /mosquitto/data/
log_dest file /mosquitto/log/mosquitto.log
```

First run the container to make sure it works right
`docker run -d --restart always -p 1883:1883 -p 9001:9001 -v /home/pi/mosquitto/config/mosquitto.conf:/mosquitto/config/mosquitto.conf -v /home/pi/mosquitto/data:/mosquitto/data -v /home/pi/mosquitto/log:/mosquitto/log eclipse-mosquitto`

## [zwavejs setup](ZWAVE_NOTES.md)
