#!/bin/sh

#install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew packages
brew install coreutils
brew install curl
brew install git
brew install kwm
brew install node
brew install postgresql
brew install python
brew install tmux
brew install wget
brew instal tldr

# brew cask apps
brew cask install alfred
brew cask install atom
brew cask install exa
brew cask install finicky
brew cask install flux
brew cask install gitup
brew cask install spotify-notifications
brew cask install dropbox
brew cask install chrome

brew cleanup
