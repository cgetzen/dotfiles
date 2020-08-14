"source ~/defaults.vim
"ignore case on search
set ic
"click on tabs
set mouse=a
"yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

"gb for listing buffers
nnoremap gb :ls<CR>:b<Space>

"allow :Man <cmd>
:runtime! ftplugin/man.vim

"allow backspace
set backspace=2

"Allow modifying buffers without saving
set hidden

"install vimplug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"vim-plug
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter' " Git diff
Plug 'dense-analysis/ale' " Linting
call plug#end()

let g:ale_terraform_langserver_executable = 'terraform-ls'
let g:ale_lint_on_text_changed = 'always'
let g:ale_linter_aliases = {'tf': ['terraform']} " Allows filetype=tf to be linted properly
let g:ale_fix_on_save = 1
let g:ale_fixers = {'tf': ['terraform']} " Allows filetype=tf to have correct fixers
let g:ale_completion_enabled = 1 " Doesn't do anything yet

set updatetime=250 " So git-gutter is interactive
highlight clear SignColumn " git-gutter color parity

"Ctrl-n opens tree
map <C-a> :NERDTreeToggle<CR>
"Make ; fzf
map ; :Files<CR>

"Capitalize commands
:command WQ wq
:command Wq wq
:command W w
:command Q q

"Tabs
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
