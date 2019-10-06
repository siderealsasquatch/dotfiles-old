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

# Enable extended globbing
shopt -s extglob

#########################
# Environment Variables #
#########################

#-------------------------------------------------
# Note: this section also includes sourced scripts
#-------------------------------------------------

# Source functions for showing branch info and other info from the current git repo
. ~/.git-prompt.sh

# Set terminal prompt
#PS1='[\u@\h \W]\$ '
PS1='[\u@\h] \W $(__git_ps1 "(%s)")
-> '

# Set default editor
export EDITOR="nvim"

# Set default pager for ranger
export PAGER="less"

# Set 256 colors
[[ -n "$TMUX" ]] && export TERM=xterm-256color

# Make it so that steam closes to the tray
export STEAM_FRAME_FORCE_CLOSE=1

# Test steam runtime heavy
#export STEAM_RUNTIME_HEAVY=1

# Have make use all of the systems cores
export MAKEFLAGS="-j$(nproc)"

# Add ccache to the system PATH
export PATH="/usr/lib/ccache/bin:$PATH"

# Add ~/bin to the system path
export PATH=~/bin:$PATH

#####################
# Other Shell Stuff #
#####################

###########
# Aliases #
###########

#===========
# ls aliases
#===========

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -d .+([a-zA-Z_])*?(-)'
alias ll='ls -l'

#=============
# grep aliases
#=============

# Add color to grep matches
alias grep='grep --color=auto'

# grep with Perl regex syntax
greP() {
	grep -P "$@"
}

#=====================
# Administrative stuff
#=====================

# Package management
# ------------------

# Make pacman display colored output
alias pacman='pacman --color auto'

# Lock yay to the aur
alias yay='yay --aur'

#======================
# General purpose stuff
#======================

# Sourcing .bashrc file
# ---------------------
alias srcbash='source ~/.bashrc'

# Spin up new instance of the shell
# (This is so that new environement variables and such can take effect)
alias refresh='exec $SHELL'

# Managing files and directories
# ------------------------------

# Make file executable
x() { chmod +x "$@"; }

# Combine pdf files
joinpdf() {
	gs -sDEVICE=pdfwrite -sPAPERSIZE=a4 -dFIXEDMEDIA -dPDFFitPage \
		-dCompatibilityLevel=1.4 -o "$@"
}

# Compress pdf files
presspdf() {
	gs -dNOPAUSE -dBATCH -dQUIET -sDEVICE=pdfwrite \
		-dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -o "$@"
}

# Create numbered directories from cat output
numbered_dirs() {
	nl -n rz -w 2 -s "-" - | xargs mkdir
}

# Convert files to dotfiles
# (Makes it so that I don't have to move files to another directory for "file-not-found"
# checks)
dot() {
	for file in "$@"; do
		mv "$file" ".${file}"
	done
}

# Convert dotfiles back to their original state
# (Undoes dot())
# Note: ${file#.} is substring removal. Google parameter expansion for more details
undot() {
	for file in "$@"; do
		mv "$file" "${file#.}"
	done
}

# Convert files into backup files
# (Add the .bak extension to the files)
bak() {
	perl-rename 's/$/\.bak/' "$@"
}

# Make backup copy of file
cpbak() {
	for file in "$@"; do
		cp "$file" "${file}.bak"
	done
}

# Convert backup files to regular files
unbak() {
	perl-rename 's/\.bak$//' "$@"
}

# Create an alias to the perl-rename command
# For some reason this doesn't work. I'll have to figure out why.
#alias rename='perl-rename'

#===============
# Neovim aliases
#===============

# Set nvim to vim
vim() {
	nvim "$@"
}

#==================
# Programming Stuff
#==================

# Python
#-------

# pyenv stuff
# NOTE: another bit of pyenv code has been placed near the end of this file to ensure that
# it's the last thing to modify the PATH.
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# pyenv-virtualenvwrapper stuff
export WORKON_HOME=~/.pyvirtenvs

#source /usr/bin/virtualenvwrapper.sh

#====================
# Programming aliases
#====================

# git
#----

# Create and initialize a git repo
gitrepo() {
	REPONAMES=( "$@" )
	for repo in ${REPONAMES[@]}; do
		mkdir $repo
		cd $repo
		git init
		cd ..
	done
}

# Create and initialize a bare repo
gitrepobare() {
	REPONAMES=( "$@" )
	for repo in ${REPONAMES[@]}; do
		mkdir $repo
		cd $repo
		git init --bare
		cd ..
	done
}

# C++
#----

# Compile program
cppcpl() {
	FILE="$1"
	g++ -Wall -std=c++11 -o "${FILE%.*}" "$FILE"
}

# Compile and run the program
cppcplr() {
	FILE="$1"
	cppcpl "$FILE"
	if (( $? == 0 )); then
		x "${FILE%.*}"
		./"${FILE%.*}"
	fi
}

# Create program directory and file both with the same name
cppdir() {
	DIR="$1"
	mkdir $DIR
	touch $DIR/${DIR}.cpp
}

# Python
#-------

# Start ipython in a cleared terminal screen
alias ipython='clear && ipython --no-banner'
# alias ipython='clear && rlwrap -a ipython --no-banner'

# Update all packages in all virtualenvs
pipupdateall() {
	for env in $(lsvirtualenv | perl -ne 'print if /^\w/'); do
		workon ${env}
		pip freeze | awk -F== '{print $1}' | xargs pip install -U
		deactivate
	done
}

# R
#--

# Start R in quiet mode
alias R='clear && R --quiet'

#======================================
# Aliases for databases/web development
#======================================

#==========
# Net stuff
#==========

# Ping google to test internet connectivity
alias testnet='ping -c 3 www.google.com'

#================
# Udacity aliases
#================

#==================================
# Aliases for accessing directories
#==================================

#====================
# Convenience aliases
#====================

# Exit terminal
alias q='exit'

# Moving to the directory above
#------------------------------

# Maybe combine the following three aliases into a function

# Go up one directory
alias ..='cd ..'

# Go up two directories
alias ...='cd ../..'

# Go up three directories
alias ....='cd ../../..'

# View the directory(ies) above the current one
#----------------------------------------------

# Go up one directory and list contents
alias l..='cd .. && ls'

# Go up two directories and list contents
alias l...='cd ../.. && ls'

# Go up three directories and list contents
alias l....='cd ../../.. && ls'

# Viewing and cd-ing into directories
#------------------------------------

# cd into directory and immediately list contents
cdl() {
	cd "$@" && ls
}

# ls but with directories displayed before files
lsd() {
	ls --group-directories-first "$@"
}

# Combine cdl and lsd
cdlsd() {
	cd "$@" && ls --group-directories-first
}

# Clear screen and list directory contents
alias cls='clear && ls'

#================================
# Stuff for command line programs
#================================

# Autojump
#---------

# Enable j wrapper around autojump
#if [[ -s ~/.autojump/etc/profile.d/autojump.sh ]]; then
	#source ~/.autojump/etc/profile.d/autojump.sh
#fi
. /etc/profile.d/autojump.bash

#================
# Aesthetic stuff
#================

# Import colorscheme from pywal asynchronously
(cat ~/.cache/wal/sequences &)

#========================
# Last bit of pyenv stuff
#========================

#if command -v pyenv 1> /dev/null 2>&1; then
if command -v pyenv &> /dev/null; then
	eval "$(pyenv init -)"
fi

#======================
# Add pipsi to the path
#======================

# added by pipsi (https://github.com/mitsuhiko/pipsi)
export PATH="/home/fahmi/.local/bin:$PATH"
