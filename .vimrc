set nocompatible
set novisualbell

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" multi-encoding setting
if has("multi_byte")
	"set bomb
	set encoding=cp936
	set fileencodings=utf-8,utf-16le,utf16,unicode,cp936,ucs-bom,big5,euc-jp,euc-kr,latin1
	" CJK environment detection and corresponding setting
	if v:lang =~ "^zh_CN"
		" Use cp936 to support GBK, euc-cn == gb2312
		set encoding=cp936
		set fileencodings=utf-8,utf-16le,utf16,unicode,cp936,ucs-bom,big5,euc-jp,euc-kr,latin1
		set termencoding=cp936
		elseif v:lang =~ "^zh_TW"
		" cp950, big5 or euc-tw
		" Are they equal to each other?
		set encoding=big5
		set termencoding=big5
		set fileencoding=big5
	elseif v:lang =~ "^ko"
		" Copied from someone's dotfile, untested
		set encoding=euc-kr
		set termencoding=euc-kr
		set fileencoding=euc-kr
	elseif v:lang =~ "^ja_JP"
		" Copied from someone's dotfile, untested
		set encoding=euc-jp
		set termencoding=euc-jp
		set fileencoding=euc-jp
	endif
	" Detect UTF-8 locale, and replace CJK setting if needed
	if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
		set encoding=utf-8
		set termencoding=utf-8
		set fileencodings=cp936,utf-8
	endif
else
	echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch       " do incremental searching
set scrolloff=3
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nobackup
"set nowritebackup
set rnu
set nu
set ignorecase smartcase
set si
set shortmess=a
set autoread
set autowrite
set guifont=Source\ Code\ Pro:h12:cANSI

Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'OmniCppComplete'
Bundle 'scrooloose/nerdtree'
Bundle 'jiangmiao/auto-pairs'

" required by snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim' 
Bundle 'garbas/vim-snipmate' 
" optional
Bundle 'honza/vim-snippets' 

" Required by FuzzyFinder
Bundle 'L9' 
Bundle 'FuzzyFinder'
    :nmap fff :FufFile<cr>
    :nmap ffd :FufDir<cr>

" <LEADER><LEADER>w -- jump to words
" <LEADER><LEADER>f<char> -- jump to <char>
Bundle 'Lokaltog/vim-easymotion'
    omap z <Plug>(easymotion-t)
    let g:EasyMotion_keys='hklyuiopnm,qwertzxcvbasdgjf;'
    let g:EasyMotion_smartcase = 1
    nmap <space> <Plug>(easymotion-bd-w)
    nmap <S-space> <Plug>(easymotion-bd-e)


" <LEADER>cc -- comment
" <LEADER>c<SPACE> -- comment toggle
" <LEADER>ci -- comment invert(commented to uncommented and vice versa)
" <LEADER>cA -- comment at the end of line
Bundle 'scrooloose/nerdcommenter'
    map ,c <plug>NERDCommenterInvert

Bundle 'bling/vim-airline'
    set laststatus=2

" gc{motion} comment or uncomment lines that {motion} moves over
" [count]gcc comment or uncomment [count] lines
" [range]gc comment or uncomment lines that ranged
Bundle 'tpope/vim-commentary'

" <C-n> -- mark one word under cursor per strike
" <C-p> -- mark one previous word under cursor per strike
" <C-x> -- mark one next word under cursor per strike
" once marked some words, use 'c', 'i' or some other commands to modify all of them
Bundle 'terryma/vim-multiple-cursors'

Bundle 'Mark'

" + -- increase selected region
" - -- decrease selected region
Bundle 'terryma/vim-expand-region'

Bundle 'mbbill/undotree'
    :nmap <LEADER>ut :UndotreeToggle<cr>
    :nmap <LEADER>uf :UndotreeFocus<cr>
    if has("persistent_undo") 
        set undodir='C:/Users/SeeWhy/.vim/.undodir/' 
        set undofile 
    endif


Bundle 'mileszs/ack.vim'
Bundle 'zhchang/quick_file'
    map qf :QF <c-r><c-w>


"Bundle 'klen/python-mode.git'
    " let g:pymode_doc_bind = 'K'
"    let g:pymode_run = 1 
"    let g:pymode_run_bind = '<leader>pr'
    " let g:pymode_breakpoint_bind = '<leader>b'
    " let g:pymode_rope_show_doc_bind = '<C-c>d'
    " let g:pymode_rope_completion_bind = '<C-Space>'
"    let g:pymode_rope_completion_bind = '<C-c><Space>'
    " let g:pymode_rope_goto_definition_bind = '<C-c>g'
    " let g:pymode_rope_rename_bind = '<C-c>rr'
    " let g:pymode_rope_rename_module_bind = '<C-c>r1r'
    " let g:pymode_rope_organize_imports_bind = '<C-c>ro'
    " let g:pymode_rope_autoimport_bind = '<C-c>ra'
    " let g:pymode_rope_module_to_package_bind = '<C-c>r1p'
    " let g:pymode_rope_extract_method_bind = '<C-c>rm'
    " let g:pymode_rope_extract_variable_bind = '<C-c>rl'
    " let g:pymode_rope_use_function_bind = '<C-c>ru'
    " let g:pymode_rope_move_bind = '<C-c>rv'
    " let g:pymode_rope_change_signature_bind = '<C-c>rs'
"    let g:pymode_options_max_line_length = 160
"    let g:pymode_folding = 0
    " disable active lint of synstatic for python, which may conflict with
    " pymode
"    let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

" ds[char]: remove surround [char]
" cs[char1][char2]: change surround [char1] to [char2]
" ysiw[char]: surround current word with [char]
" v[motion]S[char]: surround motioned chars with [char]
Bundle 'tpope/vim-surround.git'

" Extend repeat action(ie. '.') to plugins
Bundle 'tpope/vim-repeat.git'

Bundle 'wlangstroth/vim-racket'

" <Lead>ig to toggle the indent guide
"Bundle 'nathanaelkane/vim-indent-guides'
    "let g:indent_guides_enable_on_vim_startup = 1
    "let g:indent_guides_space_guides = 1

Bundle 'vim-voom/VOoM'
Bundle 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['black',       'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
    let g:rbpt_max = 16
    let g:rbpt_loadcmd_toggle = 0
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
Bundle 'kien/ctrlp.vim'
  let g:ctrlp_regexp = 1

Bundle 'brookhong/cscope.vim'

Bundle 'Yggdroot/indentLine'
    let g:indentLine_color_gui = '#A4E57E'

Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-entire'
    " textobj 'ae/ie' for entire buffer

Bundle 'nelstrom/vim-visual-star-search'

Bundle 'A.vim'

filetype plugin on
filetype plugin indent on

let g:fencview_autodetect=1

set backspace=indent,eol,start
set ruler
set	rnu
set nu
set smartcase
set ignorecase
set hls
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=3
set smarttab
set smartindent
set expandtab
set nobackup
set shortmess=a
set incsearch

let mapleader = ","
nmap <leader>evrc :e ~/.vimrc<CR>
nmap F6 so ~/.vimrc<CR>

" switch between window/pane as same as tmux
nmap <C-A> <C-W>
nmap <C-w>\| <C-w>v<C-w>l
nmap <C-w>- <C-w>s<C-w>j

" infinite undo
set undofile
set undodir=~/.vim/.undodir

" auto save all files on focus lost
:au FocusLost * silent| wa
