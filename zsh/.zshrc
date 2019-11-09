# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/fahmi/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode pyenv pip autojump archlinux tmux)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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
alias l.='ls *(D.,@)' # Read more about zsh glob qualifiers (i.e., everything in parentheses)
alias ll='ls -l'

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
pipupdateall() {
	pip freeze | awk -F== '{print $1}' | xargs pip install -U
}

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

#================
# Aesthetic stuff
#================

# Import colorscheme from pywal asynchronously
(cat ~/.cache/wal/sequences &)
