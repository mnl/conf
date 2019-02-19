#Aliases moved to separate file

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# misc aliases
alias du='du -kh'       # Makes a more readable output.
alias df='df -kTh'
alias cdt='cd $(mktemp -d -t XXXX-tmp)'
alias hc="herbstclient"
alias fx='less -FXR' #make less look like cat but with raw ansi
alias xcp='xclip -selection clipboard'
alias tracert='traceroute'
alias rot13='tr N-ZA-Mn-za-m A-Za-z'
alias jarva='java -jar'
alias castv="castnow --tomp4 --ffmpeg-vcodec copy"

# dmesg with colored human-readable dates
alias dmesgc="dmesg -T | sed -e 's|\(^.*'`date +%Y`']\)\(.*\)|\x1b[0;34m\1\x1b[0m - \2|g'"
alias dmesg="dmesg -HP"

# neat functions
myip() { curl -s checkip.dyndns.org|grep -o '[0-9.]\{7,15\}'; }
#colored diff output. $1 = red, $2 = green
cdiff() { diff -U3 $1 $2 |sed -e 's/^+/\x1b\[32m /;s/^-/\x1b[31m /;s/$/\x1b[0m/'; }
#print the n biggest memory hogs
memhogs() { ps aux | awk '$11!~/\[*\]/ {print $6/1024" MB\t"$2"\t"$11,$12,$13,$14}' |sort -gr|head -$1; }
#copy to RAM
bi () {	test -d "$1" && cp -ra "$1" /dev/shm; cd /dev/shm; }
#print nth line of stdin (ls -l|nth 3)
nth() {(for ((x=0;x<=$1;x++)) ; do read -r; done ; echo "$REPLY")}

#remove stuff from bash command history
forget() { 
	c=$(grep -c "$1" $HISTFILE) && ( sed -i '/'"$1"'/d' $HISTFILE; 
	echo "Found and removed $c occurences of $1" ) || echo "$1 not in history"; }

# make there commands run in background automatically
soffice() { command soffice "$@" & }
firefox() { command firefox "$@" & }
xpdf() { command xpdf "$@" & }
vlc() { command vlc "$@" & }
gvim() { command gvim "$@" & }
thunar() { command thunar "$@" & }
mecp () { scp "$@" ${SSH_CLIENT%% *}:Desktop/; }

# Useless functions :P
hax() { echo -ne "\e[34m" ; while true ; do sleep 0.01; echo -ne "\e[$(($RANDOM % 2 + 1))m"; tr -c "[:alpha:]" " " < /dev/urandom |dd count=1 bs=50 2> /dev/null; done }

#Draw ascii box around $1
box() { t="LL$1RR";c=${2:-#}; echo ${t//?/$c}; echo "$c $1 $c"; echo ${t//?/$c}; } #From bartonski

