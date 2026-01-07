call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Fuzzy finder (requires fzf installed)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'Shougo/unite.vim'
Plug 'ujihisa/unite-colorscheme'
Plug 'tomasr/molokai'

" Custom Plug
Plug 'itchyny/lightline.vim'

Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

Plug 'preservim/nerdtree'

Plug 'posva/vim-vue'

" JS/TS
Plug 'pangloss/vim-javascript'       " JavaScript syntax
Plug 'HerringtonDarkholme/yats.vim'  " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'      " JSX/TSX syntax

Plug 'Chiel92/vim-autoformat'

" Syntax Highlight
Plug 'dense-analysis/ale'

" Auto Fix Trailing White-Space
Plug 'bronson/vim-trailing-whitespace'

" Auto Close
Plug 'jiangmiao/auto-pairs'

" Comment
Plug 'tpope/vim-commentary'


call plug#end()

" ------------------------------------
" colorscheme
" ------------------------------------
syntax on

if filereadable(expand("$HOME/.vim/plugged/molokai/colors/molokai.vim"))
    colorscheme molokai
endif

highlight Normal ctermbg=none
