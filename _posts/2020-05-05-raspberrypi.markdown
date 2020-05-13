---
layout: single
title:  "Creating a Raspberry Pi Webserver headless"
date:   2020-05-05 13:44:23 +0100
categories: RaspberryPi
header:
     overlay_image: /assets/images/raspberrypisplash.jpg
     caption: "Time to do: 30minutes"
     show_overlay_excerpt: false
excerpt: How to create a Raspberry Pi server headlessly, so you don't need to use a HDMI cable
---

## Requirements / Items

A raspberry Pi (preferably V3 B+), if not V2 with a Network Adapter <br />
sd card reader:
[Sd card reader](https://www.amazon.co.uk/gp/product/B001JPPQS6/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1)
<br />
Raspberry Pi: 
[Raspberry Pi Model B+](https://www.amazon.co.uk/Raspberry-Pi-3-Model-B/dp/B07BDR5PDW/ref=sr_1_3?dchild=1&keywords=raspberry+pi+3&qid=1588410760&s=computers&sr=1-3)
<br />
A micro usb cable:
[Micro usb cable](https://www.amazon.co.uk/AmazonBasics-Male-Micro-Cable-Black/dp/B0719H12WD/ref=sr_1_1_sspa?crid=1S0O4UP1UH3VO&dchild=1&keywords=micro+usb+cable&qid=1588410802&s=computers&sprefix=micro+usb+%2Ccomputers%2C173&sr=1-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUFDVDVFVFRZUks5MzcmZW5jcnlwdGVkSWQ9QTAxODg4MDMzN1cwSjk4VTFUUTRRJmVuY3J5cHRlZEFkSWQ9QTAyODQ0NjkxV1pMVldXQThSOVM3JndpZGdldE5hbWU9c3BfYXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ==)
<br />
And optionally a HDMI cable:
[HDMI Cable](https://www.amazon.co.uk/Lead-Snowkids-Compatible-Support-Ethernet-Function-Grey-HDMI-cable/dp/B07GYS426K/ref=sr_1_1_sspa?crid=2PQBC94O6JNW8&dchild=1&keywords=hdmi+cable&qid=1588410819&s=computers&sprefix=hdmi%2Ccomputers%2C164&sr=1-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUExTVpCS1FBUjVLSDFLJmVuY3J5cHRlZElkPUEwOTQ1ODU1T1NQTTg0TTNUTjVEJmVuY3J5cHRlZEFkSWQ9QTA5ODEyOTUxMk1XRkpWSENHTzhLJndpZGdldE5hbWU9c3BfYXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ==)

## Software

[Etcher.io](https://www.balena.io/etcher/)

This is a way to flash an OS image to your SD card (putting an operating system on your SD card).

[Putty](https://www.putty.org/)

A SSH client for you to remotely work with the Raspberry Pi.

[FileZilla (Optional)](https://filezilla-project.org/)

This is an SFTP or FTP client that you can use to transfer lots of files to your Raspberry Pi.

[Raspbian](https://www.raspberrypi.org/downloads/raspbian/)

Download raspbian buster lite (I personally download the ZIP and extract it onto my desktop)

Great you've now got all of the software and hardware to create your own Raspberry Pi Webserver headlessly! The beauty of doing this headlessly is that you don't have to worry about setting up a screen to your Raspberry Pi or even a keyboard, but you can use it as a fully functional server!

### Step 1

Go to the Raspbian link and download the ZIP. Once downloaded open up Etcher.

![Etcher](/assets/raspberrypi/images/Etcher.png)

Run etcher and select the downloaded image, this should be on your desktop that you can see and simply just select, after you have selected your image plug in your SD card reader and select that as your target providing it isn't automatically selected already.

Then simply press flash!

![Etcher flashed](/assets/raspberrypi/images/Etcher complete.png)

### Step 2 Connecting your Raspberry Pi to your router headlessly

Unplug the SD card reader and plug it back in go to "This PC" in your file explorer and go look for a driver called boot, my drive is (D:)

![Boot Drives](/assets/raspberrypi/images/Boot drives.png)

#### Setup Network

Create a file called: ```wpa_supplicant.conf``` put this in your boot drive. Adding this script below

```bash
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=«your_ISO-3166-1_two-letter_country_code»
network={
     ssid="«your_SSID»"
     psk="«your_PSK»"
     key_mgmt=WPA-PSK
}
```

The SSID is your network name (you can find that on your router), as well as your password what you use to connect to the WiFi.

Another thing to add to your boot(D:) is an empty ssh file that simply looks like this:

![Boot Drives](/assets/raspberrypi/images/ssh file without txt.png)

#### Finding your Raspberry Pi's IP address

Firstly you'll have to know what IP address your ISP uses. A quick google search and you should be able to find it.

Once in your router go to the connected devices there you should see the IP address of Raspberry Pi (should have a device name of raspberrypi).

Warning: This can take a couple of minutes on first load for the Raspbery Pi!

If it doesn't connect see troubleshooting

#### Raspberry Pi is connected and ready to go

Once you have the IP address you should be able to remote into your raspberry Pi, we do this by openning up PUTTY, type in the IP address of the Raspberry Pi and use port number 22, press open

#### Troubleshooting

Connect your rpi to a monitor with HDMI
Run "sudo raspi-config", see if there is a network interface
In my case I put the wrong ISO code in (UK), when it should of been (GB).

Enable SSH:
Add a file called ssh and ensure it's not got txt as the extension
Drag put this file into your boot drive (this enables SSH), which is turned off by default.
Creating a Raspberry Pi Ci/CD light switch

## Raspberry Pi 3 B+ vs Raspberry Pi 3 B v1.2

A key difference between these two is the Wi-Fi adapter, on the B+ it has a much more supported antenna that connects to 2.4GHz and 5Ghz, however with the 1.2 it will only connect to 2.4GHz so be careful!

Model B v1.2:

[Model B specs](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/)

Model b+:
[Model B+ Specs](https://www.raspberrypi.org/products/raspberry-pi-3-model-b-plus/)

[Model B+ Antenna](https://raspberrypi.stackexchange.com/questions/43306/does-pi3-wi-fi-support-5-ghz-and-does-it-need-an-extra-antenna)

## Conclusion

We've now setup a Raspbery Pi that can be used like a web server all for the price of £35, you can use this to practice setting up web sites and servers without having to buy hosting! Something to add to this is that it can be good practice to use this as a way of setting up a pre production server so you can see how your website will look before it's deployed to production!

More to come will be the different kinds of server stacks you can setup!

A couple Examples would be: MERN, LAMP and JAMstack

<section id="disqus_thread"></section>