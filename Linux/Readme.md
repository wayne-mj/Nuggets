## System setup scripts

An eventual collection of shell scripts and documentation to setup a new system.

### Devtools shell script

Installs the following dependencies and tools
- wget curl gpg apt-transport-https git neofetch ca-certificates htop build-essential cmake keepassxc tmux

Configures the Microsoft Debian repository for regular release software and VS Code.

Installs Azure CLI, .Net SDK 6.0, and VS Code

Configures Github repository and installs the Github CLI.

Downloads and installs the AWS CLI v2.

Adds NeoFetch to ~/.bashrc.

### Additional setup steps and notes

[Node Version manager](https://github.com/nvm-sh/nvm)


VS Code extensions
```bash
cat code-extensions.txt | xargs -L 1 code --install-extension
```