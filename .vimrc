" Modelines functionality is insecure (see CVE-2002-1377, CVE-2016-1248, CVE-2019-12735)
set modelines=0
set nomodeline

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'             " Package manager
"Plugin 'tpope/vim-fugitive'               " Integration with git (installed via vim-fugitive)
if !has('win32') && !has('win32unix')
  Plugin 'valloric/MatchTagAlways'        " Always highlights the XML/HTML tags that enclose your cursor location
endif
Plugin 'ConradIrwin/vim-bracketed-paste'  " whenever you are in the insert mode and paste into your terminal emulator using command+v, shift+insert, ctrl+shift+v or middle-click, vim will automatically :set paste for you.
Plugin 'mzavoloka/vim-mql'
Plugin 'mzavoloka/vim-perl'
Plugin 'rkennedy/vim-delphi'
"Plugin 'easymotion/vim-easymotion'        " Travel letters on the screen (press ,s to initiate it)    (install it via package vim-easymotion)
Plugin 'mzavoloka/nginx-vim-syntax'
Plugin 'travisjeffery/vim-auto-mkdir'     " Automatically mkdir when writing file in non-existant directory
Plugin 'ntpeters/vim-better-whitespace'   " Highlight trailing whitespaces. Provides :StripWhitespace
Plugin 'junegunn/fzf.vim'                 " Fuzzy finder
"Plugin 'ctrlpvim/ctrlp.vim'               " Full path fuzzy file, buffer, mru, tag, ... finder        (install it via package vim-ctrlp)
"Plugin 'vim-airline/vim-airline'          " Statusline at the bottom of each vim window               (install it via package vim-airline)
"Plugin 'vim-airline/vim-airline-themes'   " Contains 'tomorrow' airline theme                         (install it via package vim-airline)
Plugin 'tpope/vim-vinegar'                " Enhances vim's default file exlorer called netrw,
"Plugin 'scrooloose/nerdtree'              " Project browser (press ,t to open it) (install it via package vim-nerdtree)
Plugin 'henrik/vim-indexed-search'        " While searching, shows the total number of matches and the number(index) of current match
"Plugin 'SirVer/ultisnips'                 " (install it via package vim-ultisnips)
Plugin 'mzavoloka/vim-snippets'           " My Snippets for vim
" Not tested section:
Plugin 'glts/vim-radical'                 " gA shows the four representations of the number under the cursor (or selected in Visual mode).
                                          " crd, crx, cro, crb convert the number under the cursor to decimal, hex, octal, binary, respectively.
Plugin 'tpope/vim-commentary'             " Use gcc to comment out a line (takes a count), gc to comment out the target of a motion (for example, gcap to comment out a paragraph), gc in visual mode to comment out the selection, and gc in operator pending mode to target a comment. You can also use it as a command, either with a range like :7,17Commentary, or as part of a :global invocation like with :g/TODO/Commentary.
" Colorschemes
Plugin 'mzavoloka/vim-colorschemes'       " Contains molokai and github colorschemes
Plugin 'tbastos/vim-lua'
Plugin 'chrisbra/csv.vim'
Plugin 'vim-utils/vim-man'
"Plugin 'svermeulen/vim-easyclip'
"Plugin 'godlygeek/tabular'                " Align declarations with :Tab /= (install it via package vim-tabular)
"Plugin 'godlygeek/vim-indent-object'      " select tabulated block of code with ii, ai, aI (install it via package vim-indent-object)
"Plugin 'luisjure/vim-csound'              " (install it via package vim-csound)
"Plugin 'pearofducks/vim-ansible'          " (install it via package vim-ansible)
"Plugin 'preservim/tagbar'                 " (install it via package vim-tagbar)

" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Open fugitive windows at bottom, not at top
set splitbelow
" Set vsplit to the right
set splitright
" Make fugitive open Gdiff vertically
set diffopt+=vertical

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=10000

set nu
set rnu

set regexpengine=1 " use old regexp engine because old one produces lags upon typing if syntax is enabled
"set nornu         " NOTE for speeding up even more, consider to stop using relative line numbers

set t_Co=256

set colorcolumn=100

set autoread " autodetect file changes by another program

let mapleader = ","
let g:mapleader = ","

au BufNewFile,BufRead *html.ep set filetype=html " Embedded perl .html.ep (used by Mojolicious)
au BufNewFile,BufRead *tmpl set filetype=html " HTML::Template templates
au BufNewFile,BufRead *sql set filetype=plsql " postgres highlight for .sql files
autocmd BufNewFile,BufReadPost *.mq[h45] setlocal filetype=mql

let $PAGER='' " View man pages in vim

" Make hotkeys work with russian. To change language press C+^
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=-1 " Use current keymap while searching

" Mandatory. Fixes delay when exiting visual mode. Also affects leader key delay.
" Default it 500 ms
set timeoutlen=100


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Hotkeys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hotkey to change vim current directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" while cursor is under perl module name for accessing its source code
function! LoadPerlModule()
    execute 'e `perldoc -l ' . expand("<cWORD>") . '`'
