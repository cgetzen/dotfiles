CUR_DIR = $(CURDIR)

all:
	@echo "Please choose from one of:"
	@echo " - cron: sets up crontabs"
	@echo " - config: sets up XDG paths"

cron:
	crontab crontab

config:
	test -e ~/.config || ln -s $(CUR_DIR)/config ~/.config # XDG_CONFIG_HOME
	defaults write com.googlecode.iterm2 PrefsCustomFolder ~/.config/iterm # iterm2
	mkdir -p ~/.data/zsh
	test -L /etc/zshenv || (sudo rm /etc/zshenv && sudo ln -s $(CUR_DIR)/zshenv /etc/zshenv)

tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.data/tmux/plugins/tpm

zsh:
	@echo "TODO"

atom:
	test -e ~/.atom && rm ~/.atom/config.cson || atom
	ln -s ~/.atom/config.cson $(CUR_DIR)/.atom/config.cson
	apm install --packages-file .atom/package.list
