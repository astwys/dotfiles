#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles    # dotfiles directory

##########

# change to the dotfiles directory
echo "Changing to the $dir directory ..."
cd $dir
echo "done"

# create symlink for the aliases file for oh-my-zsh
echo  "Creating symlinks for zgen"
  echo "Creating symlink for zshrc file"
  ln -s $dir/zsh/.zshrc ~/.zshrc
  echo "done"


  echo "Creating symlink for custom files in ~/zgen_custom"
  ln -s $dir/zsh/zgen_custom/ ~/
  echo "done"

  echo "Reseting zgen"
  zgen reset
echo "done"

# create symlink for the rules.db file for maid
echo "Creating symlink for maid"
  echo "Creating symlink for rules.rb file in ~/.maid"
  ln -s $dir/maid/rules.rb ~/.maid/
echo "done"

# create symlink for the hammerspoon files
echo "Creating symlinks for hammerspoon"
  echo "Creating symlink for hammerspoon files in ~/.hammerspoon"
  ln -s $dir/hammerspoon/* ~/.hammerspoon/
echo "done"

# create symlink for finicky files
echo "Creating symlinks for finicky"
  echo "Creating symlink for finicky configuration"
  ln -s $dir/finicky/finicky.js ~/.finicky.js
echo "done"
