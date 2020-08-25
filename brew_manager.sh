#!/usr/bin/env bash
echo "# Update"
/usr/local/bin/brew update
echo -e "\n\n# Upgrade"
/usr/local/bin/brew upgrade
/usr/local/bin/brew cask upgrade

echo -e "\n\n# Cleanup"
/usr/local/bin/brew cleanup -s

echo -e "\n\n# Diagnostics"
/usr/local/bin/brew doctor
/usr/local/bin/brew missing
/usr/local/bin/brew outdated
/usr/local/bin/brew cask outdated
