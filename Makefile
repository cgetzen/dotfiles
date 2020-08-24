CUR_DIR = $(CURDIR)

all:
	@echo "Please choose from one of:"
	@echo " - brew: Creates cronjob"
	@echo " - vim: vimrc"
	@echo " - zsh: zshrc & ohmyzsh"
	@echo " - atom: atom configs"
	@echo " - git: .gitconfig"

brew:
	(crontab -l ; echo "0 12 * * 1-5 PATH="/usr/local/bin:/usr/local/sbin:$${PATH}" $(CUR_DIR)/brew_manager.sh &> /tmp/brew.log && /usr/local/bin/terminal-notifier -title \"Updated brew\" -message \"/tmp/brew.log\"") | sort - | uniq - | crontab -

vim: .vimrc
	test -e ~/.vimrc && rm ~/.vimrc || true
	ln -s $(CUR_DIR)/.vimrc ~/.vimrc

zsh: ohmyzsh .zshrc
	test -e ~/.zshrc && rm ~/.zshrc || true
	ln -s $(CUR_DIR)/.zshrc ~/.zshrc

tmux:
	test -e ~/.tmux.conf && rm ~/.tmux.conf || true
	ln -s $(CUR_DIR)/.tmux.conf ~/.tmux.conf

ohmyzsh:
	test -e ~/.oh-my-zsh || git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	cp $(CUR_DIR)/.oh-my-zsh/custom/themes/charlieg.zsh-theme ~/.oh-my-zsh/custom/themes

atom:
	test -e ~/.atom && rm ~/.atom/config.cson || atom
	ln -s ~/.atom/config.cson $(CUR_DIR)/.atom/config.cson
	apm install --packages-file .atom/package.list

git:
	ln -s $(CUR_DIR)/.gitconfig ~/.gitconfig
