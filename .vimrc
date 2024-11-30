syntax on
set tabstop=2

" found from
" https://stackoverflow.com/questions/65076/how-do-i-set-up-vim-autoindentation-properly-for-editing-python-files
set showmatch
set ts=4
set sts=4
set sw=4
set autoindent
set smartindent
set smarttab
set expandtab
set autoread
" Explicitly enable true colors 
" change color of tab line and tab area 
:hi TabLineFill ctermfg=Black ctermbg=Black
:hi TabLine ctermfg=Yellow ctermbg=Black
set breakindent
set breakindentopt=shift:2
"make completion more aware 
set infercase 
set wildmenu
set wildmode=full
set ai
set relativenumber
set number 
set hlsearch
set ruler
" repeat an existing line 
highlight Comment ctermfg=green
"normal bindings 
nnoremap ;w :w<CR>
nnoremap ;q :wq<CR>
nnoremap vc :vs ~/.vimrc<CR>
nnoremap <return> :noh<return><esc>
nnoremap cp :call CompileRunGcc()<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
"nnoremap <C-h> :RandomColorScheme<CR> 

"Disable Ranger default keybinding and rebind
let g:ranger_map_keys = 0
map tt :Ranger<CR>

func! CompileRunGcc()
        exec "w"
        exec "!clear"
        if &filetype == 'c'
        exec "!gcc -g % -o %<"
        exec "!time ./%<"
        elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
        elseif &filetype == 'java'
        exec "!time java -cp %:p:h %:t:r"
        elseif &filetype == 'sh'
        exec "!time bash %"
        elseif &filetype == 'python'
        exec "!time python3 %"
        elseif &filetype == 'html'
        exec "!firefox % &"
        elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
        elseif &filetype == 'md'
        exec "!pandoc % -f markdown -t html > %.html"
        exec "!firefox %.html"
        exec "!rm %.html"
        elseif &filetype == 'lua'
        exec "!time lua %"
        endif 
endfunc

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin() 
        "Plug 'tpope/vim-surround' " Surrounding ysw)
        Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
        Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
        Plug 'honza/vim-snippets'
        Plug 'tmsvg/pear-tree'
        " let Vundle manage Vundle, required
        Plug 'grvcoelho/vim-javascript-snippets'
        Plug 'xolox/vim-colorscheme-switcher'
        Plug 'xolox/vim-misc'
        Plug 'francoiscabrol/ranger.vim'
        Plug 'airblade/vim-gitgutter'
        Plug 'tpope/vim-fugitive'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'morhetz/gruvbox'


call plug#end()

" Gruvbox config colorscheme config  
set background=dark
colorscheme gruvbox
set termguicolors



" map jj to exit insert mode 
inoremap jj <ESC>
"much better default behavior for editing line above cursor 
noremap {<CR> {<CR>}<C-o>O

" Improved git 
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1 
let g:airline_powerline_fonts = 1
" Git gutter color configs for gruvbox dark colorscheme 
highlight GitGutterAdd guifg=#b8bb26 guibg=NONE
highlight GitGutterChange guifg=#fabd2f guibg=NONE
highlight GitGutterDelete guifg=#fb4934 guibg=NONE



