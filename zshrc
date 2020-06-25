# Lines configured by zsh-newuser-install

autoload -U colors && colors
autoload -U compinit
compinit

# correction
setopt correctall

# # prompt
autoload -U promptinit
promptinit


export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000

######################################
autoload -U compinit compinit
setopt autopushd pushdminus pushdsilent pushdtohome
setopt autocd
setopt cdablevars
setopt ignoreeof
setopt interactivecomments
setopt nobanghist
setopt noclobber
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt SH_WORD_SPLIT
setopt nohup

# # PS1
# export PS1="$(print '%{\e[1;34m%}%n%{\e[0m%}')@$(print '%{\e[0;34m%}%1d%{\e[0m%}')$ "
# export PS2="$(print '%{\e[0;34m%}>%{\e[0m%}')"
# 
# Vars used later on by Zsh
# export EDITOR="/usr/local/opt/vim"
export BROWSER=links
export XTERM="aterm +sb -geometry 80x29 -fg black -bg lightgoldenrodyellow -fn -xos4-terminus-medium-*-normal-*-14-*-*-*-*-*-iso8859-15"
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%d %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} %  %{$reset_color%}'
##################################################################
# Stuff to make my life easier
#
## allow approximate
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# tab completion for PID :D
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# cd not select parent dir
zstyle ':completion:*:cd:*' ignore-parents parent pwd


# useful for path editing — backward-delete-word, but with / as additional delimiter
backward-delete-to-slash () {
local WORDCHARS=${WORDCHARS//\//}
zle .backward-delete-word
}
zle -N backward-delete-to-slash


# Normal aliases
alias lsd='ls -ld *(-/DN)'
alias f='find |grep'
alias gzx='tar -xzvf'
alias bz2='tar -xjvf'
alias tarc='tar -cvf'
alias tarz='tar -czvf'

alias g="git"

alias gffs="git flow feature start"
alias gfff="git flow feature finish"

alias v="vim"
alias c="clear"
alias dir='ls -al'
alias ll="ls -al"
alias ..='cd ..'
alias ~='cd ~'
alias mem="free -m"
alias ex="exit"


alias ffmpeg='docker run -v=`pwd`:/tmp/workdir jrottenberg/ffmpeg'
alias docker_rd='docker rm $(docker ps -aq) && docker rmi $(docker images -q -f dangling=true)'
alias crontab='VIM_CRONTAB=true EDITOR=vim crontab'
# alias msn="tmsnc -l lyb@megvii.com"

# command L equivalent to command |less
alias -g L='|less'
alias ld='ls -l|grep ^d'

alias grep="grep --color=auto"
alias find_py="find ./ -name '*.py' |xargs grep -n"
alias find_js="find ./ -name '*.js' |xargs grep -n"
alias rm_pyc="find ./ -name '*.pyc' | xargs rm -rf"
alias autopep='autopep8 --in-place --aggressive --aggressive'

plugins=(git autojump bundler zsh-autosuggestions zsh-completions tig)
autoload -U compinit && compinit
## for zsh-autosuggestions,出建议的命令
bindkey ',,' autosuggest-accept

# End of lines configured by zsh-newuser-install# Path to your oh-my-zsh installation.
################################################basic setting
#
export LC_CTYPE=zh_CN.UTF-8
export LANG=zh_CN.UTF-8
# export LC_CTYPE=C
# export LANG=C

export ZSH=$HOME/.oh-my-zsh
# 禁止在虚拟环境外部使用pip
export PIP_REQUIRE_VIRTUALENV=true

#
ZSH_THEME="robbyrussell"
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
[ -z "$TMUX"  ] && export TERM=xterm-256color

source $ZSH/oh-my-zsh.sh
