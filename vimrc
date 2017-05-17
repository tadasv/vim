" Required configuration for Vundle"
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'wincent/command-t'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'fatih/vim-go'
Plugin 'elzr/vim-json'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'belltoy/vim-protobuf'
Plugin 'hashivim/vim-terraform'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-dispatch'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:vim_json_syntax_conceal = 0

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction



colorscheme wombat256i
" Configure the rest
syntax on
set equalalways
set splitright splitbelow
set hidden
set hlsearch
set nofoldenable
set nospell
set autoindent
set smartindent
set history=1000
set backspace=indent,eol,start
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.a
set directory=~/.vim/swap,~/tmp,/var/tmp/,tmp
set autowrite

let mapleader=","
"" Clear current search
nmap <silent> <leader>/ :nohlsearch<CR>
nmap gd :YcmCompleter GoToDefinition<CR>
nmap gr :YcmCompleter GoToReferences<CR>
nmap doc :YcmCompleter GetDoc<CR>


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
autocmd FileType sh setlocal noexpandtab

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
au FileType go nmap <leader>c <Plug>(go-coverage-browser)

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
        autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
augroup END
