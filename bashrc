# ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
# ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
# ██████╔╝███████║███████╗███████║██████╔╝██║     
# ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║     
# ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
# ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#

# If not running interactively, don't do anything

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias clock='tty-clock -c -B -D'
alias musik='ncmpcpp'
alias tui='s-tui'
alias neo='neofetch --w3m ~/.config/terminal.png --xoffset 10 --yoffset 10 --size 200px 200px --loop'  
alias trim='sudo fstrim / -v'
alias kube='ckube -H 4.0 -m 0,1'
alias orphans='sudo pacman -Rns $(pacman -Qtdq)'


LANG="en_US.utf8"
export LANG

#export PS1="\u@\H>\d \A\W:\$ "

#PS1="\n\[\e[0;34m\]┌─[\[\e[1;36m\u\e[0;34m\]]──[\e[1;37m\w\e[0;34m]──[\[\e[1;36m\]${HOSTNAME%%.*}\[\e[0;34m\]]\[\e[1;35m\]: \$\[\e[0;34m\]\n\[\e[0;34m\]└────╼ \[\e[1;35m\]>> \[\e[00;00m\]"


trap 'echo -ne "\e[0m"' DEBUG

[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"

#export PYTHONPATH=/usr/lib/python3.8/site-packages
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh

extract () {
if [ -f $1 ] ; then
  case $1 in
    *.tar.bz2)   tar xjf $1     ;;
    *.tar.gz)    tar xzf $1     ;;
    *.bz2)       bunzip2 $1     ;;
    *.rar)       unrar e $1     ;;
    *.gz)        gunzip $1      ;;
    *.tar)       tar xf $1      ;;
    *.tbz2)      tar xjf $1     ;;
    *.tgz)       tar xzf $1     ;;
    *.zip)       unzip $1       ;;
    *.Z)         uncompress $1  ;;
    *.7z)        7z x $1        ;;
    *)     echo "'$1' cannot be extracted via extract()" ;;
     esac
 else
     echo "'$1' is not a valid file"
 fi
}

[ -n "$XTERM_VERSION" ] && transset-df 0.8 --id "$WINDOWID" >/dev/null

eval "$(starship init bash)"

neofetch
