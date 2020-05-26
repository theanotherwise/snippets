```bash
cat >~/.bashrc <<EOL
# Sources
 
# Variables
PS1="[\[\e[31m\]\u\[\e[m\]][\l]@[\[\e[1;34m\]\h\[\e[m\]][\[\e[1;36m\]\W\[\e[m\]]# "
HISTTIMEFORMAT="%Y-%m-%d %T "
 
# Aliases
alias ls='ls --color=auto --hide=".*"'
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rmdir='rmdir -v'
 
# Exports
export PS1
export HISTTIMEFORMAT
EOL
```

```bash
cat >~/.bash_profile <<EOL
# Sources
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi
 
# Variables
#PATH=$PATH
 
# Settings
#umask 0022
 
# Exports
#export PATH
EOL
```

```bash
mkdir -p ~/archives
mkdir -p ~/bluetooth
mkdir -p ~/captures/pictures
mkdir -p ~/captures/videos
mkdir -p ~/cheat-sheets
mkdir -p ~/configuration
mkdir -p ~/configuration/konsole
mkdir -p ~/configuration/konsole/sessions
mkdir -p ~/dashcam
mkdir -p ~/desktop
mkdir -p ~/documents
mkdir -p ~/downloads
mkdir -p ~/ebooks
mkdir -p ~/git
mkdir -p ~/iso-images
mkdir -p ~/music
mkdir -p ~/pictures
mkdir -p ~/pictures/wallpaper
mkdir -p ~/scripts
mkdir -p ~/portable
mkdir -p ~/projects
mkdir -p ~/captures
mkdir -p ~/temporary
mkdir -p ~/videos
mkdir -p ~/virtual-machines
mkdir -p ~/word-lists
mkdir -p ~/work

mkdir -p ~/virtual-machines/vmware
mkdir -p ~/virtual-machines/vmware/archives
mkdir -p ~/virtual-machines/vmware/templates
mkdir -p ~/virtual-machines/vmware/workspace

mkdir ~/projects/android
mkdir ~/projects/ansible
mkdir ~/projects/bash
mkdir ~/projects/burp
mkdir ~/projects/c
mkdir ~/projects/cpp
mkdir ~/projects/helm
mkdir ~/projects/html
mkdir ~/projects/java
mkdir ~/projects/javscript
mkdir ~/projects/kde-plasma
mkdir ~/projects/node.js
mkdir ~/projects/php
mkdir ~/projects/puppet
mkdir ~/projects/python
mkdir ~/projects/python/2
mkdir ~/projects/python/3
mkdir ~/projects/ruby
mkdir ~/projects/ruby-on-rails
mkdir ~/projects/soupui
mkdir ~/projects/wsdl
mkdir ~/projects/wsdl
mkdir ~/projects/xca
mkdir ~/projects/zabbix
mkdir ~/projects/others
```
