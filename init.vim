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
Plug 'arcticicestudio/nord-vim'

" Javascript, Typescript & JSX
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy Search
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do':{ -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" Statusline
Plug 'vim-airline/vim-airline'

" Comments (gc*)
Plug 'tpope/vim-commentary'

" Surroundings (ys/cs/ds)
Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()

source $HOME/.config/nvim/config/general.vim
source $HOME/.config/nvim/config/keymap.vim
source $HOME/.config/nvim/config/coc.vim
