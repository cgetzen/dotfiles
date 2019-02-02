#!/bin/sh
echo "# Update"
brew update
echo "# Upgrade"
brew upgrade
brew cask upgrade

echo "# Cleanup"
brew cleanup -s

echo "# Diagnostics"
brew doctor
brew missing
brew outdated
brew cask outdated
