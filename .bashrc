# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Separated aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Seprated aliases
if [ -f ~/.bash_machine_specifics.sh ]; then
    . ~/.bash_machine_specifics.sh
fi

# Proto aliases
if [ -f dev/proto/.bash_aliases ]; then
    . dev/proto/.bash_aliases
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

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make terminal use 256 colors instead of 8 (it's for tput colors)
export TERM=xterm-256color

# To check supported current colors you can run:
#alias colors='for i in {1..256}; do tput setab 0; echo -n "$i:"; tput setab $i; echo; done; tput setab 0; echo;'
#alias colors='for i in {1..256}; do tput sgr 0; echo -n "$((i-1)):"; tput setab $i; echo; done; tput sgr 0; echo;'
alias colors_row='for i in {1..256}; do tput setab $i; echo -n "$((i-1))    "; done; tput sgr 0; echo;'
alias colors='msgcat --color=test'

# Sets cursor color (it's an escape sequence)
echo -ne '\e]12;magenta\a'
alias cursorfix="echo -ne '\e]12;magenta\a'"

# Colored man pages
# Less Colors for Man Pages
export LESS_TERMCAP_mb=$(printf '\E[01;31m'       ) # begin blinking
export LESS_TERMCAP_md=$(printf '\E[01;38;5;74m'  ) # begin bold
export LESS_TERMCAP_me=$(printf '\E[0m'           ) # end mode
export LESS_TERMCAP_se=$(printf '\E[0m'           ) # end standout-mode
export LESS_TERMCAP_so=$(printf '\E[38;5;246m'    ) # begin standout-mode - info box
export LESS_TERMCAP_ue=$(printf '\E[0m'           ) # end underline
export LESS_TERMCAP_us=$(printf '\E[04;38;5;146m' ) # begin underline
export GROFF_NO_SGR=1

# Disable Ctrl+S hanging terminal
stty -ixon

#################################################################
# PROMPT
#################################################################
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

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;31m\]\w\[\033[00m\]$(parse_git_branch)\$ '
unset color_prompt force_color_prompt

#+-------------------------------------------------------------------+
#  Sudo prefix
#+-------------------------------------------------------------------+
SUDO='';
# Check if user can run sudo and fill sudo var for aliases
CAN_RUN_SUDO=$(sudo -l -U $USER | grep NOPASSWD | wc -l)
if [ ${CAN_RUN_SUDO} -gt 0 ]
then
  SUDO='sudo '
  echo "Current user is a sudoer. Setting up aliases accordingly."
else
  echo "Current user is not a sudoer.  Setting up aliases accordingly."
fi

#################################################################
# DIRECTORY LISTING
#################################################################
LSUDO=''
# LSUDO=$SUDO
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls="${LSUDO}ls -I .. --color=auto"
  alias lal="${LSUDO}ls -I .. -lahF --color=auto"
  alias la="${LSUDO}ls -I .. -ahF --color=auto"
  #alias ls="${LSUDO}ls -I . -I .. --color=auto"
  #alias ls="${LSUDO}ls -I . -I .. --color=auto"
  #alias lal="${LSUDO}ls -I . -I .. -lahF --color=auto"
  #alias la="${LSUDO}ls -I . -I .. -ahF --color=auto"

  alias dir="${LSUDO}dir --color=auto"
  alias vdir="${LSUDO}vdir --color=auto"
else
  # Got from freebsd
  alias ls='ls -G' # TODO this -G hides group name from ls on FreeBSD. Need another switch
  alias lal='ls -G -lahF'
  alias la='ls -G -ahF'
fi

# To output only filenames use:
# mygrep -l
mygrep() {
  ${SUDO} grep -iRnI --color=always --exclude-dir={.git} $@ | nl;
}

# Faster access to bashrc
alias brc="vi ~/.bashrc"
alias brc_apply="source ~/.bashrc"

# Solving networking problems
alias dnsfix="${SUDO}sed -i 's/nameserver 127.[0-9].[0-9].[0-9]/nameserver 8.8.8.8/' /etc/resolv.conf"

grant_permissions() {
  for file in "$@"; do
    ${SUDO} chmod -R 755 $file;
    ${SUDO} chown -R mikhail:mikhail $file;
  done;
}

alias ports_usage="${SUDO}netstat -tulpn"

# Lists git directory with last commit info for each file
alias gitls='bash ~/dev/utilities/gitls/gitls'
#alias gitgraph='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gitgraph='git log --graph --decorate'
alias gitgraphol='git log --graph --decorate --oneline'

alias opengl_version='glxinfo | grep "OpenGL"';

alias distro="cat /etc/*-release"
alias list_non_system_users="awk -F: '$3 >= 500' /etc/passwd" # it may be not 500 but 1000. Gets users which GUID is greater than this number

alias ucfirst="perl -e 'for ( @ARGV ) { rename( $_, ucfirst $_ ) }' $1"
alias lcfirst="perl -e 'for ( @ARGV ) { rename( $_, lcfirst $_ ) }' $1"

alias formatjson="python -mjson.tool" # and write json filename. It will output formatted json data from the file specified.

alias emacs="emacs -nw" # Open emacs inside terminal (you're calling this alias in terminal, right). Suspend it with C-x C-z

# Display management
#alias resolution_restore='xrandr --output DVI-I-1 --auto'
alias resolution_restore='xrandr -s 1920x1080'
alias 1920='xrandr -s 1920x1080'
alias 1440='xrandr -s 1440x900'
alias 1280='xrandr -s 1280x720'
alias 1024='xrandr -s 1024x768'
alias 800='xrandr -s 800x600'

alias fixrate='xrandr --output HDMI-0 --mode 3840x2160 --rate 60'

#current_display=DVI-I-1
#current_display=eDP-1
current_display=HDMI-0
alias brightness_low="xrandr --output $current_display --brightness 0.5"
alias brightness_lowmedium="xrandr --output $current_display --brightness 0.75"
alias brightness_medium="xrandr --output $current_display --brightness 1"
alias brightness_high="xrandr --output $current_display --brightness 1.5"

#+-------------------------------------------------------------------+
#  Vim
#+-------------------------------------------------------------------+
set editing-mode vi
set keymap vi-command
alias vimdiff="vimdiff -O"
alias vi="vim -p"   # tabe / tabulated split
alias vim="vim -p"  # tabe / tabulated split
alias vimvs="vim -O" # vs / vsplit / vertical split
alias vimsplit="vim -o" # split / horizontal split

# Set vim as default text editor
export VISUAL=vim
export EDITOR=vim

alias vir="LC_ALL=ru_RU.cp1251 vi -p"

# Finds file with fzf and open it in vim
#fo() { find * -not -iwholename '*.git*' -not -iwholename '*.svn*' | fzf --height=10 --layout=reverse | xargs -ro vim; }
fo() {
    thefile=$(find * -not -iwholename '*.git*' -not -iwholename '*.svn*' | fzf --height=10 --layout=reverse);
    echo $thefile;
    vim $thefile;
}

alias todo='cd ~/dev/todo && vim ~/dev/todo/todo'

# True clear screen
alias cls='echo -en "\ec"'

alias perl_check_syntax_in_dir='for code in $(find . -type f -name "*.p[ml]"); do perl -c "$code"; done'

# multiple files replace. example:
# perl -i -pe 's/\!system/0 == system/'  daemon/*/*
alias perlipe='perl -i -pe'
# Use perl debugger as repl with command history
alias repl='rlwrap perl -de1'

# Check cron files syntax
croncheck() {
  echo;
  echo "Backing up cron using command:";
  echo "crontab -l > backup.cron";
  crontab -l > backup.cron;
  echo;

  echo "Checking syntax of input files..."

  for item in "$@"; do
    echo;
    echo "crontab $item"
    if crontab "$item"; then
      echo "$item syntax is correct";
    else
      echo "$item ERROR";
    fi
  done;

  echo;
  echo "Reverting backed up data:";
  echo "crontab backup.cron";
  crontab backup.cron;

  echo;
  echo "Removing backup:";
  echo "rm backup.cron";
  rm backup.cron;
  echo;
}

# msys for Git Bash
if [ $OSTYPE = 'windows' ] || [ $OSTYPE = 'msys' ]; then
  alias loadkeys='eval `ssh-agent -s`; ssh-add /home/mikhail/.ssh/mygithubkey' # seems obsolete
  # Permanently add keys to ssh in Git Bash. Got it here: https://help.github.com/articles/working-with-ssh-key-passphrases/#auto-launching-ssh-agent-on-git-for-windows
  env=~/.ssh/agent.env

  agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

  agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

  agent_load_env

  # agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
  agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

  add_all_keys () {
    for key in `ls ~/.ssh/*rsa* ~/.ssh/*key* | grep -v ".pub"`
    do
      ssh-add $key
    done
  }

  if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
  fi
  add_all_keys

  unset env


  #################################################################
  # Windows (Git Bash)
  #################################################################
  # Func to permanently add paths to $PATH on windows
  pathadd () {
    for new_path in "$@"; do
      setx path "%path%;$new_path"
    done
  }
fi

# Colored tree output
alias tree="tree -C -a -I '.git|.svn'"

unset SSH_ASKPASS

alias passgen='cat /dev/urandom | tr -dc A-Za-z0-9 | head -c16 && echo'

NO_AT_BRIDGE=1 # disable at-spi dbus (accessibility feature)
alias sx='startxfce4'

alias calendar='cal -ym'

# Make specific mouse to be Left/Right handed
MOUSE_TITLE=sinowealth
MOUSE_TITLE=lightsync
alias mousel='xinput set-button-map $(xinput list | grep -i $MOUSE_TITLE | grep -vi keyboard | grep pointer | grep -oP "id=\d+" | grep -oP "\d+") 3 2 1'
alias mouser='xinput set-button-map $(xinput list | grep -i $MOUSE_TITLE | grep -vi keyboard | grep pointer | grep -oP "id=\d+" | grep -oP "\d+") 1 2 3'

alias fuckon='echo "1" > /mnt/data2/dev/thefucker/isfuckeron.bool && echo "The fucker is on"'
alias fuckoff='echo "0" > /mnt/data2/dev/thefucker/isfuckeron.bool && echo "The fucker is off"'

#+-------------------------------------------------------------------+
#  ranger_cd copied from /usr/share/doc/ranger/config/scope.sh
#+-------------------------------------------------------------------+
# shellcheck shell=sh

# Compatible with ranger 1.4.2 through 1.9.*
#
# Automatically change the current working directory after closing ranger
#
# This is a shell function to automatically change the current working
# directory to the last visited one after ranger quits. Either put it into your
# .zshrc/.bashrc/etc or source this file from your shell configuration.
# To undo the effect of this function, you can type "cd -" to return to the
# original directory.

ranger_cd() {
    temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
    ranger --choosedir="$temp_file" -- "${@:-$PWD}"
    if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
        cd -- "$chosen_dir"
    fi
    rm -f -- "$temp_file"
}

# This binds Alt-e (\e is alt, and e is letter e) to ranger_cd:
bind '"\ee":"ranger_cd\C-m"'

alias news="newsboat"

function getsrc()
{
    asp export $1 && \
    pushd $1 && \
    makepkg -do --skippgpcheck && \
    pushd src
}

alias pi="$HOME/.venv/bin/pip" # NOTE pyt alias resides in .bash_aliases (to be loaded via .vimrc)

function nginx_modules()
{
    nginx -V 2>&1 | sed -e 's/ /\n/g' | grep module | sed -e 's/--with-//'
    # same in perl:
    #perl -e 'for ( split /\s+/, `nginx -V 2>&1` ) { next unless /module/; s/--with-//; print "$_\n" }'
}

#+-------------------------------------------------------------------+
#  Unused
#+-------------------------------------------------------------------+
# alias bc="bc -l"
# alias tmux="tmux -2" # Force tmux assume 256 color support
# alias sizeof="du -hs"
# alias kill="kill -9"

alias yt-dlp='yt-dlp --proxy="socks5://127.0.0.1:8080"'
#alias curl='curl --proxy socks://127.0.0.1:8080'
#alias curl='curl -x socks4://127.0.0.1:8080'

function epochconv()
{
    # date -Iseconds -d @$1
    date -d @$1 +%Y-%m-%d\ %H:%M:%S\ %Z
}

alias quiklogs="tail -f -n50 /var/log/trading/*.log"
#alias byedpi="ciadpi -p 8080 --disorder 1 --auto=torst --tlsrec 1+s"
#alias byedpi="ciadpi -p 8080 --fake -1 --ttl 10 --auto=ssl_err --fake -1 --ttl 5"
#alias byedpi="ciadpi -p 8080 --fake -1 --ttl 5 --auto=ssl_err --fake -1 --ttl 5"
alias byedpi="ciadpi -p 8080 -s0 -o1 -Ar -o1 -At -f-1 -r1+s -As --ttl 5"

alias discord="nohup ssh -D8080 proxy_server & http_proxy=socks5://127.0.0.1:8080 https_proxy=socks5://127.0.0.1:8080 discord --proxy-server='socks5://127.0.0.1:8080'"
alias perlgame="perl $HOME/dev/perl-game/run.pl"
