"let mapleader = ","
"is following leader a better choice?
let mapleader = "\<Space>" 
 
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

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
set hlsearch
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
set guifont=Source\ Code\ Pro:h14:cANSI
set nocompatible
set novisualbell
set timeoutlen=250
set ttimeoutlen=250

syntax on

Plugin 'scrooloose/syntastic'
    let g:syntastic_python_pylint_quiet_messages = { "level" : "warnings" }
    function! OpenErrors()
        silent execute ':Errors'
        silent execute ':lopen'
    endfunction
    map <leader>er :call OpenErrors()<CR>

Plugin 'ervandew/supertab'
Plugin 'OmniCppComplete'
Plugin 'scrooloose/nerdtree'
    nnoremap <silent><F8> :NERDTreeToggle<cr>

Plugin 'jiangmiao/auto-pairs'

" required by snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim' 
Plugin 'garbas/vim-snipmate' 
" optional
Plugin 'honza/vim-snippets' 

" Required by FuzzyFinder
Plugin 'L9' 
Plugin 'FuzzyFinder'
    :nmap fff :FufFile<cr>
    :nmap ffd :FufDir<cr>
    :nmap ffh :FufHelp<cr>

" <leader><leader>w -- jump to words
" <leader><leader>f<char> -- jump to <char>
Plugin 'Lokaltog/vim-easymotion'
    omap z <Plug>(easymotion-t)
    let g:EasyMotion_keys='hklyuiopnm,qwertzxcvbasdgjf;'
    let g:EasyMotion_smartcase = 1
    nmap <A-Space> <Plug>(easymotion-bd-w)
    nmap <S-Space> <Plug>(easymotion-bd-e)

" <leader>cc -- comment
" <leader>c<SPACE> -- comment toggle
" <leader>ci -- comment invert(commented to uncommented and vice versa)
" <leader>cA -- comment at the end of line
Plugin 'scrooloose/nerdcommenter'
    map <C-CR> <plug>NERDCommenterInvert
    map <C-/> <plug>NERDCommenterInvert
    map <leader>c <plug>NERDCommenterInvert

Plugin 'bling/vim-airline'
    set laststatus=2

" gc{motion} comment or uncomment lines that {motion} moves over
" [count]gcc comment or uncomment [count] lines
" [range]gc comment or uncomment lines that ranged
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rsi'

" <C-n> -- mark one word under cursor per strike
" <C-p> -- mark one previous word under cursor per strike
" <C-x> -- mark one next word under cursor per strike
" once marked some words, use 'c', 'i' or some other commands to modify all of them
Plugin 'terryma/vim-multiple-cursors'

Plugin 'Mark'

" + -- increase selected region
" - -- decrease selected region
Plugin 'terryma/vim-expand-region'
    vmap v <Plug>(expand_region_expand)
    vmap <C-v> <Plug>(expand_region_shrink)

Plugin 'mbbill/undotree'
    :nmap <leader>ut :UndotreeToggle<cr>
    :nmap <leader>uf :UndotreeFocus<cr>
    if has("persistent_undo") 
        set undodir='~/.vim/.undodir/' 
        set undofile 
    endif


Plugin 'mileszs/ack.vim'
Plugin 'zhchang/quick_file'
    map qf :QF <c-r><c-w>


"Plugin 'klen/python-mode.git'
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
Plugin 'tpope/vim-surround.git'

" Extend repeat action(ie. '.') to plugins
Plugin 'tpope/vim-repeat.git'

" <Lead>ig to toggle the indent guide
"Plugin 'nathanaelkane/vim-indent-guides'
    "let g:indent_guides_enable_on_vim_startup = 1
    "let g:indent_guides_space_guides = 1

Plugin 'vim-voom/VOoM'
Plugin 'kien/rainbow_parentheses.vim'
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

Plugin 'kien/ctrlp.vim'
  let g:ctrlp_regexp = 1

Plugin 'brookhong/cscope.vim'
    " disable the messages for database updated
    let g:cscope_silent = 1
    " if total files in directory exceeds it, split the database to avoid long
    " time of updating
    let g:cscope_split_threshold = 9999

    nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
    nnoremap <leader>l :call ToggleLocationList()<CR>
    " s: Find this C symbol
    nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
    " g: Find this definition
    nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
    " d: Find functions called by this function
    nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
    " c: Find functions calling this function
    nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
    " t: Find this text string
    nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
    " e: Find this egrep pattern
    nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
    " f: Find this file
    nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
    " i: Find files #including this file
    nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

Plugin 'Yggdroot/indentLine'
    "let g:indentLine_color_gui = '#A4E57E'
    let g:indentLine_color_gui = '#808080'

Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'
    " textobj 'ae/ie' for entire buffer

Plugin 'nelstrom/vim-visual-star-search'

Plugin 'A.vim'
    " unmap following keys
    imap <Leader>is is
    iunmap <Leader>is
    imap <Leader>ihn ihn
    iunmap <Leader>ihn

if(!has("win32") && !has("win95") && !has("win64") && !has("win16"))
    Plugin 'amoffat/snake'
endif

Plugin 'moll/vim-node'
    set runtimepath^=~/.vim/bundle/node

Plugin 'briancollins/vim-jst' 

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
set autoindent
set smartindent
set cindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=3
set smarttab
set expandtab
set nobackup
set shortmess=a
set incsearch
set autochdir

nmap <leader>ev :e ~/.vimrc<CR>
nmap <leader>sv :so ~/.vimrc<CR>
nmap <leader>sp :sp <CR>
nmap <leader>vs :vs <CR>
nmap <leader>o o<ESC>
nmap <leader>O O<ESC>
nmap <leader>w :w<ESC>
nmap <silent> <leader>exp :Explore<cr>

nmap <A-o> :A<cr>
nmap <A-g> :Utl<cr>
nmap gw <Esc>:sp %<CR> gf

nnoremap <BS> gg 
nmap <A-F8> gg=G<C-o><C-o>

imap <C-t> <ESC>xpi

" infinite undo
set undofile
set undodir=~/.vim/.undodir

" enable zsh-like Tab complete
set wildmenu
set wildmode=full

" auto save all files on focus lost if the buffer has a name
function! AutoSaveIfSavable()
    let filename = expand("<afile>")
    if empty(filename)
        return
    endif

    let currword = expand("<cWORD>")
    if empty(currword)
        return
    endif

    silent| wa!
    echo filename "saved\r"
endfunction

:au FocusLost * call AutoSaveIfSavable()

if(!has("win32") && !has("win95") && !has("win64") && !has("win16"))
    set t_Co=256
endif


function! SaveAndFormat()
    silent execute ':w'
    silent execute '!astyle --style=java -s -c -j -n -p -v -H -K -N -U -xn -xc -xl -xk -k3 -W3 %:h/%:t'
    silent execute ':e %:h/%:t'
endfunction

nmap <A-F8> :call SaveAndFormat()<CR><CR><CR>
