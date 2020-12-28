# Z-Wave Notes

Random notes about Z-Wave to remember for later.

## Aeon Labs by Aeotec "Smart Strip" DSC11-ZWUS
The device has six outlets, two always on and four controlled by Z-Wave.  It also provides energy monitoring.  However, [as reported](https://forum.universal-devices.com/topic/22350-aeon-labs-smart-strip-dsc11-off-by-2-ports-power-consumption/) the Z-Wave instances don't line up with the physical device.

Physical Outlet | Z-Wave Switch Instance | Z-Wave Sensor instance | HA entity | Notes
------------ | - | - | - | -
n/a | 1 | ? | | Z-Wave switch controls all outlets
Always on 1 | n/a | 2 | | Next to action button
Always on 2 | n/a | 3 | | 
Switchable 1 | 2 | 4 | | 
Switchable 2 | 3 | 5 | |
Switchable 3 | 4 | n/a | |
Switchable 4 | 5 | n/a | |

As reported by OZW 1.6 using MQTT to Home Assistant.