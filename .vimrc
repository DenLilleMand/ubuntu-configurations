"author info -----------------------------{{{
"Author:DenLilleMand
"Creation Date: 1st of january,  2015
"Description: Alot of the most popular plugins, mainly javascript focused.
"License: MIT
"}}}
" settings before#vundle -------------------- {{{

"if this wasn't on, we would run in vi-compatible mode.
set nocompatible

"these two are being turned on when we're behind the
"vundle installation. aparently it should be a good thing
"to have set before running vundle, im not entirely sure
"about the essential reason for it.
filetype off
filetype indent off
filetype plugin indent off

set rtp+=~/.vim/bundle/vundle

"}}}
" Vundle ---------------- {{{
call vundle#begin()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugins:functional
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"required, vundle is the plugin manager.
"Plugin 'gmarik/Vundle.vim'

"Latex plugin for university
Plugin 'lervag/vimtex'

"Solarized theme, the most popular vim theme.
Plugin 'altercation/vim-colors-solarized'

"nerdcommenter
Plugin 'scrooloose/nerdcommenter'

"gives us this nice interface, the contender for 2nd place is something called powerline",
"which is waay more heavy weight, and requires you to install system fonts to work properly.
"this is the newer and slimmer version, and we even set the theme to powerline, so we get their l&f.
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"Automatically closes HTML tag once you finish typing it with >. It is also smart enough to not autoclose tags when in a comment,
"when they are self-closing, or when they have already been closed.
Plugin 'amirh/HTML-AutoCloseTag'

"Allows us to explore the file tree, open files and directories,
"bookmarks,toggle hidden files, it remembers cursor position within files - so
"we can close and reopen and just continue. link to best docs:    http://usevim.com/2012/07/18/nerdtree/
Plugin 'scrooloose/nerdtree'

"Nerdtree and tabs painlessly in vim. Will make sure that
"its only 1 nerdtree being open all the time, it can be closed in all
"tabs/open in all tabs, can be toggled with :NERDTreeTabsToggle
"When we close a file, nerdtree will close with it, so no more hanging.
""https://github.com/jistr/vim-nerdtree-tabs
Plugin  'jistr/vim-nerdtree-tabs'


" end the vundle run.
call vundle#end()

"}}}
"settings after#vundle ---------------- {{{
set rtp+=$GOROOT/misc/vim
filetype on
filetype indent on
filetype plugin indent on
" }}}
" Basic Settings -------------------------------- {{{
"If this was set to off, the plugins wouldnt be able to do indenting based on
"file type, which is a pretty  big deal i guess? im not sure if some of the
"plugins wouldve overriden this setting anyway?
"filetype indent on

" required, not entirely sure what this does compared to the one above, maybe
" the same just plugin specific.
" filetype plugin indent on

filetype plugin on

"Sets it on.
set autoindent

"sets the width of the indentation.
set shiftwidth=4

"Does the right thing (mostly) in programs. When its on it makes it so that
"tabs are calculated from shiftwidth from the beginning of the line, so if
"we're at like 1 it would indent 3.
set smartindent

"setting the syntax on.
syntax on
syntax enable

" Turn on line numbering. Turn it off with 'set nonu'
set nu

"Case insensitive search
set ic

" Higlhight search
"set hls

" Wrap text instead of being on one line
set lbr
"}}}
" Filetype specific settings --------------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
"The following is really strange rofl, why would
"the file type be javascript written like that?
"i thouth it only looked at the postfix, like js,
"so what happens if we do jsx, or xlsx etc. some of the new
"file types? then i guess vim will use the postfix if it doesn't
"exist in their dictionary
augroup filetype_fs_and_fsx
    autocmd!
    autocmd FileType fsharp set tabstop=2|set shiftwidth=2|set expandtab
