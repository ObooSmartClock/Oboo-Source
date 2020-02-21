## Omega Firmware Changelog
Log of all changes made to the Onion Omega LEDE Firmware

### Version Syntax

The Omega Firmware version is in the following format:
```
A.B.C bXYZ
```

The individual parts correspond to the following:
* A is the ULTRA version
* B is the Major version
* C is the Minor version
* XYZ is the build number

For example:
```
0.0.6 b264
```

The build number will continuously increment over the course of development.

### Versions
Definining the differences in each version change

#### 1.0.0
**2nd Production Version**

#### 0.0.1
**Pre-production Version**

Builds on Omega2 v0.0.1 b175 firmware
Development versions of all Oboo software



### Build Notes
Defining the changes in each build. *Note that if a number is missing, that build failed the deployment process.*

#### Feb 21, 2020

* Building packages with all updates to Oboo-Packages up to commit [5f4d944](https://github.com/ObooSmartClock/Oboo-Packages/commit/5f4d944f69f3be8f43362cb7ec71791edecabf23)

#### b122
*June 20, 2019*

* Latest Oboo software, version `0.0.8-4` - added on-screen notification when updating
* Fix for rc.local - now correctly creates /etc/config.json if it doesn't exist
* Fresh build

#### b121
*June 19, 2019*

* Updated rc.local to fix issue where /etc/config.json was missing on first boot
* Fix for building new firmware
    * Using avrdude v6.1 so MCU can be flashed
    * Not overwriting libwebsockets with outdated version
* Not including bluetooth kernel module

#### b120
*June 19, 2019*
**Do not use: cannot flash MCU**

* Running latest Oboo software, version `0.0.8-3`, mostly stable
* Created a patch for FBTFT ILI9341 color fix

#### b119
*Oct 8, 2018* 

* Updated Oboo Clock base scripts, specifically the USB update script
	* Upgrade script will only go through after checking a `upgrade.log` file on the USB drive
	* The upgrade will happen if the device's MAC Address is not in the log file
	* Will write MAC address in log file after upgrade
	* This was done to avoid unnecessary updates to already updated devices during manufacturing

#### b118
*Sept 27, 2018*

* NTP - rc.local will now restart this service
* Cards
	* No longer supporting 3-button press for 10 seconds to trigger a firmware update from USB
	* Implemented process launching and management system
	* Implemented playing audio from filesystem
	* Reading status data from Bluetooth module, using it to intelligently switch between BT and Omega audio
	* Timer now plays a sound when it expires

#### b117
*Sept 25, 2018*

* Card Manager: 
	* Notifications - implemented setting and clearing with mqtt messages
* Cards & Runtime:
	* Added System Card that appears only when user does a simultaneous triple-button press, and disappears when a gesture is detected
	* System card allows users to use the buttons to do specific things on the Oboo - enter setup mode, enter bt pariring mode, etc
* Hotplug
	* **Changed method to flash new firmware**: now whenever a USB drive is inserted with a file called `oboo.bin`, it will attempt to upgrade to that firmware
	* Added wifi hotplug script to populate the wifi icon in the status bar
* NTP - uci-defaults now enable this service

#### b116
*Sept 17, 2018*

* Touch bar: Enabled multi-touch and press duration tracking
* Added a method to flash new firmware from USB drive by pressing all buttons 1,2,3 (the three on the right) at the same time for 10 seconds or more and then releasing

#### b115
*Sept 17, 2018*

* Fixed issue in production firmware where display does not start
	* Root cause: Card Manager could not start because the Mosquitto broker never initializes
		* Mosquitto broker never initializes due to missing mosquitto user
	* Resolution: no longer overwriting shadow file (which resulted in deletion of the mosquitto user), now just inserting the production model password instead
* Updated Cards and Display manager to resolve card crashing and piling up on display issue


#### b114
*Sept 11, 2018*

Default firmware for initial production run

* Updated MCU firmware to reduce all button sensitivity - phantom button presses resolved
* Fixed cron system - now running properly 
* Updated cgi bin provisioning scripts - can now configure Oboo Clock with app properly
	* For now, setup mode is always enabled at boot. Will remove this once System card is available
* Added info display dimming controls with Onion script
* Added a device landing page (if anybody points their browser to the Oboo)

#### b113
*Sept 6, 2018*

* Updated MCU firmware to reduce sensitivity on buttons 2 and 3 - attempting to get rid of phantom button presses
* Added Oboo Smart Clock production model as a target
	* A new password is set for this model
	* SSH access is disabled for this model
* Serial access now requires a password
* CGI bin provisioning scripts updated
	* All now require a flag (existence of a specific file) to operate
	* Added script to change root password

#### b112
*Sept 5, 2018*

* Reducing boot time - removed unnecessary packages and kernel modules
* Using Oboo specific warp core (recompiled to suit kernel changes)
* Hardware PWM control of info display backlight
* Enabling ubus cors by default 

#### b111
*August 28, 2018*

* Adjusted firmware config for software repo and package repo reorganization and simplification

#### b110
*June 19, 2018*

* No longer compiling any packages that will not be included in the firmware image
* Latest version of card manager:
    * Restructured code and integrated from sandbox (first integration)
    * Updated to latest version of lvgl library
    * Can add offsets to center and right aligned elements
* Latest version of card
    * Weather card redesigned

#### b109 
*June 1, 2018*

* Running latest WiFi Warp Core
* Card Manager:
    * Scrolling through cards is continuous when an end is reached
    * Added multiple retries for connecting to MQTT broker at start of program - Fixed issue where it cannot accept messages from cards on boot
* Cards 
    * Added new "Upgrade" card - not showing Timer card for now
    * Reversed card change direction to make it more natural
    * Fixed issue where cards don't show up at boot - added retries to connecting to the MQTT broker and a delay before sending the message to initialize a card
* Base System
    * Software upgrade program is now in base system - checked that it actually upgrades software packages correctly

#### b108
*May 25, 2018*

* Updated Oboo Clock Cards package
    * Better handling of MCU inputs and outputs
    * Fixed Weather Card to show wind speed

#### b107
*May 25, 2018*

* Upgraded MCU firmware - much better gesture detection
    * Still needs work for gesture and touch to nicely coexist


#### b106
*May 10, 2018*

* compatibility for fw build tools
* reorganized packages
* Added oboo package repo, base oboo-clock package that requires all the rest
* Time will now automatically sync between the Omega and RTC

#### b105
*Apr 11, 2018*

* Updated fb tft auto init to use GPIO14 for reset and GPIO11 for dc
* Added setting GPIO3 to high to rc.local - enables the Amplifier IC on boot

#### b104
*Apr 3, 2018*

* MCU firmware includes support for TM1618 7-seg driver IC

#### b103
*Apr 2, 2018*

* Updated card-manager
* Added Oboo-Cards - includes runtime and js implementations for timer, weather, and mcu communication
* Some nice auto-loading

#### b102
*Mar 6, 2018*

* Fix for hostname tool
* Updates to oboo software packages
  * Oboo boots and runs the demo


#### b101
*Mar 5, 2018*

* Added Oboo Smart Clock device
* Updated UCI defaults to suit Oboo Smart Clock
  * new hostname
  * new versioning
  * flashing MCU on first boot
  * configuring fbtft autload

#### b100
*Mar 2, 2017*

* initial version - added oboo software, stripped out extra omega software

