"*****************************************************************************
"" README
" This vimrc is generated using http://vim-bootstrap.com/ with c/ruby/lua/go/
" python/html/javascript enabled at 2014-11-27 by minlin.zhang
"
"" INSTALL
" Put this vimrc file and vimrc.local file into `~/.vimrc/`, and execute VIM:
" vim +PlugInstall +qall
"
" Updating all bundles to the latest version, run VIM:
" :PlugUpdate
"
"" NOTICE
" The <leader> key will use default '\' other than ',', for more info, please
" visit it's github:
" https://github.com/avelino/vim-bootstrap
"*****************************************************************************


"*****************************************************************************
"" vim-plug core
"*****************************************************************************
let $BUNDLE = expand("~/.vim/plugged_bundles")
let $PLUG_DIR = expand("$BUNDLE/vim-plug")

if empty(glob(expand("$PLUG_DIR/plug.vim")))
  silent !mkdir -p $PLUG_DIR
  silent !rm -rf $PLUG_DIR/.git*
  silent !git clone https://github.com/junegunn/vim-plug.git $PLUG_DIR
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif
source $PLUG_DIR/plug.vim


let g:plug_timeout = 600
call plug#begin(expand($BUNDLE))

" Make sure you use single quotes
Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
" Plug 'sheerun/vim-polyglot'  " Shame on you!!! Vim was slow even if only adding a new line in python file
Plug 'vim-scripts/CSApprox'
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'qpkorr/vim-bufkill'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --go-completer --java-completer --js-completer'  }

" replace ctrlp+grep+ack with fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'

" Plug 'blindFS/vim-translator'

"" Snippets
" Disabled by zml, due to TAB conflicting with neocomplete
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

"" Color
Plug 'tomasr/molokai'

"" Vim better whitespace
Plug 'ntpeters/vim-better-whitespace'


"" Custom bundles

Plug 'vim-scripts/c.vim', { 'for': ['c', 'cpp'] }


"" Python Bundle
"  should install flake8, autopep8
Plug 'davidhalter/jedi-vim', { 'for': 'python'  }
Plug 'tell-k/vim-autopep8', { 'for': 'python' }
Plug 'Yggdroot/indentLine'
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
" add by zml, for robot framework
Plug 'mfukar/robotframework-vim'

"" Java Bundle

"" Javascript Bundle
Plug 'moll/vim-node', { 'for': 'javascript' }
" Plug 'kchmck/vim-coffee-script'
" Plug 'burnettk/vim-angular'



"" HTML Bundle
Plug 'vim-scripts/HTML-AutoCloseTag'
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'


"" Go Lang Bundle
Plug 'fatih/vim-go', { 'for': ['go', 'golang'] }


"" Ruby Bundle
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
" Plug 'tpope/vim-projectionist'

call plug#end()


" Required:
filetype plugin indent on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set smarttab

"" Map leader to ,
" Comments by zml, using '\' as leader key
"let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Encoding
set bomb
set ttyfast
set binary

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set backspace=indent,eol,start
set showcmd
set shell=/bin/sh

"*****************************************************************************
"" Visual Settigns
"*****************************************************************************
syntax on
set ruler
set number

let no_buffers_menu=1
highlight BadWhitespace ctermbg=red guibg=red
colorscheme molokai

set mousemodel=popup
set t_Co=256
set nocursorline
set guioptions=egmrti
set gfn=Monospace\ 8

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
endif

if &term =~ '256color'
  set t_ut=
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\ %{fugitive#statusline()}

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1


"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>


" vimshell
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '
nnoremap <silent> <leader>sh :VimShellCreate<CR>

" vim-go
let g:go_version_warning = 0

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

if !exists('*TrimWhiteSpace')
  function TrimWhiteSpace()
    let @*=line(".")
    %s/\s*$//e
    ''
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

"" Remember cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"" txt
autocmd BufRead,BufNewFile *.txt call s:setupWrapping()

"" make/cmake
autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake

if has("gui_running")
  autocmd BufWritePre * :call TrimWhiteSpace()
endif

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>


"" Git
noremap <Leader>ga :!git add .<CR>
noremap <Leader>gc :!git commit -m '<C-R>="'"<CR>
noremap <Leader>gsh :!git push<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>
" due to <Tab> remapping, <C-I> would be changed too. So map ,i to <C-I>
" see: https://stackoverflow.com/a/14669883
nnoremap ,i <C-I>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
" enable preview scroll and use Molokai color
let $FZF_DEFAULT_OPTS = '
    \ --bind up:preview-up,down:preview-down
    \'
" use ag to respect .gitignore settings: https://github.com/junegunn/fzf.vim/issues/121
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with preview window that can be hidden with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%', '?'),
  \                 <bang>0)

nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
" Grep the word under cursor. Use `:Ag` directly if you want to input each char
nnoremap <silent> <Leader>a :Ag <C-R><C-W><CR>

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1


" snippets
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" let g:UltiSnipsEditSplit="vertical"


" Ale
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_linters = {
\   'python': ['flake8'],
\}
" E501 which is too long in line. We can ignore it, or increase limit from 80 to 120
" let g:ale_python_flake8_options = '--ignore=E501'
let g:ale_python_flake8_options = '--max-line-length=120'

let g:ale_sign_error = '⚠'
let g:ale_sign_warning = '✗'


" Yggdroot/indentLine
" Note: need conceal feature enabled in VIM. Use brew to install vim on MacOS
let g:indentLine_enabled = 1
let g:indentLine_char = '¦'

"" Remove trailing whitespace on <leader>S
nnoremap <silent> <leader>S :call TrimWhiteSpace()<cr>:let @/=''<CR>

"" Copy/Paste/Cut
noremap YY "+y<CR>
noremap P "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" vim-bufkill without creating mappings like <leader>bx
let g:BufKillCreateMappings = 0
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Open current line on GitHub
noremap ,o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>
"" Custom configs

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
        \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
        \ 'r:constructor', 'f:functions' ],
    \ 'sro' : '.',
    \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
    \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }


" vim-python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=121
    \ formatoptions+=croq softtabstop=4 smartindent
    \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tagbar#enabled = 1


let g:javascript_enable_domhtmlcss = 1


let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab smarttab

" For Jenkins
autocmd Filetype groovy setlocal ts=4 sts=4 sw=4 expandtab smarttab colorcolumn=121
autocmd BufReadPost Jenkinsfile set syntax=groovy
autocmd BufReadPost Jenkinsfile set filetype=groovy

" For robot framework
autocmd Filetype robot ts=4 sts=4 sw=4 expandtab smarttab

" For Java
autocmd Filetype java setlocal ts=4 sts=4 sw=4 expandtab smarttab colorcolumn=121

" For YouCompleteMe
set pumheight=5  " limit the size of the popupmenu for completions so you can see code still
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_semantic_triggers =  {
      \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{3}'],
      \ 'cs,lua,javascript': ['re!\w{3}'],
      \ }

" let lombok work with Java:
" https://github.com/eclipse/eclipse.jdt.ls/issues/365#issuecomment-370067887
let $VIM_JAVA_JARS = expand("~/.vim/java_jars")
let $LOMBOK_JAR = expand("$VIM_JAVA_JARS/lombok.jar")
if empty(glob(expand("$LOMBOK_JAR")))
  silent !mkdir -p $VIM_JAVA_JARS
  silent !wget https://projectlombok.org/downloads/lombok.jar -O $LOMBOK_JAR
endif
let $JAVA_TOOL_OPTIONS = expand("-javaagent:$LOMBOK_JAR -Xbootclasspath/a:$LOMBOK_JAR")

" Use same mappings like jedi-vim
nnoremap <silent> <Leader>d :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>g :YcmCompleter GoToDeclaration<CR>
nnoremap <silent> <Leader>n :YcmCompleter GoToReferences<CR>
nnoremap <silent> <Leader>r :YcmCompleter RefactorRename<CR>
nnoremap <silent> K :YcmCompleter GetDoc<CR>

" Use <CR> as select the candidate rather than insert a new line
" https://github.com/Valloric/YouCompleteMe/issues/1282#issuecomment-228254509
inoremap <expr> <CR> pumvisible() ? "\<C-Y>\<ESC>a" : "\<CR>"


"" jedi-vim, only use `show_call_signatures` feature
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0


"" accelerated-smooth-scroll
let g:ac_smooth_scroll_fb_sleep_time_msec = 2
let g:ac_smooth_scroll_du_sleep_time_msec = 2
let g:ac_smooth_scroll_min_limit_msec = 80

"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
