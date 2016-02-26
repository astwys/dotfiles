#load zgen
source ~/zgen/zgen.zsh

source ~/zgen_custom/aliases
source ~/zgen_custom/zsh-autosuggestions/dist/autosuggestions.zsh

#check if there is no init script
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen oh-my-zsh

  #plugins

  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/brew
  zgen oh-my-zsh plugins/brew-cask
  zgen oh-my-zsh plugins/osx
  zgen oh-my-zsh plugins/command-not-found
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/python

  zgen load zsh-users/zsh-syntax-highlighting
  zgen load djui/alias-tips
  zgen load voronkovich/gitignore.plugin.zsh

  zgen load ~/zgen_custom/enhancd/zsh

  #completion
  zgen load zsh-users/zsh-completions src

  #theme
  zgen load oskarkrawczyk/honukai-iterm-zsh honukai

  #update zgen / plugins
  zgen load unixorn/autoupdate-zgen
  ZGEN_PLUGIN_UPDATE_DAYS=1
  ZGEN_SYSTEM_UPDATE_DAYS=1

  #save to init script
  zgen save
fi

# Automatically list directory contents on `cd`.
auto-ls () { echo $P; ls; }
chpwd_functions=( auto-ls $chpwd_functions )

#start autosuggestion service
autosuggest_start
