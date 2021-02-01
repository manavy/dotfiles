# env
PATH=~/dev/bin
PATH=$PATH:$HOME/.cargo/bin # Cargo
PATH=$PATH:/usr/local/opt/python/libexec/bin #python3
PATH=$PATH:/usr/local/git/bin #Git
PATH=$PATH:$HOME/.amplify/bin # Amplify
PATH=$PATH:/usr/local/bin
PATH=$PATH:/bin:/sbin:/usr/sbin:/usr/bin #system
export PATH

export TERM=xterm-256color
export LANG='ja_JP.UTF-8'
export LSCOLORS=gxfxcxdxbxegedabagacad # color code for ls

#alias
alias vi=vim
alias l='ls -avGF'

#completion
autoload -U compinit # for completion depends on command
compinit

hosts=( ${(@)${${(M)${(s:# :)${(zj:# :)${(Lf)"$([[ -f ~/.ssh/config ]] && <~/.ssh/config)"}%%\#*}}##host(|name) *}#host(|name) }/\*} )

zstyle ':completion:*:hosts' hosts $hosts
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#for command completion
typeset -A myabbrev
myabbrev=(
	"ll"    "| less"
	"lg"    "| grep"
)
my-expand-abbrev() {
	local left prefix
	left=$(echo -nE "$LBUFFER" | sed -e "s/[_a-zA-Z0-9]*$//")
	prefix=$(echo -nE "$LBUFFER" | sed -e "s/.*[^_a-zA-Z0-9]\([_a-zA-Z0-9]*\)$/\1/")
	LBUFFER=$left${myabbrev[$prefix]:-$prefix}" "
}
zle -N my-expand-abbrev
bindkey     " "         my-expand-abbrev

#bind like emacs
bindkey -e

#for flush buffer without \n
unsetopt promptcr

#history
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt share_history
function history-all {
	history -E 1
}
setopt  hist_ignore_all_dups
setopt  hist_reduce_blanks

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


