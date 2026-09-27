import serial
import time

# Connect to COM10 port on your PC
try:
    ser = serial.Serial('COM10', baudrate=115200, timeout=1)
    print("Connected to COM10 successfully!")
except Exception as e:
    print(f"Error connecting to COM10: {e}")
    exit()

while True:
    cmd = input("Type 'on' or 'off': ").strip().lower()
    
    if cmd == "on":
        ser.write(bytes([0xAB]))
        print("Sent LED ON command (0xAB)")
    elif cmd == "off":
        ser.write(bytes([0xFF]))
        print("Sent LED OFF command (0xFF)")
    else:
        print("Invalid input, type 'on' or 'off'")
    
    time.sleep(0.2)