endfunction
nnoremap <Leader>pm :call LoadPerlModule()<CR>

" Use Shift + K shortcut while cursor is under perl module name for accessing its documentation
au FileType perl setlocal keywordprg=perldoc\ -T\ -f

" :W writes files with sudo even if current vim instance has no sudo privilege
command W w !sudo tee % > /dev/null

map <Leader>s <Plug>(easymotion-s)
map <Leader>co :copen<CR>

map <Leader>t :NERDTreeToggle<CR>

" enable selecting with mouse
set mouse=a
" enable to copy selected text with mouse
vmap <C-C> "+y


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
"set wildmenu

" Ignore compiled files
"set wildignore=*.o,*~,*.pyc

" Height of the command bar
"set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

set hlsearch   " Highlight search
set ignorecase " Ignore case when searching
set smartcase  " When searching try to be smart about cases
set incsearch  " Makes search act like search in modern browsers

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
let molokai_original = 1
color molokai
"color github
"Change theme depending on the time of day
let hr = (strftime('%H'))
if hr >= 20 " evening
    color molokai
elseif hr >= 7 " day
    color github
elseif hr >= 0 " night
    color molokai
endif

set termguicolors " full color support for colorschemes

syntax enable

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


" Turn off backup and swap files
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab " Use spaces instead of tabs

set smarttab

" Tabwidth (num of spaces)
set shiftwidth=4
set tabstop=4

"autocmd BufRead,BufNewFile *.tmpl,*.htm,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html,vue,css setlocal tabstop=2 shiftwidth=2 softtabstop=2

set ai "Auto indent
set si "Smart indent

set wrap " wrap long lines
set nolbr " wrap at any character


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Alt-j and Alt-k to move screen one line down or up
" first make alt work
map <Esc>j <A-j>
map <Esc>k <A-k>
" then actual mapping
map <A-j> <C-e>
map <A-k> <C-y>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Switch windows faster
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set tabpagemax=100

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  "set switchbuf=useopen,usetab,newtab
  set switchbuf=useopen,usetab " Makes quickfixlist open everything in one tab
  set stal=2
catch
endtry

" 0 to move to first non-blank character
map 0 ^


""""""""""""""""""""""""""""""
" =>  Airline
let g:airline_powerline_fonts=1
let g:airline_detect_paste=0
" don't show keymap 'Keymap: russian-jcukenwin' in airline (it takes too much space)
let g:airline#extensions#keymap#enabled=0
let g:airline_section_x='' " (tagbar, filetype, virtualenv)
let g:airline_section_y='' " disable (fileencoding, fileformat)
let g:airline_theme='tomorrow'


" RS: repeat substitution command
com! -range -nargs=* RS call RepeatSubst(<q-args>)
" RepatSubst:
fun! RepeatSubst(subexpr)
  if a:subexpr != ""
    let g:repeatsubst= a:subexpr
  endif
  let curcol= col(".")
  let sep = strpart(g:repeatsubst,0,1)
  let pat = substitute(g:repeatsubst,'^.\(.\{-}\)'.sep.'.*$','\1','')
  s/\%#./\r&/
  let curcol= curcol + matchend(getline("."),pat)
  exe "s".g:repeatsubst
  norm! k
  j!
  exe 'norm! '.curcol.'|'
endfun

" Always copy to clipboard
if has('win32') || has('win32unix')
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif


" Make netrw use tree mode by default
let g:netrw_liststyle = 3

" Make nerdtree show dotfiles by default
let NERDTreeShowHidden=1

let g:tagbar_sort = 0 " tagbar sort order as in source file

" allow to move cursor anywhere
set virtualedit=all

" Affects tabbing while using cmdline :
set wildmode=list:longest "	When more than one match, list all matches and complete till longest common string.

set tw=0             " Might not work (overridden by plugins)
set formatoptions-=t " Disables text wrapping

" Adds ability to select a specific jump when calling :jumps
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction
nmap <Leader>j :call GotoJump()<CR>

set grepprg=ack\ -k " Use ack for :grep command

let g:ctrlp_map = '<leader>p'
nmap <Leader>f :Files<CR>

let $BAT_THEME='Solarized (light)'

let $BASH_ENV = "~/.bash_aliases" " Enable some bash aliases inside vim

""""" Insert mode indication
""" Highlight current line if insert mode is on
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

""" Change cursor shape while in insert mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[1 q"
augroup END
" Other options (replace the number after \e[):
" Ps = 0  -> blinking block.
" Ps = 1  -> blinking block (default).
" Ps = 2  -> steady block.
" Ps = 3  -> blinking underline.
" Ps = 4  -> steady underline.
" Ps = 5  -> blinking bar (xterm).
" Ps = 6  -> steady bar (xterm).
"""""
