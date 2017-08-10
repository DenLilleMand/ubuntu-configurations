#!/usr/bin/env bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias google='google-chrome & disown'
alias messenger='messengerfordesktop & disown'
alias vlc='vlc & disown'
alias rider='rider.sh /home/denlillemand/Documents/esportshub/esportshubapi/Esporthub/Esporthub.sln & disown'
alias mssql="sqlcmd -S localhost -U SA -P 'Denlilleiceman20!'"
alias develop="flatpak run com.xamarin.MonoDevelop & disown"
alias uml="umlet & disown"
alias dropbox="~/.dropbox-dist/dropboxd & disown"
alias todo="todo2 --order=completed "
alias datagrip="datagrip.sh & disown"
alias toomuch="sudo du --max-depth=5 /* | sort -rn"
alias record="recordmydesktop"
alias phpstorm="phpstorm.sh & disown"
alias maple="cd ~/maple2017/bin && ./xmaple & disown"
alias cdtodo="cd ~/gotime/src/github.com/denlillemand/devtodo2"
alias cduni="cd ~/Documents/ku/university"


#setting vi mode in the terminal(AWESOME)
set -o vi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



SCALA_HOME="/usr/local/share/scala"
PHPSTORM_HOME="/home/denlillemand/Documents/IDE/phpstorm"
INTELLIJ_HOME="/home/denlillemand/Documents/IDE/intellij"
RIDER_HOME="/home/denlillemand/Documents/IDE/rider"
GRADLE_HOME="/usr/bin/gradle"
GO_HOME="/usr/local/go"
GOGLAND_HOME="/home/denlillemand/Documents/IDE/gogland"
DATAGRIP_HOME="/home/denlillemand/Documents/IDE/datagrip"

export PATH=$PATH:/home/denlillemand/Documents/Postman

export GOPATH=$HOME/gotime
export PATH=$PATH:$GO_HOME/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$DATAGRIP_HOME/bin

export PATH=$PATH:$GRADLE_HOME
export PATH=$PATH:$SCALA_HOME/bin
export PATH=$PATH:$PHPSTORM_HOME/bin
export PATH=$PATH:$INTELLIJ_HOME/bin
export PATH=$PATH:$RIDER_HOME/bin
export PATH=$PATH:$GOGLAND_HOME/bin
export PATH=$PATH:$GOPATH/src/github.com/denlillemand/blog

#Alias using GOPATH declared right above
alias cera="$GOPATH/src/github.com/ceraorg/ceraordre/scripts/cera.sh"
alias cdcera="cd $GOPATH/src/github.com/ceraorg/ceraordre"


export PAGER='vim -R -u ~/.vimrcpg -'
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
export LESS=eFRX

export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim
export PSQL_EDITOR=/usr/bin/vim 

#colors
export TERM="xterm-256color"


# Path to the bash it configuration
export BASH_IT="/home/denlillemand/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='powerline'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt




# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1


#Print out cool stuff
figlet DenLilleMand
#my .neofetch file should be found in github.com/denlillemand/ubuntu_configurations/neofetch/neofetch
#neofetch --config /home/denlillemand/.neofetch --ascii_distro Arch Linu
neofetch --config /home/denlillemand/neofetch/neofetch.conf 

# Load Bash It
source $BASH_IT/bash_it.sh
