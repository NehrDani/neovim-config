" Syntax Highlighting:
syntax enable

" Enable Filetypes:
filetype plugin indent on

" Colors:
set termguicolors
set background=dark
let g:nord_italic=1
let g:nord_underline=1
let g:nord_italic_comments=1
let g:nord_cursor_line_number_background=1
let g:nord_comment_brightness=15
" Activate colorscheme
colorscheme nord
" Respect the terminal background color
highlight Normal guibg=none guifg=none

let g:lightline = {
  \ 'colorscheme': 'nord',
  \ }

" Spaced And Tabs:
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

" UI Config:
set number
set showcmd
set cursorline
set ruler
set laststatus=2 " Always show status
set noshowmode " Disable mode because `lightline-plugin`
set updatetime=200

" Disable Swap And Backups:
set nobackup
set noswapfile

" Disable Mouse:
set mouse-=a

" Search:

" Search highlighting
set hlsearch
set incsearch

" Make search case smart ;-)
set ignorecase
set smartcase

" Search down into subfolders
" Provides tab-completion fir all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu
set wildmode=list:longest,full
" Ignore paths and files
set wildignore+=**/node_modules/**
