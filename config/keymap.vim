" Remapp Esc:
inoremap <c-c> <esc>
vnoremap <c-c> <esc>
inoremap jk <esc>`^
vnoremap jk <esc>`^

" Remap <Leader>:
let mapleader=","

" <Ctrl-l> redraws screen and removes any search highlighting
nnoremap <silent> <C-l> :noh<CR><C-l>

" FZF Keymaps:
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
