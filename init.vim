" ---- Plugins (VimPlug) ----------------------------------
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" Themes
Plug 'arcticicestudio/nord-vim'

" Javascript, Typescript & JSX
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'herringtondarkholme/yats.vim'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy Search
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do':{ -> fzf#install() } }

" Statusline
Plug 'itchyny/lightline.vim'

" Utils
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()


" ---- Keymaps --------------------------------------------
" Navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
" Easier normal mode
inoremap jk <esc>`^
inoremap <C-C> <esc>
vnoremap <C-C> <esc>
" Leader
let mapleader=" "
" Clear highlighting
nnoremap <silent> <C-C> :noh<CR><C-C>


" --- Settings --------------------------------------------
set formatoptions-=cro
" Natural splits
set splitbelow
set splitright
" Spaces And Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
" UI
set number
set cursorline
set noshowmode
set updatetime=200
set hidden
set cmdheight=2
set colorcolumn=80
set textwidth=0
set wrapmargin=0
set nowrap
set signcolumn=yes
" Disable Swap And Backups
set nobackup
set nowritebackup
set noswapfile
" Misc
set updatetime=300
set mouse-=a
set ignorecase
set smartcase
set wildignore+=**/node_modules/**

" Better sync of syntax highlight (but costs performance)
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" ---- Theme ----------------------------------------------
if (has("termguicolors"))
  set termguicolors
endif

set background=dark

let g:nord_italic=1
let g:nord_bold=1
let g:nord_underline=1
let g:nord_italic_comments=1
let g:nord_cursor_line_number_background=1

colorscheme nord

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }


" ---- CoC ------------------------------------------------
" Extensions
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-explorer'
    \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Keymaps
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)map <leader>ac <Plug>(coc-codeaction)

" Use <c-space> to trigger completion.
if (has('nvim'))
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" use "j" and "k" to navigate the completion list
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call CocAction('doHover')<CR>

" Show all diagnostics.
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

" Settings
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Explorer
nmap <silent> <space>e :CocCommand explorer<CR>


" ---- FZF (Fuzzy Filesearch) -----------------------------
" Keymaps
nnoremap <silent> <C-P> :call FzfOmniFiles()<CR>
nnoremap <silent> <C-F> :Files<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>

" Get Files ad GFile
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
command! -bang -nargs=? -complete=dir GFiles
    \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GFiles
  endif
endfun

" Customize fzf colors to match color scheme
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'],
  \ }


