
all:
	@echo "Please choose from one of:"
	@echo " - brew"
	@echo " - vim"
	@echo " - zsh"
	@echo " - atom"

brew: Brewfile
	brew bundle

vim: .vimrc
	test -e ~/.vimrc && rm ~/.vimrc
	test -e ~/.vim/autoload/plug.vim || curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -s ~/Workspace/dotfiles/.vimrc ~/.vimrc
	vim +'PlugInstall --sync' +qa

zsh: ohmyzsh .zshrc
	test -e ~/.zshrc && rm ~/.zshrc
	ln -s ~/Workspace/dotfiles/.zshrc ~/.zshrc

ohmyzsh:
	test -e ~/.oh-my-zsh || git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	test -e ~/.oh-my-zsh/custom/themes && rm -r ~/.oh-my-zsh/custom/themes
	ln -s ~/Workspace/dotfiles/.oh-my-zsh/custom/themes ~/.oh-my-zsh/custom/themes

atom:
	test -e ~/.atom && rm ~/.atom/config.cson
	ln -s ~/Workspace/dotfiles/.atom/config.cson ~/.atom/config.cson
	apm install --packages-file .atom/package.list
