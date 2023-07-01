# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

stty -ixon      # disable ctrl-s and ctrl-g
shopt -s autocd # cd in dir by just typing name

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start
# a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Install Starship - curl -sS https://starship.rs/install.sh | sh
# commandline / prompt
eval "$(starship init bash)"

# enable color support of ls and also add handy aliases (set LS_COLORS)
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

#######################################################
# ALIASES
#######################################################

# used for backing up config files
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias ls="exa --group-directories-first"     # show hidden files
alias ll="exa -la --group-directories-first" # long listing format
alias tt="exa -T"                            # tree short
alias td="exa -TD"                           # tree directories only short

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

#if [ -f ~/.bash_functions ]; then
#    . ~/.bash_functions
#fi

#######################################################
# EXPORTS
#######################################################

export EDITOR=nvim
export VISUAL=nvim
export TERMINAL="alacritty"
export BROWSER="brave"
export LANG=en_US.UTF-8

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export LESSHISTFILE="-"

export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"

set -o vi # vi mode

# setup pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
