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
Plug 'rakr/vim-one'

" Javascript & JSX
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Statusline
Plug 'itchyny/lightline.vim'

" Git
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()

source $HOME/.config/nvim/config/general.vim
source $HOME/.config/nvim/config/keymap.vim
