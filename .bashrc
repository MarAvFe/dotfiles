# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
HISTCONTROL=ignoreboth   # don't record dupes or space prefixed lines
shopt -s histappend      # append to history
HISTSIZE=99000
HISTFILESIZE=21000
shopt -s checkwinsize    # check window size every command and update LINES and COLUMNS if needed
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)" # friendly less

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [ -f ~/.bash_secrets ]; then
    . ~/.bash_secrets
fi

if [ -f ~/dotfiles/.bash_ps1 ]; then
    . ~/dotfiles/.bash_ps1
fi

if [ -f ~/dotfiles/.bash_aliases ]; then
    . ~/dotfiles/.bash_aliases
fi

# https://sneak.berlin/20191011/stupid-unix-tricks/
# do not edit this file. put files in the dir below.
for FN in $HOME/.local/bashrc.d/*.sh ; do
	source "$FN"
done


