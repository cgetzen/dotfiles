"source ~/defaults.vim

"yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

"gb for listing buffers
nnoremap gb :ls<CR>:b<Space>

set backspace=2 "allow backspace
set hidden "Allow modifying buffers without saving
set ic "ignore case on search
set mouse=a "click on tabs
" set laststatus=2 " for lightlight

"install vimplug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"vim-plug
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter' " Git diff
Plug 'dense-analysis/ale' " Linting
Plug 'tpope/vim-fugitive' " Git in vim
Plug 'vim-utils/vim-man' " :Man <cmd>
Plug 'vim-utils/vim-troll-stopper' " highlights unicode
" Plug 'itchyny/lightline.vim'
call plug#end()

let g:ale_terraform_langserver_executable = 'terraform-ls'
let g:ale_lint_on_text_changed = 'always'
let g:ale_linter_aliases = {'tf': ['terraform']} " Allows filetype=tf to be linted properly
let g:ale_fix_on_save = 1
let g:ale_fixers = {'tf': ['terraform']} " Allows filetype=tf to have correct fixers
let g:ale_completion_enabled = 1 " Doesn't do anything yet

set updatetime=250 " So git-gutter is interactive
highlight clear SignColumn " git-gutter color parity

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Ctrl-a opens tree
map <C-a> :NERDTreeTabsToggle<CR> 
map ; :Files<CR> " Make ; fzf

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
