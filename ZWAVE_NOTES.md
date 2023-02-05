# Z-Wave Notes

Random notes about Z-Wave to remember for later.

## Setup [zwavejs2mqtt](https://zwave-js.github.io/zwavejs2mqtt)

```console
root@rpi# docker run --restart always -d -p 8091:8091 -p 3000:3000 --device=/dev/ttyAMA0 --mount source=zwavejs2mqtt,target=/usr/src/app/store zwavejs/zwavejs2mqtt:latest
```

Review [setup instructions](https://zwave-js.github.io/zwavejs2mqtt/#/usage/setup)

Note:  device is ttyAMA0

## Updating zwavejs2mqtt

```console
root@rpi# docker pull zwavejs/zwavejs2mqtt
root@rpi# docker ps
root@rpi# docker stop [container_id]
root@rpi# docker rm [container_id]
root@rpi# docker run --restart always -d -p 8091:8091 -p 3000:3000 --device=/dev/ttyAMA0 --mount source=zwavejs2mqtt,target=/usr/src/app/store zwavejs/zwavejs2mqtt:latest
root@rpi# docker image rm [old image]
```

## Aeon Labs by Aeotec "Smart Strip" DSC11-ZWUS
The device has six outlets, two always on and four controlled by Z-Wave.  It also provides energy monitoring.  However, [as reported](https://forum.universal-devices.com/topic/22350-aeon-labs-smart-strip-dsc11-off-by-2-ports-power-consumption/) the Z-Wave instances don't line up with the physical device.

Physical Outlet | Z-Wave Switch Instance | Z-Wave Sensor instance | HA entity | Notes
------------ | - | - | - | -
Always on 1 | n/a | 1 | | Next to action button
Always on 2 | n/a | 2 | |
Switchable 1 | 1 | 3 | |
Switchable 2 | 2 | 4 | |
Switchable 3 | 3 | n/a | |
Switchable 4 | 4 | n/a | |

As reported by ZwaveJS to Home Assistant.

## Devices that require polling
- all remotec switches for the lawn

## Fakro skylight notes

Per email with Fakro support on 12/3/19
If the window is closed, it always reports Value 0, even if it is raining

If the window is open

- Value 0 - occurs only after the first answer since the power reset - when the rain sensor does not detect
- Value 1 - reports when the sensor is active (rain detection occurs)
- Value 254 - reports when the sensor is not detecting rain at a given moment - i.e. when it is not raining
