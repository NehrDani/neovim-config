" Better sync of sintax highlight (but costs performance)
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" PLUGINS:

" Auto install vim-plug if neccessary
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Specify plugin directory
call plug#begin()

" Themes
" Plug 'haishanh/night-owl.vim'
Plug 'arcticicestudio/nord-vim'

" Javascript, Typescript & JSX
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-tsserver']
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Fuzzy Search
Plug 'junegunn/fzf.vim'

" Statusline
Plug 'itchyny/lightline.vim'

" Comments (gc*)
Plug 'tpope/vim-commentary'

" Surroundings (ys/cs/ds)
Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()

source $HOME/.config/nvim/config/general.vim
source $HOME/.config/nvim/config/keymap.vim
