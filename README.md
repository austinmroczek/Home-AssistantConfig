# Home-AssistantConfig
My home-assistant configuration 

## Basic Setup
First [upgrade python](https://raspberrypi.stackexchange.com/questions/116118/updating-python-3-7-to-3-8) to. 3.9

Using Home Assistant Core on [Raspberry Pi](https://www.home-assistant.io/docs/installation/raspberry-pi/)

Autostart is enabled by [systemd](https://home-assistant.io/docs/autostart/systemd/)

## Other
For issues with python package 'av' not installing properly, which caused skybell to stop working:
The ffmpeg included with Raspbian Buster is old/wrong.  Need to [upgrade ffmpeg](https://linuxconfig.org/how-to-install-the-deb-multimedia-repository-with-vlc-kodi-and-ffmpeg-on-debian-10-buster#h2-how-to-import-the-repository-key)
