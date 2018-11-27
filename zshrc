# Created by newuser for 5.4.2

export EDITOR="nvim"
#
# nodenv
eval "$(nodenv init -)"

# node_modules
export PATH="$(npm bin):$PATH"

# export CLICOLOR=1

source ~/.aliases

source ~/.zgenrc

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_OPTS="--extended --preview 'head -100 {}'"
export FZF_DEFAULT_OPTS="--extended"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

