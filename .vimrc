let $LANG='en'
set langmenu=en

"let mapleader = ","
"is following leader a better choice?
let mapleader = "\<Space>"

filetype off

set rtp+=~/.vim
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
        if(!has("win32") && !has("win95") && !has("win64") && !has("win16"))
            set fileencodings=utf-8,cp936
        else
            set fileencodings=cp936,utf-8
        endif
    endif
else
	echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif

" allow backspacing over everything in insert mode


"set guioptions-=T
"set nowritebackup
set autochdir
set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set cindent
set expandtab
"set guifont=Source\ Code\ Pro:h14:cANSI
set guifont=Fira\ Code:h16:cANSI
set history=50      " keep 50 lines of command line history
set hlsearch
set ignorecase smartcase
set incsearch       " do incremental searching
set nobackup
set nocompatible
set novisualbell
set nu
set rnu
set ruler       " show the cursor position all the time
set scrolloff=1
set shiftwidth=4
set shortmess=a
set shiftround
set showcmd     " display incomplete commands
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
set timeoutlen=250
set ttimeoutlen=250
set ffs=unix,dos
if has('win32')
    set cul " hilight current line
endif
" better format for 'J'
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif

match ErrorMsg '\%>120v.\+'
match ErrorMsg '\s\+$'

syntax on
Plugin 'ctjhoa/spacevim'
Plugin 'osyo-manga/vim-over'
    map <Leader>oc :OverCommandLine<CR>

Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-sensible'
Plugin 'dbakker/vim-projectroot'
    nnoremap <leader>dp :ProjectRootCD<cr>
    nnoremap <leader>g :ProjectRootExe grep<space>
    nnoremap <expr> <leader>ep ':edit '.projectroot#guess().'/'
    nnoremap <silent> <leader>dt :ProjectRootExe NERDTreeFind<cr>

Plugin 'pelodelfuego/vim-swoop'
    let g:swoopUseDefaultKeyMap = 0
    let g:swoopIgnoreCase = 1
    let g:swoopAutoInserMode = 0
    nmap <Leader>sl :call Swoop()<CR>
    vmap <Leader>sl :call SwoopSelection()<CR>
    nmap <Leader>ml :call SwoopMulti()<CR>
    vmap <Leader>ml :call SwoopMultiSelection()<CR>

Plugin 'kana/vim-arpeggio'

Plugin 'mhinz/vim-startify'
Plugin 'haya14busa/incsearch.vim'
    let g:incsearch#auto_nohlsearch = 1
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
    map n  <Plug>(incsearch-nohl-n)
    map N  <Plug>(incsearch-nohl-N)
    map *  <Plug>(incsearch-nohl-*)
    map #  <Plug>(incsearch-nohl-#)
    map g* <Plug>(incsearch-nohl-g*)
    map g# <Plug>(incsearch-nohl-g#)

Plugin 'scrooloose/syntastic'
let g:syntastic_python_pylint_quiet_messages = { "level" : "warnings" }
    function! OpenErrors()
        silent execute ':Errors'
        silent execute ':lopen'
    endfunction
    map <leader>er :call OpenErrors()<cr>

Plugin 'ervandew/supertab'
Plugin 'OmniCppComplete'
Plugin 'scrooloose/nerdtree'
    nnoremap <silent><F8> :NERDTreeToggle<cr>

Plugin 'jiangmiao/auto-pairs'

Plugin 'SirVer/ultisnips'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

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
    :nmap ffb :FufBuffer<cr>
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

Plugin 'vim-airline/vim-airline'
    set laststatus=2
    let g:airline#extensions#tagbar#enabled = 1

Plugin 'vim-airline/vim-airline-themes'

" gc{motion} comment or uncomment lines that {motion} moves over
" [count]gcc comment or uncomment [count] lines
" [range]gc comment or uncomment lines that ranged
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
Plugin 'tpope/vim-commentary'

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

Plugin 'FelikZ/ctrlp-py-matcher'
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

Plugin 'tacahiroy/ctrlp-funky'
    nnoremap <Leader>fu :CtrlPFunky<Cr>
    " narrow the list down with a word under cursor
    nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

