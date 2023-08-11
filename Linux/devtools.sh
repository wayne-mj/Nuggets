#!/bin/sh

if [ ! -e ".devtools" ]; then
 echo Ensuring system is up to date ...
 sudo apt update && sudo apt upgrade -y

 echo Adding the following packages:
 echo wget curl gpg apt-transport-https git neofetch ca-certificates htop build-essential cmake keepassxc tmux

 echo Pausing for 5 seconds ...
 sleep 5

 sudo apt install -y wget curl gpg apt-transport-https git neofetch ca-certificates htop build-essential cmake keepassxc tmux

 echo Adding Microsoft key
 wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
 [ -e packages.microsoft.gpg ] && {
  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

  echo Downloading repository package
  wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
  [ -e packages-microsoft-prod.deb ] && sudo dpkg -i packages-microsoft-prod.deb

  echo Adding Repository for VS Code
  sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] \
  https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

  echo Updating repositories
  sudo apt update

  echo Installing Dotnet 6.0 SDK, VS Code and Azure CLI
  sudo apt install -y code dotnet-sdk-6.0 azure-cli
 }

 echo Install Github CLI
 type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
 curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
 && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
 && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] \
 https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
 && sudo apt update \
 && sudo apt install gh -y

 echo Install AWS Cli
 curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
 [ -e awscliv2.zip ] && {
  unzip awscliv2.zip
  sudo ./aws/install
 }

 echo Adding NeoFetch to bashrc
 echo "[ -x /usr/bin/neofetch ] && /usr/bin/neofetch" >> ~/.bashrc

 echo Completed ...
 touch .devtools
else
 echo Process has alredy been run.
 echo Delete the file: ~/.devtools to run again.
fi
