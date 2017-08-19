source ~/.antigenrc
source ~/.aliases
source ~/.spaceshiprc
#source ~/.purerc

#zsh-autosuggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=7"	

# ls after cd
#auto-ls () { echo $P; ls; }
auto-ls () { ls; }
chpwd_functions=( auto-ls $chpwd_functions )

#autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# node_modules
export PATH="$(npm bin):$PATH"

# yarn
export PATH="$PATH:`yarn global bin`"
