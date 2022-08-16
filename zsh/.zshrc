############################
# zsh options and settings #
############################

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/fahmi/.oh-my-zsh"

# Theme
#ZSH_THEME="spaceship"

# Plugins
plugins=(git vi-mode direnv fzf fzf-tab tmux ubuntu zsh-autosuggestions zsh-syntax-highlighting
	nix-zsh-completions autoupdate)

source $ZSH/oh-my-zsh.sh

#==================
# zsh shell options
#==================

# Enable extended globbing
setopt EXTENDED_GLOB

#########################
# Environment Variables #
#########################

# Set default editor
export EDITOR="nvim"

# Set default pager for ranger
export PAGER="less"

# Have make use all of the systems cores
export MAKEFLAGS="-j$(nproc)"

# Add ~/bin to the system path
export PATH=~/bin:~/.local/bin:$PATH

# Add mssql-tools to the path
export PATH=$PATH:/opt/mssql-tools/bin

#=================
# WSL related vars
#=================

# Set DISPLAY var for connecting to external X server
export DISPLAY=localhost:0.0

#=====================
# Comandline prog vars
#=====================

# fzf
# ---

# Set rg as the default source for fzf
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow -g '!.{git,__py*}/*' 2> /dev/null"

# Set rg as the default source for the main fzf keybinds
# ctrl+t
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# alt+c
export FZF_ALT_C_COMMAND='fd -t d -HL -E "{.git,__py*}/*"'

# Set default options for the fzf app
export FZF_DEFAULT_OPTS="-i -m --reverse --border --preview 'bat --theme ansi {}'"

#=================
# Programming vars
#=================

#
#export JAVA_HOME=~/.nix-profile

# Spark
# -----

export SPARK_HOME=/opt/spark
export PATH="$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH"

# node
# ----

# Add ~/.npm-global/bin to PATH
export PATH=~/.npm-global/bin:${PATH}

# pyenv
# -----

# Set pyenv home (root) var and add bin dir from pyenv home to system path
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"

# Turn off pyenv prompts and let the zsh prompt handle it
#export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Python
# ------

# Set location for virtualenvs
#export WORKON_HOME=~/.py-venvs

# Source virtualenvwrapper script
#. $(asdf where python)/bin/virtualenvwrapper.sh

#####################
# Other Shell Stuff #
#####################

#=======
# Prompt
#=======

# No need to source if not using prompt
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

#============
# Keybindings
#============

# Keybindings for vi-mode
#------------------------

# No longer need to use this as the escape key has been bound to caps lock
# Use 'jk' to switch to Normal mode
#bindkey 'jk' vi-cmd-mode

# zsh-autosuggestions
# -------------------

# Set ctrl+space to accept current suggestion (Windows only?)
# Not sure if I even need this anymore. Will comment out for now.
#bindkey '^ ' autosuggest-accept

# Set ctrl+f to move forward one word
bindkey '^f' forward-word

# Set ctrl+b to move backward one word
bindkey '^b' backward-word

# fzf
# ---

# Figure out a more sensible binding later
# Rebind dir widget to ctrl+alt+d
#bindkey '^[^d' fzf-cd-widget

###########
# Aliases #
###########

#========
# General
#========

# Alias fdfind to fd
#alias fd='fdfind'

#===========
# ls aliases
#===========

# Alias lsd to ls
#alias ls='lsd'
alias ls='exa --icons'

#alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -d .*(.,@,/)' # Read more about zsh glob qualifiers [that's what the (D) is].
alias ll='ls -l'

#============
# cat aliases
#============

# Alias bat to cat
alias cat='bat --theme ansi'

# Alias cat to syscat
alias syscat='/bin/cat'

#===========
# fd aliases
#===========

# Set color option to always so that colored outout is retained even when piped
#alias fd='fd --color auto'

#================
# ripgrep aliases
#================

# Set color option to always so that colored output is retained even when piped
# Also set the pcre2 flog to enable perl regex features
alias rg='rg --pcre2 --color always'
#alias rg='rg --pcre2'

#=============
# grep aliases
#=============

# Add color to grep matches
alias grep='grep --color=auto'

# grep with Perl regex syntax
greP() {
	grep -P "$@"
}

#============
# Work server
#============

# ssh into the server as admin
alias conn-as-admin='ssh as-server-admin'

# ssh into the server with your account
alias conn-as-fahmi='ssh as-server-fahmi'

#=====================
# Administrative stuff
#=====================

# Package management
# ------------------

# Update and upgrade packages
alias update-and-upgrade='sudo apt update && sudo apt upgrade'

# Sourcing .bashrc file
# ---------------------
alias srczsh='source ~/.zshrc'

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
	rename 's/$/\.bak/' "$@"
}

# Make backup copy of file
cpbak() {
	for file in "$@"; do
		cp "$file" "${file}.bak"
	done
}

# Convert backup files to regular files
unbak() {
	rename 's/\.bak$//' "$@"
}

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

# Note: All of the pyenv stuff is handled by the oh-my-zsh pyenv plugin so I no longer
# need all of the lines for pyenv

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

# Python
#-------

# Update all pip packages that haven't been installed via nix
alias pipud="pip freeze | awk -F== '!/@/ {print $1}' | xargs pip install -U"

# Install python version with pyenv with CONFIGURE_OPTS set to '--enable-shared'
#alias pyenv_install="env CONFIGURE_OPTS=--enable-shared pyenv install"

# Create pyenv virtualenv with CONFIGURE_OPTS set to '--enable-shared'
#alias pyenv_venv="env CONFIGURE_OPTS=--enable-shared pyenv virtualenv"

#======================================
# Aliases for databases/web development
#======================================

#==========
# Net stuff
#==========

# Ping google to test internet connectivity
alias testnet='ping -c 3 www.google.com'

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
#lsd() {
	#ls --group-directories-first "$@"
#}

# Combine cdl and lsd
#cdlsd() {
	#cd "$@" && ls --group-directories-first
#}

# Clear screen and list directory contents
alias cls='clear && ls'

#=============
# Work aliases
#=============

# OMP ini file symlinks
#----------------------

# Create symlink to OMP.ini file for different estate. Will over-write existing symlink.
# Assumes that there is an .omp_ini directory in the current directory.
relink_omp_ini() {
	target=$(find .omp_ini -type f -iname "*$1*")
	ln -sf ${target} OMP.ini
}

# OMP license files
#------------------

# Will probably have to write this function in powershell as Windows doesn't recognize
# symlinks made in WSL with absolute paths.
# Create symlinks to OMP license file and xml file in the current directory. Will
# over-write existing symlinks.
# May have to think of a more robust solution in the future.
#relink_omp_license() {
	#license_dir="/mnt/h/omp-accdb_files"
	#ln -sf ${license_dir}/*.{xml,asl} .
#}

#====================
# Specialized aliases
#====================

# shuf command stuff
# ------------------

# Generate seed
get_seeded_random() {
	seed="$1"
	openssl enc -aes-256-ctr -pass pass:"$seed" -nosalt </dev/zero 2>/dev/null
}

#================================
# Stuff for command line programs
#================================

# Note: all of the autojump stuff is handled by the autojump plugin so I no longer need to
# source the autojump script.

#########################
# Inits for shell tools #
#########################

# Nix
# ---
if [ -e /home/fahmi/.nix-profile/etc/profile.d/nix.sh ];then
	. /home/fahmi/.nix-profile/etc/profile.d/nix.sh;
fi # added by Nix installer

# Starship prompt
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# any-nix-shell
any-nix-shell zsh | source /dev/stdin
