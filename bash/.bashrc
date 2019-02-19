# Mickes .bashrc
# Updated on feb 19 23:58:25 CET 2019

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# append to the history file, don't overwrite it
shopt -s histappend
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

color_prompt=yes
force_color_prompt=yes

# trim dirs to 3
PROMPT_DIRTRIM=2

# Alias definitions in separate file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

PS1='\[\033[01;3;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# make less show contents of directories instead of complain
export LESSOPEN='|dir=%s;test -d "$dir" && ls -lah --color "$dir"'

# important exports
export BROWSER=/usr/bin/firefox 
export EDITOR=vim
export PAGER=less
export IGNOREEOF=3

# completion
shopt -s cdspell
shopt -s direxpand dirspell

# Use z frequency jumper
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
