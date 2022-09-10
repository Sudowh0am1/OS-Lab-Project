#!/bin/bash
# Project 1 - OS Lab


system_general_information(){
echo "1- System Kernel name, version and release: "
uname -s -v -r
echo
echo "--------------------------------------------"
echo "2- GCC compiler version: "
gcc --version
echo
echo "--------------------------------------------"
echo "3- Number of  active processes: "
ps -e | wc -l
echo
echo "--------------------------------------------"
echo "4- Up time and load time: "
uptime
echo
echo "--------------------------------------------"
echo "5- Processes with the highest CPU usage: "
ps -auxk -%cpu | head -n 15
echo
}

"$@"

system_security_information(){
echo "--------------------------------------------"
echo "1- Active users:";
w
echo
echo "--------------------------------------------"
echo "2- Group systems:";
getent group
echo
echo "--------------------------------------------"
echo "3- Softwars installed on a system:";
apt list --installed
echo
echo "--------------------------------------------"
echo "4- Last system update:";
ls -l /var/lib/apt/periodic/update-success-stamp | awk '{print $6" "$7" "$8}'
echo
}

system_hardware_information(){
echo "--------------------------------------------"
echo "1- Processor Details: ";
lscpu
echo
echo "--------------------------------------------"
echo "2- Memory Details: ";
sudo lshw -short -C memory
echo
echo "--------------------------------------------"
echo "3- USB Devices Details: ";
lsusb
echo
echo "--------------------------------------------"
echo "4- BIOS Details: ";
sudo dmidecode -t bios
echo
}

echo "Please choose an option : "
echo "1- system general information"
echo "2- system scurity information"
echo "3- system hardware information"
echo "4- exit"
read numb

if [ $numb -eq 4 ]
then
        exit 0
else
        if [ $numb -eq 1 ]
        then
                system_general_information
        elif [ $numb -eq 2 ]
        then
                system_security_information
        elif [ $numb -eq 3 ]
        then
                system_hardware_information
        fi
fi

