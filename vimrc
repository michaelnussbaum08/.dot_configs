set nocompatible
filetype on

set rtp+=$CONFIG_PATH/vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'Valloric/YouCompleteMe'
Bundle 'bufexplorer.zip'
Bundle "michaeljsmith/vim-indent-object"
Bundle 'L9'
Bundle "Lokaltog/vim-powerline"
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-rails'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tsaleh/vim-matchit'
Bundle 'benmills/vimux'
Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'pgr0ss/vimux-ruby-test'
Bundle 'Raimondi/delimitMate'

let mapleader = "\\"

syntax on

let g:Powerline_symbols = 'fancy'
set laststatus=2 " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

let g:fuzzy_ignore = "*.log,tmp/*,db/sphinx/*,data,*.class,*.pyc"
let g:fuzzy_ceiling = 50000
let g:fuzzy_matching_limit = 10
highlight Pmenu ctermfg=black ctermbg=gray
highlight PmenuSel ctermfg=black ctermbg=white

let g:VimuxUseNearestPane = 1
map <silent> <Leader>rb :wa<CR> :RunAllRubyTests<CR>
map <silent> <Leader>rc :wa<CR> :RunRubyFocusedContext<CR>
map <silent> <Leader>rf :wa<CR> :RunRubyFocusedTest<CR>
map <silent> <Leader>rs :!ruby -c %<CR>
map <silent> <Leader>rl :wa<CR> :VimuxRunLastCommand<CR>
map <silent> <Leader>ri :wa<CR> :InspectVimTmuxRunner<CR>
map <silent> <Leader>rx :wa<CR> :CloseVimTmuxPanes<CR>
map <silent> <Leader>vp :PromptVimTmuxCommand<CR>
vmap <silent> <Leader>vs "vy :call RunVimTmuxCommand(@v)<CR>
nmap <silent> <Leader>vs vip<Leader>vs<CR>

autocmd FileType ruby runtime ruby_mappings.vim

map <silent> <Leader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f --langmap=Lisp:+.clj<CR>
" check for a tags file up to root
set tags=./tags;/

map <silent> <Leader>nt :NERDTreeToggle<CR>
map <silent> <Leader>nr :NERDTree<CR>
map <silent> <Leader>nf :NERDTreeFind<CR>
map <silent> <Leader>ff :FufFile<CR>

" syntax highlight all rspec files
autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function

set undodir=/tmp
set undofile

" hide useless prompts
set shortmess=atI

" backup to /.tmp
set backup
set backupdir=/tmp
set backupskip=/tmp/*
set directory=/tmp
set writebackup

" set the terminal title
set title

" makes '. jump to line + column of last edit, for example
nnoremap ' `
nnoremap ` '
" make . jump to location of last edit
nnoremap . .`

" enable 256 color
set t_Co=256

let ruby_operators=1

" This remembers where you were the last time you edited the file, and
" returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <=line("$")|exe("norm'\"")|else|exe "norm $"|endif|endif

" autodelete trailing whitespace
au BufWritePre *.* :%s/\s\+$//e

" use :W for save with sudo
:command! W w !sudo tee % > /dev/null

" Turn on line numbers:
set number

set hidden

filetype off
filetype on
filetype indent plugin on

set nostartofline

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Indentation settings for using 2 spaces instead of tabs.
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smarttab

" Show column
set ruler

" Highlight 80th column
set colorcolumn=80
highlight ColorColumn ctermbg=97

set shell=/usr/local/bin/zsh

" Enable backspace in insert mode
set backspace=2

" Bash style file completion
set wildmode=longest,list

" search highlighting
set hlsearch
" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Leader><Space> :nohlsearch<Bar>:echo<CR>

" ignorecase in searches except when caps are used
set ignorecase
set smartcase

noremap Y y$
