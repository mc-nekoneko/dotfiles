call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'

" Fuzzy finder (requires fzf installed)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'ujihisa/unite-colorscheme'
Plug 'tomasr/molokai'

" Custom Plug

Plug 'itchyny/lightline.vim'

Plug 'preservim/nerdtree'

Plug 'andrewstuart/vim-kubernetes'

Plug 'Chiel92/vim-autoformat'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" JS/TS
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'HerringtonDarkholme/yats.vim'  " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'      " JSX/TSX syntax

" toml
Plug 'cespare/vim-toml'

" tf
Plug 'hashivim/vim-terraform'
let g:terraform_fmt_on_save = 1

Plug 'tpope/vim-endwise'

" html
Plug 'alvan/vim-closetag'

" lsp
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

" LSP -> C/CPP (auto-configured by vim-lsp-settings with clangd)

" LSP -> Python (auto-configured by vim-lsp-settings)
" Install: pip install python-lsp-server

" HTML (auto-configured by vim-lsp-settings with vscode-html-language-server)

" LSP -> Go (auto-configured by vim-lsp-settings with gopls)
" Format on save handled by vim-go

" LSP -> Java (auto-configured by vim-lsp-settings with eclipse.jdt.ls)
" For Lombok support, set the following in your environment:
" let g:lsp_settings = {'eclipse-jdt-ls': {'initialization_options': {'bundles': [expand('~/lsp/lombok.jar')]}}}
let s:lombok_path = $HOME . '/lsp/lombok.jar'
if filereadable(expand(s:lombok_path))
    let g:ale_java_javac_options = "-cp " . s:lombok_path
endif

" Markdown
if executable('prettier')
    " [markdown] configure formatprg
    autocmd FileType markdown set formatprg=prettier\ --parser\ markdown

    " [markdown] format on save
    autocmd! BufWritePre *.md call s:mdfmt()
    function s:mdfmt()
        let l:curw = winsaveview()
        silent! exe "normal! a \<bs>\<esc>" | undojoin |
            \ exe "normal gggqG"
        call winrestview(l:curw)
    endfunction
endif


" rust (rust-analyzer is auto-configured by vim-lsp-settings)
Plug 'rust-lang/rust.vim'

let g:asyncomplete_auto_popup = 1

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Plug 'ervandew/supertab'
" Plug 'maralla/completor.vim'
" Plug 'Valloric/YouCompleteMe'
"let g:ycm_global_ycm_extra_conf = '${HOME}/.ycm_extra_conf.py'
"let g:ycm_auto_trigger = 1
"let g:ycm_min_num_of_chars_for_completion = 3
"let g:ycm_autoclose_preview_window_after_insertion = 1
"set splitbelow

" Auto LSP server installer and configurator
" Run :LspInstallServer in a buffer to install the LSP for that filetype
Plug 'mattn/vim-lsp-settings'


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

if filereadable(expand("$HOME/.config/nvim/plugged/molokai/colors/molokai.vim"))
    colorscheme molokai
endif

highlight Normal ctermbg=none
