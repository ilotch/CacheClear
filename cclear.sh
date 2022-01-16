#!/bin/bash

if [ "$EUID" -ne 0 ] 
  then 
clear
 echo -e "\033[31mRun the command as administrator. [sudo bash ./cclear.sh]\033[0m"
  exit
fi 
clear

echo -e """
        \033[33mDeveloper: github.com/zaclol0\033[0m
        \033[31mCommunity: t.me/izlegal\033[0m
        """
echo -e "\033[33mSystem ID:\033[0m"
hostnamectl
echo -e "\033[32m--------------------------------------------------\033[0m"

echo -e "\033[33;3mUpdating packages...\033[0m"
sudo apt update && sudo apt upgrade -y
echo -e "\033[32mPackages have been updated.\033[0m"
echo
echo -e "\033[33mClearing ram space... Please wait...\033[0m"

sudo sysctl vm.drop_caches=1
sudo sysctl vm.drop_caches=2
sudo sysctl vm.drop_caches=3
echo -e "\033[33mRAM cache cleared.\033[0m"
echo -e "--------------------------------------------------"
echo -e "\033[33mRepeat any commands you don't use systemd.\033[0m"
echo -e "\033[35msync; echo 1 > /proc/sys/vm/drop_caches\033[0m"
echo -e "\033[35msync; echo 2 > /proc/sys/vm/drop_caches\033[0m"
echo -e "\033[35msync; echo 3 > /proc/sys/vm/drop_caches\033[0m"
echo -e "--------------------------------------------------"

echo -e "\033[32mUnnecessary packages are removed...\033[0m"
sudo apt autoremove -y 
sudo apt --fix-broken install -y

clear
echo -e "\033[32mRam Traffic:\033[0m"
sleep 3
echo -e "--------------------------------------------------------------------------------"
free -h
echo -e "--------------------------------------------------------------------------------"

echo -e "\033[32;5mClean Up Complete.\033[0m"
sudo sh -c "/usr/bin/echo 3 > /proc/sys/vm/drop_caches"