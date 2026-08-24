# Shrike-Fi-Board-Projects
link for Shrike Lite examples (not Shike -Fi FPGA board)

https://vicharak-in.github.io/shrike/examples.html

----------------------------------------------------------
Instructions for Programming Shrike Fi Board 

<img width="4130" height="4214" alt="shrike_fi_pinouts" src="https://github.com/user-attachments/assets/57a61fe3-4c52-441b-bc6b-106d17314209" />

shrike fi pins and documentation

https://github.com/vicharak-in/shrike/blob/main/docs/PLATFORM_AGNOSTIC_FIRMWARE_GUIDE.md

firmware  links for shrike fi fpga and shrike lite fpga

https://github.com/vicharak-in/shrike/releases/
-------------------------------------------------------
install this shrike-fi-micropython.bin firmware for getting thonny ide support for burning firmware

https://github.com/vicharak-in/shrike/blob/main/docs/shrike_fi.md

python -m venv myenv

myenv\Scripts\activate

pip install esptool

python -m esptool --chip esp32s3 -b 460800 --before default_reset --after hard_reset write_flash --flash_mode dio --flash_size 4MB --flash_freq 80m 0x0 shrike-fi-micropython.bin

--------------------------------------------------------------------
In Thonny programming the fpga bin file (select micropython esp32)

Connect the Shrike-fi to your computer without holding the BOOT button.
Connect to the board in Thonny.

Open View → Files.
Find your FPGA_bitstream_MCU ( .bin ) file of the verilog code which is generated  
Right-click the .bin → Upload to / so it is copied onto the Shrike-fi filesystem.

--------------------------------------------------------------------
Create a Python file containing and store it in shrikefi board

import shrike

shrike.flash("FPGA_bitstream_MCU ")

print("FPGA programmed")