augroup END
augroup filetype_js
  autocmd!
  autocmd FileType javascript :inoreabbrev <buffer> _author
    \/**
    \<cr>Author: Matti Andreas Nielsen
    \<cr>License: MIT
    \<cr>Date:
    \<cr>Description:
    \<cr>*/
    autocmd FileType javascript :inoreabbrev <buffer> _react
    \import react,{Components,PropTypes} from 'react';
    \<cr>
    \<cr>
    \<cr>export default class Herpderp extends Component {
    \<cr>constructor(context, props) {
    \<cr>super(context,props);
    \<cr>this.state = {}
    \<cr>}
    \<cr>
    \<cr>
    \<cr>
    \<cr>render() {
    \<cr>return() {
    \<cr>}
    \<cr>}
    \<cr>}
augroup END
" }}}
"Abreviations ---------------------------- {{{
" }}}
" Non-Plugin mappings -------------------- {{{
"This maps jk to escape, that makes it hard to write jk, but its better than 'typeing escape each time to leave insert mode, anyway, i feel like ESC is "better suited for saveing+quitting a file, while shift-ESC could be :q!
inoremap jk <ESC>

noremap <C-1> :bfirst
noremap <C-2> :blast

" Close a buffer, it will give a warning if changes has been made to this
" buffer.
nnoremap <leader>bd :bd<CR>

nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k
"is suppose to change buffers with tab and shift-tab. would still be nice
"changeing buffers with a number though. Ctrl+p does it with names so thats
"hardly nessecery.
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

"delete trailing white space:
nnoremap <leader>dws :%s/\s\+$//e<cr>

nnoremap <leader>pb :execute "vsplit " . bufname("#")<cr>
let mapleader="\\"


nnoremap <leader>s :/\v

nnoremap <C-s> :w <cr>

" Open up current file in chrome
nnoremap <silent> <leader>ch :exec 'silent !open -a "Chrome" % &'

"Map <c-u> to back-visual-select eol-caps all, to avoid shift
inoremap <c-u> <esc>0v$U
nnoremap <c-u> 0v$U

"Turn off search highlight
nnoremap <leader>hl :noh<cr>

"where ever we are, this mapping will allways
"point to our .vimrc file and open it in a split window.
" the $MYVIMRC is a variable that allways points to our .vimrc file.
nnoremap <leader>ev :vsplit $MYVIMRC <cr>

"whenever we make a mapping, we have to quit vim, and enter again,
"to make that easier we're going to map our :source and give it the .vimrc
"variable as parameter, so each time we do it, we compile our .vimrc.
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}
"Nerdtree settings and mappings ------------------- {{{
"NERDTtree= Tabs configuration.
"NERDTreeTabs on console vim startup
"mapping ctrl n to boot NERDtree
noremap <C-n> :NERDTreeToggle<CR>

"Makes sure that NERDTree closes down aswell, whenever we do wq on the last
"open buffer.
augroup somegroup
  autocmd!
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
augroup END

let g:nerdtree_tabs_open_on_console_startup=1


"Open NERDTree on gvim/macvim startup.
let g:nerdtree_tabs_open_on_gui_startup=1


"Close current tab if there is only one window in it and it's NERDTree
let g:nerdtree_tabs_autoclose=1

"Do not open NERDTree if vim starts in diff mode
let g:nerdtree_tabs_no_startup_for_diff=1

"On Startup, focus NERDTree if opening a directory, focus file if opening a
"file. When set to 2, always focus file window after startup.
let g:nerdtree_tabs_smart_startup_focus=1

"Synchronize view of all NERDTree windows (scroll and cursor position)
let g:nerdtree_tabs_synchronize_view=1

"Synchronize focus when switching windows (focus NERDTree after tab switch if and only if it was focused before tab switch)
let g:nerdtree_tabs_synchronize_focus=1

"Open NERDTree on new tab creation (if NERDTree was globally opened by :NERDTreeTabsToggle)
let g:nerdtree_tabs_open_on_new_tab=1

"Unfocus NERDTree when leaving a tab for descriptive tab names
let g:nerdtree_tabs_meaningful_tab_names=1

