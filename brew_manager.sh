#!/usr/bin/env bash
export PATH="/usr/local/bin:/usr/bin"

echo "# Update"
brew update

echo -e "\n\n# Upgrade"
brew upgrade

echo -e "\n\n# Cleanup"
brew cleanup -s

echo -e "\n\n# Diagnostics"
brew doctor
brew missing
brew outdated
