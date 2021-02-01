set nocompatible

" Syntax Highlighting {{{
set t_Co=256
set background=dark
colorscheme delek
syntax on	
" }}}

set autoindent " Copy indent from last line when starting new line
set expandtab " Expand tabs to spaces
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed


set laststatus=2 " Always show status line
set mouse=a " Enable mouse in all modes
set noerrorbells " Disable error bells
set nowrap " Do not wrap lines
set number " Enable line numbers
set shiftwidth=2 " The # of spaces for indenting
set showtabline=2 " Always show tab bar
set smartcase " Ignore 'ignorecase' if the search pattern contains uppercase characters
set smarttab " At the start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set softtabstop=2 " Tab key results in 2 spaces
set title " Show the filename in the window titlebar
set ttyfast " Send more characters at a given time
set visualbell " Use visual bell instead of audible bell
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildmenu " Hitting TAB in command mode will show possible completions above command line
set wildmode=list:longest " Complete only until point of 

" FastEscape {{{
" Speed up transition from modes
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
" }}}

" Remap :W to :w {{{
command! W write
" }}}

" Javascript {{{ 
augroup filetype_javascript
  autocmd!
  let g:javascript_conceal = 1
augroup END
" }}}

" JSON {{{
augroup filetype_json
  autocmd!
  au BufRead,BufNewFile *.json set ft=json syntax=javascript
augroup END
" }}}

" Markdown {{{
augroup filetype_markdown
  autocmd!
  let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh']
augroup END
" }}}
