#!/bin/bash

# Add this to your ~/.bashrc
read -s -p "Enter password: " xpasswd
alias update="sudo yum -y update"
alias sudo="echo ${xpasswd} | sudo -S ls &>/dev/null && sudo"
clear
