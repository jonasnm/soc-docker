#!/bin/bash

mkdir -p /root/.vnc \
x11vnc -storepasswd "1234" /root/.vnc/passwd \
# Password is "1234" -- couldnt get the above in interactive mode working
#echo "7lsOSMj+l3E=" | base64 > /root/.vnc/passwd \

DISPLAY=:1.0 \
 && export DISPLAY \
 && Xvfb :1 -screen 0 493x476x8 & \
 x11vnc -display :1.0 -usepw -forever -create &

