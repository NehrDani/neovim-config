" Remapp Esc
inoremap <c-c> <esc>
inoremap jk <esc>`^
vnoremap <c-c> <esc>

" Remap <Leader>
let mapleader=","

" <Ctrl-l> redraws screen and removes any search highlighting
nnoremap <silent> <C-l> :noh<CR><C-l>

" Autoclose brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" Coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-reference)
nmap <leader>ac <Plug>(coc-codeaction)
" Use <c-space> to trigger completion.
if (has('nvim'))
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use <CR> to auto-select the first completion item
inoremap <silent<expr> <cr> pumvisible() ? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" FZF Keymaps
"
" Find files
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>g :Rg<CR>
nnoremap <C-p> :call FzfOmniFiles()<CR>
" Find Buffer
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nnoremap <C-b> :Buffers<CR>

fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GFiles
  endif
endfun
