" autocomplete standard python functions
let g:pydiction_location = '~/.vim/pydiction-1.2/complete-dict' 

" check for a tags file up to root
set tags=tags;/

" autogenerate tags
au BufWritePost *.py,*.c,*.cpp,*.h silent! !eval '/usr/local/bin/ctags -R -o newtags; mv newtags tags' &

" Coloring
colorscheme molokai

" enable 256 color
set t_Co=256

" This remembers where you were the last time you edited the file, and
" returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <=line("$")|exe("norm'\"")|else|exe "norm $"|endif|endif

" break text at 79 chars
setl textwidth=79

" spell check .txt and .html files
autocmd BufNewFile,BufRead *.txt,*.html,README set spell

" autodelete trailing whitespace
au BufWritePre *.py,*.h,*.m,*.lisp,*.c :%s/\s\+$//e

" Turn on line numbers:
set number

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
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Show column
set ruler

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
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" incremental search highlighting
set incsearch

" ignorecase in searches except when caps are used
set ignorecase
set smartcase

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