Plugin 'brookhong/cscope.vim'
    " disable the messages for database updated
    let g:cscope_silent = 1
    " if total files in directory exceeds it, split the database to avoid long
    " time of updating
    let g:cscope_split_threshold = 9999

    nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<cr>
    nnoremap <leader>ll :call ToggleLocationList()<cr>
    " s: Find this C symbol
    nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<cr>
    " g: Find this definition
    nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<cr>
    " d: Find functions called by this function
    nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<cr>
    " c: Find functions calling this function
    nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<cr>
    " t: Find this text string
    nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<cr>
    " e: Find this egrep pattern
    nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<cr>
    " f: Find this file
    nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<cr>
    " i: Find files #including this file
    nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<cr>

Plugin 'Yggdroot/indentLine'
    "let g:indentLine_color_gui = '#A4E57E'
    let g:indentLine_color_gui = '#808080'

Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'
    " textobj 'ae/ie' for entire buffer

Plugin 'nelstrom/vim-visual-star-search'

Plugin 'A.vim'
    " unmap following keys
    nmap <A-o> :A<cr>

"if(!has("win32") && !has("win95") && !has("win64") && !has("win16"))
    "Plugin 'amoffat/snake'
"endif

"Plugin 'moll/vim-node'
    "set runtimepath^=~/.vim/bundle/node

Plugin 'mhinz/vim-grepper'
    let g:grepper = {
                \ 'tools': ['ag', 'git', 'grep', 'ack'],
                \ 'open': 0,
                \ 'jump': 1,
                \ }
    nnoremap <leader>git :Grepper -open -switch -tool git<cr>
    nnoremap <leader>ag :Grepper -open -switch -tool ag -grepprg ag --hidden<cr>

Plugin 'majutsushi/tagbar.git'
"Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
  let g:vim_markdown_folding_disabled = 1

Plugin 'WolfgangMehner/bash-support'
Plugin 'ekalinin/Dockerfile.vim'
if has('win32')
    Plugin 'rking/ag.vim'
else
    Plugin 'junegunn/fzf.vim'
endif

"Plugin 'jimenezrick/vimerl'
"Plugin 'fatih/vim-go'

call vundle#end()


filetype plugin on
filetype plugin indent on

let g:fencview_autodetect=1

nmap <leader>ev :e ~/.vimrc<cr>
nmap <leader>sv :so ~/.vimrc<cr>
nmap <leader>sp :sp<cr>
nmap <leader>vs :vs<cr>
nmap <leader>hs :sp<cr>
nmap <leader>o o<esc>
nmap <leader>O O<esc>
nmap <leader>w :w<cr>
nmap <leader>x :x<cr>
nmap <leader>q :q<cr>
nmap <silent> <leader>exp :Explore<cr>

nmap <A-g> :Utl<cr>
nmap gw <Esc>:sp %<cr> gf
nmap <C-s> :w<cr>
nmap <C-x><C-s> :wall<cr>
nmap <C-x>1 :only<cr>

nnoremap <BS> gg
imap <C-t> <esc>xpi
imap <C-k> <esc><Right>C
nmap <C-k> <esc>D

nnoremap <BS> {
onoremap <BS> {
vnoremap <BS> {

nnoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
onoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
vnoremap <CR> }
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-h> <Left>
inoremap <M-l> <Right>

map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>th :tabp<cr>
map <leader>tl :tabn<cr>

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

nmap <A-F8> :call SaveAndFormat()<cr><cr><cr>

function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

if has('win32')
    au GUIEnter * simalt ~x
else
    au GUIEnter * call MaximizeWindow()
endif

function! RemoveTrailingWhiteSpace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction

autocmd BufWritePre * call RemoveTrailingWhiteSpace()

" remove some annoying key maps added by some plugs (hi, A.vim there!)
let g:annoyingKeyMapsRemoved = 0
function! RemoveAnnoyingKeyMaps()
    if (g:annoyingKeyMapsRemoved == 0)
        iunmap<silent> <Leader>is
        iunmap<silent> <Leader>ih
        iunmap<silent> <Leader>ihn
        let g:annoyingKeyMapsRemoved = 1
    endif
endfunction

autocmd BufReadPre * call RemoveAnnoyingKeyMaps()
