# Created by newuser for 4.3.11

# 環境変数
# export LANG=ja_JP.UTF-8
export GOPATH=$HOME/bin/go
export PATH=$PATH:$HOME/bin:$GOPATH/bin

# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
setopt hist_ignore_all_dups # 同じコマンドをヒストリに残さない
setopt hist_reduce_blanks # ヒストリに保存するときに余分なスペースを削除する
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                     /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

########################################
# vcs_info
PROMPT="%{${fg[yellow]}%}[%n@%m]%{${reset_color}%}${vcs_info_msg_0} %{${fg[cyan]}%}%d%{${reset_color}%}"
# git表示設定
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
PROMPT=$PROMPT' ${vcs_info_msg_0_}'
PROMPT=$PROMPT"
%# "

########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

########################################
# エイリアス

alias tmux="LD_LIBRARY_PATH=/usr/local/lib /usr/local/bin/tmux"
alias vb="vim ~/.bashrc"
alias vz="vim ~/.zshrc"
alias vv="vim ~/.vimrc"
alias sb="source ~/.bashrc"
alias sz="source ~/.zshrc"
alias tm="TERM=screen-256color-bce tmux"
alias vi="vim"
alias mkdir='mkdir -p'

#redis
alias redis="redis-2.8.17/src/redis-server"
#git
alias gti="git"

# settings for peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function hwv () {
  vim $(hw $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which xsel >/dev/null 2>&1 ; then
  alias -g C='| xsel --input --clipboard'
fi

function share_history {
    history -a
    history -c
    history -r
}

#ssh-agent
eval `ssh-agent`
ssh-add

########################################
# OS 別の設定
case ${OSTYPE} in
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac

fpath=(~/.zsh/completion $fpath)

autoload -U compinit
compinit -u
