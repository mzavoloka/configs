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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='sudo ls -I .. --color=auto'
    alias lal='sudo ls -I .. -lahF --color=auto'
    alias la='sudo ls -I .. -ahF --color=auto'
    #alias ls='sudo ls -I . -I .. --color=auto'
    #alias lal='sudo ls -I . -I .. -lahF --color=auto'
    #alias la='sudo ls -I . -I .. -ahF --color=auto'

    alias dir='sudo dir --color=auto'
    alias vdir='sudo vdir --color=auto'

fi

# To output only filenames use:
# mygrep -l
mygrep() {
  sudo grep -iRnI --color=always --exclude-dir={.git} $@ | nl;
}

#alias myfind="sudo find . -iname '$@'"
alias myfind="perl ~/dev/utilities/myfind/myfind.pl"




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

# Colored man pages
# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Programs aliases
alias brc="vi ~/.bashrc"
alias brc_apply="source ~/.bashrc"
alias today="ncal -Mb 2016"

alias sdo="ssh -Y mikhail@188.166.53.139"
alias sdo_root="ssh -Y root@188.166.53.139"
alias sis="ssh -Y mikhail@104.160.37.229"
alias sisroot="ssh -Y root@104.160.37.229"
alias pingsis="ping -c 4 104.160.37.229"

# Works only from dormitory's dubki7 network
alias spc="ssh -Y mikhail@192.168.81.188" # ip may be changed anytime
alias resnet="sudo service network-manager restart;
echo 'consider using the following commands:';
echo 'sudo ifdown wlan0 && sudo ifup wlan0';
echo 'or these commands:'
echo 'sudo ifconfig wlan0 down && sudo ifconfig wlan0 up';
"

alias dnsfix="sudo sed -i 's/nameserver 127.[0-9].[0-9].[0-9]/nameserver 8.8.8.8/' /etc/resolv.conf"

alias brightness_low="xrandr --output DVI-I-1 --brightness 0.5"
alias brightness_medium="xrandr --output DVI-I-1 --brightness 1"

alias apacher="sudo service apache2 restart"

alias taillog="sudo tail -f /var/log/apache2/error.log"
alias pg="psql -U wendy -d wendysdb -h localhost"

alias autoremove="sudo apt-get autoremove"
alias update="sudo apt-get update"
alias upgrade="sudo apt-get dist-upgrade"
alias autoremove="sudo apt-get autoremove"

# TODO Rewrite it to support set of files instead of .
alias grant_permissions="sudo chmod -R 755 .; sudo chown -R mikhail:mikhail ."



rem() {
  echo "Use trash utility to trash files!";
}

remove() {
  for item in "$@";
    do echo "sudo apt-get remove --purge $item";
    sudo apt-get remove --purge "$item";
  done;
}

install() {
  for item in "$@";
    do echo "sudo apt-get install $item";
    sudo apt-get install "$item";
  done;
}

upgrades_available() {
  echo "UPGRADES AVAILABLE:";
  sudo apt-get --just-print upgrade 2>&1 | perl -ne 'if (/Inst\s([\w,\-,\d,\.,~,:,\+]+)\s\[([\w,\-,\d,\.,~,:,\+]+)\]\s\(([\w,\-,\d,\.,~,:,\+]+)\)? /i) {print "PROGRAM: $1 INSTALLED: $2 AVAILABLE: $3\n"}' | column -t;
}

# Sets cursor color (it's an escape sequence)
echo -ne '\e]12;magenta\a'
alias cursorfix="echo -ne '\e]12;magenta\a'"


alias loadkeys='eval `ssh-agent -s`; ssh-add /home/mikhail/.ssh/mygithubkey'


# Make terminal use 256 colors instead of 8 (it's for tput colors)
export TERM=xterm-256color

# To view current colors you can run:
#alias colors='for i in {1..256}; do tput setab 0; echo -n "$i:"; tput setab $i; echo; done; tput setab 0; echo;'
alias colors='for i in {1..256}; do tput sgr 0; echo -n "$((i-1)):"; tput setab $i; echo; done; tput sgr 0; echo;'
alias colors_row='for i in {1..256}; do tput setab $i; echo -n "$((i-1))    "; done; tput sgr 0; echo;'

alias linux_setup='vi ~/dev/configs/linux_setup'

#alias chrome_proxy='google-chrome-unstable --proxy-server=37.187.117.157:3128'
#alias chrome_proxy='google-chrome-unstable --proxy-server=45.32.43.100:3128'
alias chrome_proxy='google-chrome-unstable --proxy-server=188.40.62.138:80'

alias samba_restart='sudo service smbd restart; sudo service nmbd restart'

# Lists git directory with last commit info for each file
alias gitls='bash ~/dev/utilities/gitls/gitls'
alias gitgraph='git log --graph --full-history --all --color
                        --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

alias opengl_version='glxinfo | grep "OpenGL"';

alias ports_usage='sudo netstat -tulpn';

alias omni='mono /home/mikhail/.vim/bundle/omnisharp-vim/server/OmniSharp/bin/Debug/OmniSharp.exe -p 2000 -s $PWD';

