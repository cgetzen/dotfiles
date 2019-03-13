
all:
	@echo "Please choose from one of:"
	@echo " - brew"
	@echo " - vim"
	@echo " - zsh"
	@echo " - atom"
	@echo " - git"
	@echo " - update"

brew: Brewfile
	(crontab -l ; echo '0 12 * * 1-5 ~/Workspace/dotfiles/brew_manager.sh > /tmp/brew-`/bin/date +%m%d`.log && terminal-notifier -title "Updated brew" -message "/tmp/brew-`/bin/date +%m%d`.log"') | sort - | uniq - | crontab -
	brew bundle

vim: .vimrc
	test -e ~/.vimrc && rm ~/.vimrc || true
	test -e ~/.vim/autoload/plug.vim || curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -s ~/Workspace/dotfiles/.vimrc ~/.vimrc
	vim +'PlugInstall --sync' +qa

zsh: ohmyzsh .zshrc
	test -e ~/.zshrc && rm ~/.zshrc || true
	ln -s ~/Workspace/dotfiles/.zshrc ~/.zshrc

tmux:
	test -e ~/.tmux.conf && rm ~/.tmux.conf || true
	ln -s ~/Workspace/dotfiles/.tmux.conf ~/.tmux.conf

ohmyzsh:
	test -e ~/.oh-my-zsh || git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	cp ~/Workspace/dotfiles/.oh-my-zsh/custom/themes/charlieg.zsh-theme ~/.oh-my-zsh/custom/themes

atom:
	test -e ~/.atom && rm ~/.atom/config.cson || atom
	ln -s ~/.atom/config.cson ~/Workspace/dotfiles/.atom/config.cson
	apm install --packages-file .atom/package.list

git:
	ln -s ~/Workspace/dotfiles/.gitconfig ~/.gitconfig
