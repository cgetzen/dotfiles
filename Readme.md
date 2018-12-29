# Brew
brew bundle
brew bundle cleanup
brew bundle dump
brew bundle check

# Mac OS
source .macos

# Atom
apm install --packages-file .atom/package.list
cp .atom/config.cson ~/.atom/config.cson
