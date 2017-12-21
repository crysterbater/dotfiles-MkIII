
import os

try :
    val = os.popen('playerctl status').read()
except :
    val = 0
    pass;

if val == "Playing\n" :
    print("%{F#A2D9B1}%{F-}")
else :
    print("")
