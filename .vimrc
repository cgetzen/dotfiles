source ~/defaults.vim
"ignore case on search
set ic

"allow :Man <cmd>
:runtime! ftplugin/man.vim

"install vimplug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"vim-plug
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

"Ctrl-n opens tree
map <C-n> :NERDTreeToggle<CR>

"Make ; fzf
map ; :Files<CR>

"Capitalize commands
:command WQ wq
:command Wq wq
:command W w
:command Q q