"When switching into a tab, make sure that focus is on the file window, not in the NERDTree window. (Note that this can get
"annoying if you use NERDTree's feature 'open in new tab silently', as you will lose focus on the NERDTree.)
let g:nerdtree_tabs_focus_on_files=0

"When given a directory name as a command line parameter when launching Vim, :cd into it.
let g:nerdtree_tabs_startup_cd=1

"Automatically find and select currently opened file in NERDTree.
let g:nerdtree_tabs_autofind=0

"This is suppose to make sure that each time we change the CWD with nerdtree,
"it makes it so that ctrlP only looks for files in that subDirectory with
"fuzzy search. what we should be interested in, would be to figuire out how to
"exclude surden files. like a gitIgnore, forexample if we have a huge library
"in our subdir, like most project folders has, like Node, or something like
"that, usually fuzzy search will find everything, especially with regex. which
"is obviously a problem
let g:NERDTreeChDirMode       = 2


" }}}
" Airline settings and mappings ----------------------- {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
"}}}
"Solarized settings -------------------- {{{
set background=light
colorscheme solarized
"}}}
" Vim-latex ------------------- {{{
"In some cases it will detect a file with the 'tex' suffix as plaintex, to
"prevent this we set the following setting:
let g:vimtex_enable = 1
let g:tex_flavor='latex'
"}}}
" FSharp settings ---------------- {{{
filetype plugin indent on
"}}}
"neo-vim specific ------------- {{{
if has('nvim')
"deoplete(for auto-completion in nvim ------------ {{{
let g:deoplete#enable_at_startup=1
"}}}
"Vim-plug -------------------- {{{
call plug#begin('$HOME/.config/nvim/plugged')
    Plug 'Shougo/deoplete.nvim'
    Plug 'fatih/vim-go'
    Plug 'nsf/gocode', { 'rtp': 'nvim', 'do':'~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
    Plug 'airblade/vim-gitgutter'
    Plug 'zchee/deoplete-go', {'do': 'make'}
    Plug 'pangloss/vim-javascript'
    Plug 'ryym/vim-riot'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'w0rp/ale'
    Plug 'amix/open_file_under_cursor.vim'
    Plug 'vim-scripts/nginx.vim'
    Plug 'maxbrunsfeld/vim-yankstack'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'easymotion/vim-easymotion'
    
    "Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    "Plug 'flowtype/vim-flow', { 'do': 'npm install -g flow-bin'}

    "Had some performance issues i think;
    "Plug 'vim-scripts/bufexplorer.zip' 
    "Good idea for a plugin, but doesn't work 100%:
    "Plug 'terryma/vim-multiple-cursors'
call plug#end()
" }}}
"some neovim mappings for yanking and pasting ------------ {{{
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P


"}}}
"Other plugin configurations-------------------{{{
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_next_key='<leader>m'
"let g:multi_cursor_prev_key='<leader>p'
"let g:multi_cursor_skip_key='<leader>x'
"let g:multi_cursor_quit_key='<leader>e'
"}}}
"vim-go ---------------- {{{
"configuration:
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_structs = 1

let g:go_auto_sameids = 1

let g:go_fmt_command = "goimports"

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

"Help mappings:
"Go mappings(maybe i should move them into filetype specific, but then again
"i sometimes open nvim in a go repository with no files open and want to run
"GoInstall):
nnoremap <silent> <leader>d :GoDef<cr>
nnoremap <leader>gb :GoBuild<cr>
nnoremap <leader>r :GoRun<cr>
nnoremap <leader>i :GoInstall<cr>
nnoremap <leader>l :GoLint<cr>
nnoremap <leader>gr :GoReferrers<cr>
nnoremap <leader>gc :GoCallees<cr>
nnoremap <leader>gi :GoImplements<cr>
nnoremap <leader>gd :GoDecls<cr>
nnoremap <leader>gdd :GoDeclsDir<cr>
nnoremap <leader>o :GoDefPop<cr>
"}}}
endif

syntax on
au BufRead /tmp/psql.edit.* set syntax=sql
