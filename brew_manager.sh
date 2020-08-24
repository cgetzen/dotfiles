#!/usr/bin/env bash
echo "# Update"
/usr/local/bin/brew update
echo "\n\n# Upgrade"
/usr/local/bin/brew upgrade
/usr/local/bin/brew cask upgrade

echo "\n\n# Cleanup"
/usr/local/bin/brew cleanup -s

echo "\n\n# Diagnostics"
/usr/local/bin/brew doctor
/usr/local/bin/brew missing
/usr/local/bin/brew outdated
/usr/local/bin/brew cask outdated
