
" Plugin
call plug#begin()

" vim-startify
Plug 'mhinz/vim-startify'

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" indentLine
Plug 'Yggdroot/indentLine'

" theme
" Plug 'w0ng/vim-hybrid'

" nerdtree
Plug 'preservim/nerdtree'

" ctrlp
Plug 'kien/ctrlp.vim'

" easymotion
Plug 'easymotion/vim-easymotion'

" vim-surround
Plug 'tpope/vim-surround'

" fzf.vim
" fzf#install() makes sure the fzf is the latest
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" far.vim
Plug 'brooth/far.vim'

" vim-go
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" python-mode
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" neoformat
Plug 'sbdchd/neoformat'

" ale
Plug 'dense-analysis/ale'

" vim-commentary
Plug 'tpope/vim-commentary'

" vim-fugitive(git)
" Plug 'tpope/vim-fugitive'

" vim-gitgutter
Plug 'airblade/vim-gitgutter'

" gv.vim
" Plug 'tpope/vim-fugitive'
" Plug 'junegunn/gv.vim'

" vim-markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

" vim-instant-markdown
" Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}


" Initialize plugin system
call plug#end()

" set the color scheme after the theme provider has been loaded
" set background=dark
" colorscheme hybrid

" Nerd tree keymap
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" easymotion
" search by 2 char
map ss <Plug>(easymotion-s2)

set number
syntax on
