# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
alias tmux="LD_LIBRARY_PATH=/usr/local/lib /usr/local/bin/tmux"

# langage conf (ja or en)
# export LANG=ja_JP.UTF-8
export LANG=en_US.UTF-8

export GOPATH=$HOME/bin/go
export PATH=$PATH:$HOME/bin:$GOPATH/bin

# local NAME=`who |  cut -d '(' -f 2 | sed -e 's/)//g'`
# export TRUSTED_IP=`nslookup $NAME | tail -n 2 | cut -c 10- | head -n 1`

#conf file
alias vb="vim ~/.bashrc"
alias vv="vim ~/.vimrc"
alias sb="source ~/.bashrc"
alias tm="TERM=screen-256color-bce tmux"
alias vi="vim"

#redis
alias redis="redis-2.8.17/src/redis-server"
#git
alias gti="git"
#alias gpush="git push origin master"

#tmux
#alias tm="TERM=screen-256color-bce tmux"

#source /usr/local/etc/bash_completion.d/git-prompt.sh
#source /usr/local/git/contrib/completion/git-completion.bash
#GIT_PS1_SHOWDIRTYSTATE=true

function color_my_prompt {
    local __user_and_host="\[\033[01;33m\]\u@\h"
    local __cur_location="\[\033[01;36m\]\w"
    local __git_branch_color="\[\033[31m\]"
    #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[00m\]\n$"
    local __last_color="\[\033[00m\]"
    export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color"
    #export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color \n\$(check_shell_command):\[\e[1;00m\]"
}
color_my_prompt

# User specific aliases and functions
function check_shell_command {
    if [ $? -eq 0 ]; then
        face="\e[32m(^_^)/"
    else
        face="\e[31m(+_+)"
    fi
    echo -e "${face}\e[m"
}

HISTSIZE=50000

# settings for peco
_replace_by_history() {
    declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$READLINE_LINE")
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
}
bind -x '"\C-r": _replace_by_history'
bind    '"\C-xr": reverse-search-history'

function hwv () {
  vim $(hw $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}

#ssh-agent
eval `ssh-agent`
ssh-add

function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend

source ~/.git-completion.bash
