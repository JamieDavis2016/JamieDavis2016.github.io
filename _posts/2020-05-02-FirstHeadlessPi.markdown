

Creating a Raspberry Pi Webserver
Time to do: 30 minutes

Requirements:
A raspberry Pi (preferably V3 B+), if not V2 with a Network Adapter
sd card reader:
https://www.amazon.co.uk/gp/product/B001JPPQS6/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1
Raspberry Pi: 
https://www.amazon.co.uk/Raspberry-Pi-3-Model-B/dp/B07BDR5PDW/ref=sr_1_3?dchild=1&keywords=raspberry+pi+3&qid=1588410760&s=computers&sr=1-3
A micro usb cable:
https://www.amazon.co.uk/AmazonBasics-Male-Micro-Cable-Black/dp/B0719H12WD/ref=sr_1_1_sspa?crid=1S0O4UP1UH3VO&dchild=1&keywords=micro+usb+cable&qid=1588410802&s=computers&sprefix=micro+usb+%2Ccomputers%2C173&sr=1-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUFDVDVFVFRZUks5MzcmZW5jcnlwdGVkSWQ9QTAxODg4MDMzN1cwSjk4VTFUUTRRJmVuY3J5cHRlZEFkSWQ9QTAyODQ0NjkxV1pMVldXQThSOVM3JndpZGdldE5hbWU9c3BfYXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ==
And optionally a HDMI cable:
https://www.amazon.co.uk/Lead-Snowkids-Compatible-Support-Ethernet-Function-Grey-HDMI-cable/dp/B07GYS426K/ref=sr_1_1_sspa?crid=2PQBC94O6JNW8&dchild=1&keywords=hdmi+cable&qid=1588410819&s=computers&sprefix=hdmi%2Ccomputers%2C164&sr=1-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUExTVpCS1FBUjVLSDFLJmVuY3J5cHRlZElkPUEwOTQ1ODU1T1NQTTg0TTNUTjVEJmVuY3J5cHRlZEFkSWQ9QTA5ODEyOTUxMk1XRkpWSENHTzhLJndpZGdldE5hbWU9c3BfYXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ==

Raspberry Pi 3 B+ vs Raspberry Pi 3 B v1.2
wifi adapter
Model b:
https://www.raspberrypi.org/products/raspberry-pi-3-model-b/
https://raspberrypi.stackexchange.com/questions/43306/does-pi3-wi-fi-support-5-ghz-and-does-it-need-an-extra-antenna
Model b+:
https://www.raspberrypi.org/products/raspberry-pi-3-model-b-plus/

https://raspberrypi.stackexchange.com/questions/43306/does-pi3-wi-fi-support-5-ghz-and-does-it-need-an-extra-antenna

Software:
Etcher.io
https://www.balena.io/etcher/

Putty:
https://www.putty.org/

Raspbian
Download raspbian buster lite
(personally download ZIP)

Step 1:
Once downloaded the image and a way of flashing the SD card (Etcher.io)
Run etcher and select the downloaded image, once that's selected also plug in your SD card reader into the PC and select that as the target
Then simply press flash!

Step 2: (If you don't want to use the HDMI cable as well as a desktop image on your raspberry Pi): 
Unplug the sc card reader and plug it back in
Go to "This PC" in your file explorer
And go to Boot mine is (D:)

Setup Network:
Create a file called: wpa_supplicant.conf
Put this in your Boot

ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=«your_ISO-3166-1_two-letter_country_code»
network={
     ssid="«your_SSID»"
     psk="«your_PSK»"
     key_mgmt=WPA-PSK
}

You can go to your router by finding the IP address of the broadband you're with, for the sake of this article you'll have to google that. 
Go to your router and see IP address of Raspberry Pi, 
Can take a couple of minutes on first load!

If it doesn't connect see troubleshooting:

This is where the fun starts
Once you have the IP address you can remote into your raspberry Pi, open up PUTTY, type in the IP address of the Raspberry Pi and use port number 22, press open

(pinging the ip address from cmd with ping -t <IP address>)


Enable SSH:
Add a file called ssh and ensure it's not got txt as the extension
Drag put this file into your boot drive (this enables SSH), which is turned off by default.


That's the first step complete, you now have raspbian on an sd card 

troubleshooting: Connect your rpi to a monitor with HDMI
Run "sudo raspi-config", see if there is a network interface
In my case I put the wrong ISO code in (UK), when it should of been (GB).




Creating a Raspberry Pi Ci/CD light switch