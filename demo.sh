#! /bin/bash

echo " Enter location of file"
read FROM

echo " Enter destination of file"

read TO

echo "Press enter to execute"|

scp -r demo@demo-VirtualBox:$FROM $TO



