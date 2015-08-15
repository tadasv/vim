" Required configuration for Vundle"
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'wincent/command-t'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Configure the rest
syntax on
set equalalways
set splitright splitbelow
set hidden
set hlsearch
set nofoldenable
set spell
set autoindent
set smartindent
set history=1000
set backspace=indent,eol,start
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.a
set directory=~/.vim/swap,~/tmp,/var/tmp/,tmp

let mapleader=","
"" Clear current search
nmap <silent> <leader>/ :nohlsearch<CR>

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType less setlocal shiftwidth=2 tabstop=2 softtabstop=2

augroup Python
        au!
        au FileType python set ai si ts=4 et sts=4 sw=4 sta fo=croq number
        "au FileType python set foldenable foldlevel=1 foldmethod=indent
        au FileType python set nofoldenable
        au FileType python highlight BadWhitespace ctermbg=red guibg=red
        au FileType python match BadWhitespace /^\t\+/
        au FileType python match BadWhitespace /\s\+$/
    au FileType python inoremap # X<c-h>#
    highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    au Filetype python match OverLength /\%81v.\+/
        let python_highlight_all = 1
augroup END
