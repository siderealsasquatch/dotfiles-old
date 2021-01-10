# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/fahmi/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="spaceship"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git vi-mode pyenv pip autojump archlinux tmux)
#plugins=(git vi-mode pyenv z archlinux tmux zsh-autosuggestions zsh-syntax-highlighting fzf)
plugins=(git vi-mode pyenv z archlinux tmux zsh-autosuggestions zsh-syntax-highlighting fzf fzf-tab)

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#########################
# Environment Variables #
#########################

# Set default editor
export EDITOR="nvim"

# Set default pager for ranger
export PAGER="less"

# Have make use all of the systems cores
export MAKEFLAGS="-j$(nproc)"

# Add ccache to the system PATH
export PATH="/usr/lib/ccache/bin:$PATH"

# Make it so that steam closes to the tray
export STEAM_FRAME_FORCE_CLOSE=1

# pyenv
# ----

# Set pyenv home and add to path
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Disable venv prompt as the zsh prompts I use handle it.
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# fzf
# ---

# Set rg as the default source for fzf
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow -g '!.{git,__py*}/*' 2> /dev/null"

# Set rg as the default source for the main fzf keybinds
# ctrl+t
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ctrl+r
export FZF_ALT_C_COMMAND='fd -t d -HL -E "{.git,__py*}"'

# Set default options for the fzf app
export FZF_DEFAULT_OPTS="--reverse --border"

# Final path entry
# ----------------

# Add ~/bin to the system path
export PATH=~/bin:$PATH

#####################
# Other Shell Stuff #
#####################

#============
# zsh options
#============

# Enable extended globbing
setopt extended_glob

#=======
# Prompt
#=======

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

#============
# Keybindings
#============

# Keybindings for vi-mode
#------------------------

# Disabling this for now since I've set Caps Lock to be Escape when tapped
# Use 'jk' to switch to Normal mode
#bindkey 'jk' vi-cmd-mode

# Keybindings for zsh-autosuggest
# -------------------------------

# Ctrl+space to accept current suggestion
#bindkey '^p' autosuggest-accept

###########
# Aliases #
###########

#===========
# ls aliases
#===========

#alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -d .*(/,.,@)' # Read more about zsh glob qualifiers (i.e., everything in parentheses)
alias ll='ls -l'

#============
# cat aliases
#============

# Replace cat with bat and set it to the terminal theme
alias cat='bat --theme ansi-dark'

#=============
# grep aliases
#=============

# Add color to grep matches
alias grep='grep --color=auto'

# grep with Perl regex syntax
#greP() {
	#grep -P "$@"
#}
alias greP='grep -P'

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

# Sourcing .zshrc file
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
#vim() {
	#nvim "$@"
#}
alias vim='nvim'

#======================
# Programming - General
#======================

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

# Python
#-------

# Update all packages in current virtualenv
pipud() {
	pip freeze | awk -F== '{print $1}' | xargs pip install -U
}

#================================
# Programming - Language specific
#================================

# Python
#-------

# Note: All of the pyenv stuff is handled by the oh-my-zsh pyenv plugin so I no longer
# need all of the lines for pyenv

# Alias for pyenv install that ensures that the PYTHON_CONFIGURE_OPTS env variable is set
# to "--enable-shared"
alias pyenv_install='env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install'

# Alias for pyenv virtualenv that ensures that the PYTHON_CONFIGURE_OPTS env variable is
# set to "--enable-shared"
# This one actually might have no effect. Will comment it out for the time being.
#alias pyenv_venv='env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv virtualenv'

# R
# -

# Launch R via radian
alias r='radian'

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

# Note: all of the autojump stuff is handled by the autojump plugin so I no longer need to
# source the autojump script.
#
# Will stop using autojump until the AUR package maintainer fixes it and use z instead.

# z
# -

# Prevent z from resolving symlinks
$_Z_NO_RESOLVE_SYMLINKS=true

#================
# Aesthetic stuff
#================

# Import colorscheme from pywal asynchronously
# Call cat via absolute path since 'bat' is aliased to 'cat'
#(cat ~/.cache/wal/sequences &)
(/usr/bin/cat ~/.cache/wal/sequences &)