alias diary="cd /mnt/winserv2012/data/diary"

alias dotacfg='cd "/home/mikhail/.steam/steam/steamapps/common/dota 2 beta/game/dota/cfg"; vi autoexec.cfg'

alias killdota="pkill --signal 9 dota"

alias kamfolder="cd ~/.wine/drive_c/KaM\ Remake"
alias kammapsmp="cd ~/.wine/drive_c/KaM\ Remake/MapsMP/"
alias kammapsdl="cd ~/.wine/drive_c/KaM\ Remake/MapsDL/"

alias distribution_version="cat /etc/*-release"
alias list_non_system_users="awk -F: '$3 >= 500' /etc/passwd" # it may be not 500 but 1000. Gets users which GUID is greater than this number

alias sizeof="du -hs $@"

alias ucfirst="perl -e 'for ( @ARGV ) { rename( $_, ucfirst $_ ) }' $1"
alias lcfirst="perl -e 'for ( @ARGV ) { rename( $_, lcfirst $_ ) }' $1"

alias formatjson="python -mjson.tool" # and write json filename. It will output formatted json data from the file specified.

alias emacs="emacs -nw" # Open emacs inside terminal (you're calling this alias in terminal, right). Suspend it with C-x C-z

################################################################################
######################### UNIQUE FOR THIS MACHINE ##############################
################################################################################

alias vir="LC_ALL=ru_RU.cp1251 vi -p"
alias experts="cd ~/.PlayOnLinux/wineprefix/MT4/drive_c/Program\ Files\ \(x86\)/MetaTrader\ 4/MQL4/Experts/"


alias mthotkeys="(evince ~/trade/mt4_hotkey_sheet.pdf &)"

alias errlog="tail -f /var/log/apache2/error.log"

# Files aliases
alias sem1="cd /mnt/2tbdisk/_misha/hse/1\ семестр/"
alias sem2="cd /mnt/2tbdisk/_misha/hse/2\ семестр/"
alias odesk="cd /mnt/2tbdisk/_misha/oDesk/"
alias misha="cd /mnt/2tbdisk/_misha/"
alias windocs='cd "/home/mikhail/.wine/drive_c/users/mikhail/My Documents"'
alias learn_unity='cd "/home/mikhail/.wine/drive_c/users/mikhail/My Documents/learn_unity"'

alias unity="(wine /mnt/winserv2008d/Program\ Files\ \(x86\)/Unity/Editor/Unity.exe &)"

# 2tbdisk
alias private="cd /mnt/2tbdisk/_private/"
alias photo="cd /mnt/2tbdisk/_private/photo"
alias ins="cd /mnt/2tbdisk/ins/"
alias books="cd /mnt/winserv2008d/Книги/"
alias music="cd /mnt/2tbdisk/audio/music/"
alias audiobooks="cd /mnt/2tbdisk/audio/audiobooks/"
alias video="cd /mnt/2tbdisk/video/films/"
alias share="cd /mnt/2tbdisk"
alias debian="cd /mnt/debian"
alias wind="cd /mnt/winserv2008d"

alias playaudio="sudo /home/mikhail/playaudio"
alias metatrader="wine \"/mnt/debian/home/mikhail/.wine/drive_c/Program Files/MetaTrader 4/terminal.exe\" &"

alias schedule="(evince -f /mnt/2tbdisk/_misha/hse/2\ семестр/schedule.pdf &)"
alias schedule_bus="(evince -f /mnt/2tbdisk/_misha/hse/dormitory/schedule_bus.pdf &)"
alias schedule_trains_from_Odintsovo="(evince -f /mnt/2tbdisk/_misha/hse/dormitory/schedule_trains_from_Odintsovo.pdf &)"
alias schedule_trains_from_Moscow="(evince -f /mnt/2tbdisk/_misha/hse/dormitory/schedule_trains_from_Moscow.pdf &)"

# Games aliases
alias commandos3="(wine /home/mikhail/.wine/drive_c/Program\ Files/Eidos/Pyro\ Studios/Commandos\ 3\ -\ Destination\ Berlin/commandos3.exe &)"
alias robinhood='(wine ~/.wine/drive_c/Program\ Files/Strategy\ First/Robin\ Hood/Robin\ Hood.exe &)'
alias robinhood2='(wine explorer /desktop=RobinHood,1920x1080 ~/.wine/drive_c/Program\ Files/Strategy\ First/Robin\ Hood/Robin\ Hood.exe -opengl -console &)'
alias commandos2="(wine explorer /desktop=Commandos2,1920x1080 ~/.wine/drive_c/Program\ Files/Commandos\ II/comm2.exe -opengl -console &)"
alias commandos22="(wine ~/.wine/drive_c/Program\ Files/Commandos\ II/comm2.exe &)"
alias resolution_restore='xrandr --output DVI-I-1 --auto'


set editing-mode vi
set keymap vi-command

[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


alias vimdiff="vimdiff -O"
alias vi="vim -p"
alias vim="vim -p"
