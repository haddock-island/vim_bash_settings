" Author: Hari Narain Ravikumar
" Last Update on: 3/24/2021

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" START OF VUNDLE DETAILS
" Required by Vundle (Vim Pluging Manager) 
" https://github.com/VundleVim/Vundle.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
" Enable filetype plugins
filetype plugin indent on    " required
    

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" https://github.com/vhda/verilog_systemverilog.vim
" Verilog Plugin for Vim
Plugin 'vhda/verilog_systemverilog.vim'

" The NERDTree is a file system explorer for the Vim editor. Using this plugin, users can visually browse 
" complex directory hierarchies, quickly open files for reading or editing, and perform basic file system operations.
Plugin 'preservim/nerdtree'

" Vim Airline. Status bar for vim
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Syntax checking for Vimm
" https://vimawesome.com/plugin/syntastic
" Plugin 'scrooloose/syntastic'

" Fuzzy file, tag, mru finder et
Plugin 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Setting for verilog_systemverilog Plugin
let g:SuperTabDefaultCompletionType = 'context'

"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" END OF VUNDLE DETAILS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HARI's 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " shortcut to load vimrc changes
    let mapleader = "\<Space>"
    nnoremap <leader>rv :source $MYVIMRC<CR>

    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
    
    " NERDtree toggle
    map <C-n> :NERDTreeToggle<CR>
    " Let NERDtree show hidden paths
    let NERDTreeShowHidden=1
    
    " vim-airline config
    let g:airline#extensions#tabline#enabled = 1
    
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Matchit
    " This addon allows using % to jump between matching keywords as Vim already does for matching parentheses/brackets. 
    " Many syntax files include the definition of the matching keyword pairs for their supported languages.
    " Since it is already included in all Vim installations and the addon can be easily loaded by adding the following line to .vimrc:
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    runtime macros/matchit.vim
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => General
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Sets how many lines of history VIM has to remember
    set history=700
    
    " Adding Tags
    set tags=./tags,tags;$HOME
    
    " Set to auto read when a file is changed from the outside
    set autoread

    " If everyone could write code like you, wouldn't the world be a great place? Unfortunately, there are still some jerks who use or don't use tabs, 
    " or maybe they indent with four spaces instead of two, or vice versa, or whatever it is that those jerks do. 
    " You still need to read their code and it helps to be able to quickly switch between popular (and unpopular) tab modes:
    nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
    nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
    nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
    nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
    
    " Those authors might wrap or not wrap lines at 80 or 100 columns or whatever it is you like, so being able to quickly toggle wrap mode helps:
    nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <silent> <dup> :tabfind<CR> :echo @%<CR>

" " Go to tag definition
nnoremap <C-k> <C-]> 
" " Jump back from tag
noremap <C-j> <C-t>
" " Go to next tag
noremap tn :tn<CR>
" " Go to previous tag
noremap tp :tp<CR>
" " Select the proper tag for the word under the cursor
noremap <C-l> :tselect <C-r><C-w><CR>
" " Open tag in a horizontal split
noremap <leader>th <C-w>]
" " Open tag in a vertical split
noremap <leader>tv :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" " Open tag in a new tab
noremap <leader>tt :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" " Copy path of current file to buffer
noremap <leader>cp o<ESC>:let @" = expand('%:p')<CR>pVyu<ESC>
" " Change save file from ':w' to '<space>w'
noremap <leader>w :w<CR>
" " Change quit file from ':q' to '<space>q'
noremap <leader>q :wq<CR>
" " Split current tab vertically
noremap <leader>v <C-W>v<CR>
" " Split current tab horizontally
noremap <leader>H <C-W>S<CR>
" " toggle hybrid line numbers
noremap <leader>nu :set rnu!<CR>
" " count of text under cursor
noremap <leader>8 *<C-O>:%s///gn<CR>
" " move current tab into a new tab
noremap <leader>t :tabnew %<CR>
" " Jump to start of current instance
nnoremap <leader>u :VerilogGotoInstanceStart<CR>
" " Search/Show all modules
" nnoremap <leader>m \(\<\w\+\>\).*\<u_\1\><CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HARI's 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ctrl+Up - increase font size
" Ctrl+Down - derease font size
" \cd - change to directory of current file
" \c - toggle cursor line and cursor column
" \cv - toggle cursor column
" \te - open new tab and go to command line to enter path
" \tn - open new tab
" \tc - close tab
" \r - search and replace selected text
" \g - vimgrep in all files in present directory
" \<space> - vimgrep in current file
" \cc - when searching with vimgrep, display results in cope
" \co - put vimgrep results in seperate tab
" \n - next search for vimgrep
" \p - previous search for vimgrep
" :CDC - change to directory of current file

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Increase/Decrease font size
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <C-Up> :silent! let &guifont = substitute(&guifont, ' \zs\d\+', '\=eval(submatch(0)+1)', '')<CR>
" nnoremap <C-Down> :silent! let &guifont = substitute(&guifont, ' \zs\d\+', '\=eval(submatch(0)-1)', '')<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom mapping of keyboard keys to perform specific function
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim 7 forcing use of tabs from .vimrc
nnoremap gf <C-W>gf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom commands to perform specific function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :CDC = Change to Directory of Current file
" command CDC cd %:p:h

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the Wild menu
set wildmenu

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Make backspace works in insert mode
set backspace=indent,eol,start

