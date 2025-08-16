#!/bin/bash
# Sudoshell will allow a new shell session to preserve your `sudo` credentials
# This effectvely overrides `sudo`, allowing you to specify `sudo` as a command prefix without re-entering your credentials
# It does this by prompting you once, upon a new shell session, for your sudo credentials, then caching those credentials in a bash alias

# Add the following to your ~/.bashrc
read -s -p "Enter password: " xpasswd
alias sudo="echo ${xpasswd} | sudo -S ls &>/dev/null && sudo"
clear
