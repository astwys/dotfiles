source ~/.antigenrc
source ~/.aliases

# spaceship prompt
SPACESHIP_DOCKER_SHOW=true
# SPACESHIP_GIT_UNSTAGED='*'
SPACESHIP_PROMPT_ADD_NEWLINE=true

# ls after cd
auto-ls () { echo $P; ls; }
chpwd_functions=( auto-ls $chpwd_functions )

#autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# node_modules
export PATH="$(npm bin):$PATH"

# yarn
export PATH="$PATH:`yarn global bin`"