" New .vimrc: Very python dev specific setup, with minor additions for dealing
" with other workflow
"
" needed to setup pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" code folding
set foldmethod=indent
set foldlevel=99

"movement with edit more
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

nmap Y y$
map ,ws :%s/\s$//<cr>

if has("unix")
    cmap %/ <C-R>=expand("%:p:h") . '/'<CR>
else
    cmap %/ <C-R>=expand("%:p:h") . '\'<CR>
endif

" Task list
map <leader>td <Plug>TaskList
" graphical undo, revision history
map <leader>g :GundoToggle<CR>

" syntax and code indenting
syntax on
filetype on
filetype plugin indent on
colors solarized
set background=dark

" don't let pyflakes use quickfix window
let g:pyflakes_use_quickfix = 0
" pep8 plugin to keep code more consistent
let g:pep8_map='<leader>8'


au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" NERDTree file browser
map <leader>n :NERDTreeToggle<CR>
" also fuzzy text file search with command-t
" bound to <leader>t by default

" minibufexpl settings
let g:miniBufExplMaxSize = 1

" refactoring with Rope
map <leader>j :RopeGoToDefinition<CR>
map <leader>r :RopeRename<CR>

" Searching with Ack plugin
nmap <Leader>a <Esc>:Ack!
let g:ackprg='ack-grep -H --nocolor nogroup --column'

" Git integration via fugitive
" add %{fugitive#statusline()} to statusline

" Test integration, depending on testing library
" for django-nose:
map <leader>dt : set makeprg python\ manage.py\ test\|:call MakeGreen()<CR>

" py.test
" Execute tests
nmap <silent><leader>tf <Esc>:Pytest file<CR>
nmap <silent><leader>tc <Esc>:Pytest class<CR>
nmap <silent><leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><leader>tn <Esc>:Pytest next<CR>
nmap <silent><leader>tp <Esc>:Pytest previous<CR>
nmap <silent><leader>te <Esc>:Pytest error<CR>

" virtualenv
" add virtualenv site-pacages to vim path so code completion works 
"py << EOF
"import os.path
"import sys
"import vim
"
"if os.environ['VIRTUAL_ENV']:
"	project_base_dir = os.environ['VIRTUAL_ENV']
"	sys.path.insert(0, project_base_dir)
"	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"	execfile(activate_this, dict(__file__=activate_this))
"EOF

"Django tip:
" add 'export DJANGO_SETTINGS_MODULE=project.settings' to env. to get code completion for django modules

" Now customize the details. Most of this is taken from my old vimrc
set number
set autoindent
set autowrite
set backspace=2
" create ~/tmp/ if it doesn't exist and use ~/tmp to save the
" backups into. keeps your directories cleaner
if has("unix")
    if !isdirectory(expand("~/tmp/."))
        !mkdir -p ~/tmp/
    endif
endif
set backup                              " make a backup and save it ~/tmp
set backupdir=~/tmp
set comments=b:#,:%,fb:-,n:>,n:)        " comments default: sr:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,n:>,fb:-
set cpo=aABceFsJWy                      " cpoptions
"set digraph                            " required if you need diacritics or use <C-k>
set display=lastline
set nocompatible                        " notcompatible with vi, gives us lots more functionality
set noerrorbells                        " be quiet
set esckeys                             " allow ESC-sequenzes in 'insert-mode'
set formatoptions=cqrt2                 " Options for text format
set helpheight=20                       " the mindestheight for ':help'
set hidden                              " dont close changed window
set ch=2                                " Disable the 'Press RETURN...' - Messages
set history=500                         " make the history longer
set hlsearch                            " highlighting for the 'hlsearch' option.
set noicon                              " :help noicon
set noignorecase                        " ignore case-sensitive while search also allow no-case-sensitive-search
set incsearch                           " dont highlight searchresults
set iskeyword=@,48-57,_,192-255,-,.,@-@ " enable the search for @, ., _ and -
set nojoinspaces                        " Insert two spaces after a '.', '?' and '!' with a join command.
set laststatus=2                        " show statusline
set lazyredraw                          " no screenupdate during macro
set linebreak                           " wrap at 'breakat' no last char

