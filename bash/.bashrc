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

# Set terminal prompt
PS1='[\u@\h \W]\$ '

# Set default editor
export EDITOR="nvim"

# Set default pager for ranger
export PAGER="less"

# Set 256 colors
[[ -n "$TMUX" ]] && export TERM=xterm-256color

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

# Sourcing .bashrc file
# ---------------------
alias srcbash='source ~/.bashrc'

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

export WORKON_HOME=~/.pyenvs
source /usr/bin/virtualenvwrapper.sh

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

# R
#--

# Start R in quiet mode
alias R='clear && R --quiet'

# Java
#-----

# Start the eclim sever
alias eclimd='~/.eclipse/org.eclipse.platform_4.6.2_155965261_linux_gtk_x86_64/eclimd'

#======================================
# Aliases for databases/web development
#======================================

# Start MySQL with root account
#------------------------------
# Maria DB already uses readline
alias mysqlroot='mysql -u root -p'

#==========
# Net stuff
#==========

# Ping google to test internet connectivity
alias testnet='ping -c 3 www.google.com'

#============================================
# Aliases for tmux and other related programs
#============================================

# Force tmux to assume that all terminals running within it support 256-colors
# alias tmux='tmux -2'
# alias tmux='TERM=xterm-256color; tmux'
# alias tmux="env TERM=xterm-256color tmux"

#===============
# Matlab aliases
#===============

# Run MATLAB in the terminal without the graphical aspects
#alias matterm='rlwrap -a matlab -nodesktop -nosplash -r "clc"'

#==================================
# Aliases for accessing directories
#==================================

# Stuff pertaining to linux in general
alias linbook='cd ~/linux_stuff/stuff_from_books'
alias vimstuff='cd ~/linux_stuff/vim_stuff'
alias linstuff='cd ~/linux_stuff'

# Stuff pertaining to python programming
alias pyproj='cd ~/programming/langs/Python/python_projects'
alias pyprac='cd ~/programming/langs/Python/Practice'
alias pynoteprog='cd /mnt/windows2/Programming/Python/"Textbook Exercises"/"Python for Programming"'
alias pynotesci='cd /mnt/windows2/Programming/Python/"Textbook Exercises"/"Python for Scientific Computing"'
alias pynotegui='cd /mnt/windows2/Programming/Python/"Textbook Exercises"/"Python GUI Programming"'

# Stuff pertaining to Haskell programming
alias haskmain='cd /mnt/windows2/Programming/Haskell'
alias haskbook='cd /mnt/windows2/Programming/Haskell/textbook_stuff'

# Programming directory in ~/programming/langs
# Main directory
alias pymain='cd ~/programming/langs/Python'
alias javamain='cd ~/programming/langs/Java'
alias cppmain='cd ~/programming/langs/C++'
# Book
alias pybook='cd ~/programming/langs/Python/textbook_notes'
alias cppbook='cd ~/programming/langs/C++/book_exercises'
alias perlbook='cd ~/programming/langs/Perl'
alias sabook='cd ~/programming/langs/sed_and_awk'
alias rubook='cd ~/programming/langs/Ruby'
alias elixbook='cd ~/programming/langs/Elixir'
alias julbook='cd ~/programming/langs/Julia'
alias scripts='cd ~/programming/langs/Scripts'
alias gitbook='cd ~/programming/version_control/Git/textbook_notes'
alias rbook='cd ~/programming/langs/R/textbook_notes'
alias scalbook='cd ~/programming/langs/scala/textbook_notes'
alias javabook='cd ~/programming/langs/Java/textbook_notes'
alias mysqlbook='cd ~/programming/langs/MySQL/textbook_notes'

# Stuff pertaining to database_stuff directory
alias databasemain='cd ~/database_stuff'
alias databasebook='cd ~/database_stuff/book_stuff'

# Top level of all programming directories
alias proglang='cd ~/programming/langs'
alias progproj='cd ~/programming/projects'

# Stuff pertaining to MATLAB
alias matstuff='cd /mnt/windows2/Programming/MATLAB'
alias dynsys='cd /mnt/windows2/Programming/MATLAB/"Dynamic Systems"'
alias guiprog='cd /mnt/windows2/Programming/MATLAB/"GUI Programming"'
alias proctrl='cd /mnt/windows2/Programming/MATLAB/"Process Control"'
alias ncs='cd /mnt/windows2/Programming/MATLAB/"Control Systems with Wireless Networking"'

# Stuff pertaining to college classes
alias schoolstuff='cd /mnt/windows2/"School Stuff"'
alias scholarships='cd /mnt/windows2/"School Stuff"/scholarship_stuff'
alias contproc='cd /mnt/windows2/"School Stuff"/"College Classes"/Praktikum/"Praktikum Kendali Proses"'
alias kkn='cd /mnt/windows2/"School Stuff"/KKN'
alias thesis='cd /mnt/windows2/"School Stuff"/"Undergrad Thesis"'
alias robotics='cd /mnt/windows2/"School Stuff"/"College Classes"/Robotics'
alias prak='cd /mnt/windows2/"School Stuff"/"College Classes"/Praktikum'

# Stuff pertaining to textbooks and their notes
alias textnote='cd /mnt/windows2/"School Stuff"/"Textbook Notes"'
alias statnote='cd /mnt/windows2/"School Stuff"/"Textbook Notes"/Math/Statistics'
alias probnote='cd /mnt/windows2/"School Stuff"/"Textbook Notes"/Math/Probability'
alias mlnote='cd /mnt/windows2/"School Stuff"/"Textbook Notes"/"Machine Learning"'
alias algnote='cd /mnt/windows2/"School Stuff"/"Textbook Notes"/Algorithms'
alias linalgnote='cd /mnt/windows2/"School Stuff"/"Textbook Notes"/Math/lin_alg'
alias optnote='cd /mnt/windows2/"School Stuff"/"Textbook Notes"/Math/optimization'
alias numethnote='cd /mnt/windows2/"School Stuff"/"Textbook Notes"/Math/numerical_methods'
alias datscinote='cd /mnt/windows2/"School Stuff"/"Textbook Notes"/Data_Science'

# Windows directories
alias winstuff='cd /mnt/windows2/'
alias winsystuff='cd /mnt/windows1/'

# Internship stuff
alias internmain='cd /mnt/windows2/Internship'
alias internomp='cd /mnt/windows2/Internship/OMP_testing'
alias internomptext='cd /mnt/windows2/Internship/OMP_testing/important_text_files'

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
if [[ -s ~/.autojump/etc/profile.d/autojump.sh ]]; then
	source ~/.autojump/etc/profile.d/autojump.sh
fi
