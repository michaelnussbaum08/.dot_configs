" Vundle setup from https://github.com/gmarik/vundle
set nocompatible
filetype on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles:
"
" vim-scripts repos
Bundle 'python.vim'
Bundle 'surrparen'
Bundle 'pep8'
" github repos
Bundle "vim-scripts/indentpython"
Bundle "sjl/gundo.vim"
Bundle "ervandew/supertab"
Bundle "michaeljsmith/vim-indent-object"
Bundle "reinh/vim-makegreen"
Bundle "olethanh/Vim-nosecompiler"
Bundle "Lokaltog/vim-powerline"
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-rails'
Bundle 'scrooloose/vim-space'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tsaleh/vim-matchit'
Bundle 'benmills/vimux'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'


let mapleader = ","

" Plugin settings and maps:
nnoremap <F5> :GundoToggle<CR>
let g:pep8_map='<F8>'
" make pyflakes and other quickfix users cooperate
let g:pyflakes_use_quickfix = 0
" autocomplete standard python functions
"let g:pydiction_location a '~/.vim/bundle/Pydiction/complete-dict'
let g:Powerline_symbols = 'fancy'
" vimux
" Prompt for a command to run map
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Chain supertab completion types, first try omnicompletion, then keyword
" completion.
autocmd FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
    \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
    \ endif

" syntax highlight all rspec files
autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function

autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>

autocmd BufNewFile,BufRead *.py compiler nose

" save on focus lost
au FocusLost * :wa

" open vertical splits
nnoremap <leader>w <C-w>v<C-w>l

" make vim regex act like python regex
nnoremap / /\v
vnoremap / /\v

" global search/replace by default
set gdefault

set laststatus=2 " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

" persistent undo
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

" split line, reverse-J
nmap <silent> <leader><CR> i<CR><ESC>

" makes '. jump to line + column of last edit, for example
nnoremap ' `
nnoremap ` '
" make . jump to location of last edit
nnoremap . .`

" check for a tags file up to root
"set tags=.tags

" autogenerate tags
"au BufWritePost *.py,*.c,*.cpp,*.h,*.lisp silent! !eval '/usr/local/bin/ctags -R -o .newtags; mv .newtags .tags' &
"au BufReadPre *.py,*.c,*.cpp,*.h,*.lisp silent! !eval '/usr/local/bin/ctags -R -o .newtags; mv .newtags .tags' &
" delete .tags file on exit
"au VimLeave *.py,*.c,*.cpp,*.h,*.lisp silent! !eval 'if [ -f .tags ]; then rm .tags; fi'

" enable 256 color
set t_Co=256

" Coloring
colorscheme mirodark

" Colorscheme variables
let g:mirodark_enable_higher_constrast_mode=1

" This remembers where you were the last time you edited the file, and
" returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <=line("$")|exe("norm'\"")|else|exe "norm $"|endif|endif

" spell check .txt and .html files
autocmd BufNewFile,BufRead *.txt,*.html,README set spell

" autodelete trailing whitespace
au BufWritePre *.* :%s/\s\+$//e

" use :W for save with sudo
:command! W w !sudo tee % > /dev/null

" Turn on line numbers:
set number

" code folding
set foldmethod=indent
set foldlevel=99

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" highligh whitespace at end of line
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

" Wrap txts at 80 chars
autocmd FileType txt set textwidth=80
autocmd FileType txt set wrap

" Highlight 80th column
set colorcolumn=80
highlight ColorColumn ctermbg=97

set shell=/usr/local/bin/zsh

" Enable backspace in insert mode
set backspace=2

" Full Python syntax highlighting, when combined with 'syntax on'
let python_highlight_all=1

" Bash style file completion
set wildmode=longest,list

" search highlighting
set hlsearch
" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Leader><Space> :nohlsearch<Bar>:echo<CR>

" incremental search highlighting
set incsearch

" ignorecase in searches except when caps are used
set ignorecase
set smartcase

" timeout for key codes but not mappings
set ttimeout
set ttimeoutlen=5

compiler ruby

" Online doc search.
function! OnlineDoc()
  if &ft =~ "cpp"
    let s:urlTemplate = "http://doc.trolltech.com/4.1/%.html"
  elseif &ft =~ "ruby"
    let s:urlTemplate = "http://www.ruby-doc.org/core/classes/%.html"
  elseif &ft =~ "perl"
    let s:urlTemplate = "http://perldoc.perl.org/functions/%.html"
  elseif &ft =~ "python"
    let s:urlTemplate = "http://docs.python.org/library/functions.html\\#%"
  else
    return
  endif
  let s:browser = "/Applications/Firefox.app"
  let s:wordUnderCursor = tolower(expand("<cword>"))
  let s:url = substitute(s:urlTemplate, "%", s:wordUnderCursor, "g")
  let s:cmd = "!open " . s:browser . " " . s:url
  execute s:cmd
endfunction
map <F7> :call OnlineDoc()<CR>

