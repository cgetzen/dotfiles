call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

map ; :Files<CR>

:command WQ wq
:command Wq wq
:command W w
:command Q q