set magic
set matchpairs=(:),[:],{:},<:>  " Optional
set modeline                    " enable modeline
set modelines=10                " double the default
set pastetoggle=<F12>           " exit paste-mode (<F6>)
set report=0                    " always report changes
set shiftwidth=4                " four spaces are one TAB

" ignore these suffixes while ':edit'
set suffixes=.aux,.bak,.dvi,.gz,.idx,.log,.ps,.swp,.tar,.tgz,.tar,.zip
set shortmess=atIT              " terse msgs + truncate filename + no :intro + truncate messages
set showbreak=+                 " String to put at the start of lines that have been wrapped
set showcmd                     " Show (partial) command in status line
set showmatch                   " briefly jump to matching bracket
set matchtime=3                 " highlight match for .3s
set showmode                    " display current mode
set smartcase                   " overrides 'ignorecase' when searching uppercase chars
set smarttab                    " <Tab> inserts 'shiftwidth' at beginning of line
set spellcapcheck=              " don't check for caps
set splitbelow                  " :split opens window below current viewport
set softtabstop=4               " number of space <Tab> counts for, usually 4 or 8
set tabstop=4                   " sensible default
set expandtab                   " spaces only thank you.
set nostartofline               " controls moving cursor to first blank of the line
set switchbuf=useopen           " behavior when switching between buffers
set textwidth=78                " where to break the line, 0 to disable

"set notitle                    " don't set window title to 'titlestring'
set wildchar=<TAB>              " type to start wildcard expansion in the command-line
set wildignore+=.log,.out,.o    " ignore when doing tab completion
set novisualbell                " visual bell instead of beeping.. or nothing ;)

" tty - Stuff
set ttyfast
set ttybuiltin
set ttyscroll=999
set t_vb=

set wildmenu                            " cmd-line completion operates in an enhanced mode
set wildmode=longest,list
set whichwrap=<,>,h,l                   " keys that move the cursor left/right to wrap
set winheight=5                         " :help winheight
set nowritebackup                       " no backup before overwriting file, thats for weenies ;)
set nowrap                              " changes how text is displayed

"GUI settings
set guifont=Inconsolata\ Medium\ 10
set go=Acgtm

" Fxx Keys {{{
" user defined functions below

map <F2> :call ToggleSpell()<CR>
imap <F2> <C-O>:call ToggleSpell()<CR>

" <F3> saves current buffer
nmap <F3> :w<CR>
imap <F3> <C-O>:w<CR>

" quick toggle highlight search (folke)
noremap <F4>  :if 1 == &hls \| noh \| else \| set hls \| endif \| <CR>

"nmap <F5> :make<CR>
"imap <F5> <C-O>:make<CR>

" TODO setup TagList as pathogen bundle
"let Tlist_Exit_OnlyWindow=1
"let Tlist_Compact_Format=1
"let Tlist_Enable_Fold_Column=0
"nmap <F6> :TlistToggle<CR>
"imap <F6> :TlistToggle<CR>

" Normal <F7> - <F12> are assigned to VimDebug plugin
"}}}

" fast paragraph formatting
nnoremap Q gwap
nnoremap <C-q> gqap
" Remove single trailing whitespace
map ,ws :%s/\s$//<cr>

" TITLESTRING {{{
set title titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~.:h\")})%)%(\ %a%)
" }}}

" STATUSLINE {{{
" See >:h statusline< for more details
set statusline=%<[%n]\ %F\ \ Filetype=\%Y\ \ %r\ %1*%m%*%w%=%(Line:\ %l%)%4(%)Column:\ %5(%c%V/%{strlen(getline(line('.')))}%)\ %4(%)%p%%
"}}}