" When 'ignorecase' and 'smartcase' are both on, if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not. For example, /The would find only ["The"], while /the would find ["the"] or ["The"] etc.
" The 'smartcase' option only applies to search patterns that you type; it does not apply to * or # or gd. If you press * to search for a word, you can make 'smartcase' apply by pressing / then up arrow then Enter (to repeat the search from history). 

    " Ignore case when searching
    set ignorecase
    
    " When searching try to be smart about cases 
    set smartcase
" With these mappings, if 'smartcase' is on and you press * while on the word ["The"], you will only find ["The"] (case sensitive), but if you press * while on the word ["the"], the search will not be case sensitive. 
:nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
:nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

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
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting if possible
if has("syntax")
	syntax enable
endif

" set color scheme
colorscheme torte
" colorscheme desert
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions+=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" shows the current mode
set showmode

" Set hybrid line Numbering
set number 
set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufLeave,FocusLost,InsertEnter   * set number 
:  autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
:augroup END

" Set font
set guifont=Monospace\ 9

" Preserve various windows sizes
set sessionoptions+=resize

 " Highlight current line
set cursorline
hi CursorLine guibg=#111111
hi CursorColumn guibg=#101010
nnoremap <Leader>c :set cursorline!<CR>
nnoremap <Leader>cv :set cursorcolumn!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation options
set autoindent
set smartindent

"Wrap lines
set wrap 

" Linebreak on 500 characters
set lbr
set tw=500

" set size of single tab to 4 space
set tabstop=4
set expandtab

" set size of indent
set shiftwidth=4

" Be smart when using tabs
set smarttab


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader>h :set hlsearch!<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tk :tabnext<cr>
map <leader>tj :tabprev<cr>
map <leader>tn :tabnew<cr>
" " map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
au InsertEnter * hi statusline guibg=#3a3a3a guifg=#e4e4e4
au InsertLeave * hi statusline guibg=#262626 guifg=#c6c6c6

" default the statusline to green when entering Vim
hi statusline guibg=#262626 guifg=#c6c6c6

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Col:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save, useful for Perl, Tcl, etc
func! DeleteTrailingWS()
   exe "normal mz"
  %s/\s\+$//ge
   exe "normal `z"
endfunc
autocmd BufWrite *.pl :call DeleteTrailingWS()
autocmd BufWrite *.pm :call DeleteTrailingWS()
autocmd BufWrite *.tcl :call DeleteTrailingWS()

" system verilog files highlighting
autocmd BufNewFile,BufRead *.sv,*.v,*.vs set syntax=verilog_systemverilog
noremap <leader>sv :set syntax=verilog_systemverilog<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Enable omnicompletion for syntax (autocomplete programming language commands)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
          \	if &omnifunc == "" |
          \		setlocal omnifunc=syntaxcomplete#Complete |
          \	endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // * .* <left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


" set highlight, cursor and selection colors
hi Search guibg=DarkKhaki guifg=black
hi Visual guibg=#5f5f00 guifg=black
hi Cursor guibg=YellowGreen guifg=black

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction
