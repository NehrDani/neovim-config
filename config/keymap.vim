" Remapp Esc
inoremap <c-c> <esc>
inoremap jk <esc>`^
vnoremap <c-c> <esc>

" Remap <Leader>
let mapleader=","

" <Ctrl-l> redraws screen and removes any search highlighting
nnoremap <silent> <C-l> :noh<CR><C-l>

" FZF Keymaps
"
" Find files
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <<C-p> :call FzfOmniFiles()<CR>
" Find Buffer
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <C-b> :Buffers<CR>

fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GFiles
  endif
endfun

