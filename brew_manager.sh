#!/usr/bin/env bash
source ~/.bash_profile
echo "# Update"
/usr/local/bin/brew update
echo "# Upgrade"
/usr/local/bin/brew upgrade
/usr/local/bin/brew cask upgrade

echo "# Cleanup"
/usr/local/bin/brew cleanup -s

echo "# Diagnostics"
/usr/local/bin/brew doctor
/usr/local/bin/brew missing
/usr/local/bin/brew outdated
/usr/local/bin/brew cask outdated
