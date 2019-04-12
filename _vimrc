source $VIMRUNTIME/vimrc_example.vim
""source $VIMRUNTIME/mswin.vim
set number
behave mswin
if has("gui_running")
  "au GUIEnter * simalt ~x " 窗口启动时自动最大化
  set lines=40 columns=80
  set guioptions-=m " 隐藏菜单栏
  set guioptions-=T " 隐藏工具栏
  set guioptions-=L " 隐藏左侧滚动条
  set guioptions-=r " 隐藏右侧滚动条
  set guioptions-=b " 隐藏底部滚动条
  set showtabline=0 " 隐藏Tab栏
endif
set diffexpr=MyDiff()
""set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
""colorscheme peachpuff

colorscheme solarized
set background=dark
function MyDiff()
let opt = '-a --binary '
if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
let arg1 = v:fname_in
if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
let arg2 = v:fname_new
if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
let arg3 = v:fname_out
if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
if $VIMRUNTIME =~ ' '
if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

syntax on
""filetype on
set autoindent
set smartindent
set showmatch
set guifont=Courier\ New:h10
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap < <><ESC>i
nnoremap * :keepjumps normal! mi*`i<CR> 

"easymotion map
map <Leader> <Plug>(easymotion-prefix)

set cursorcolumn
""set cursorline
set shiftwidth=2
set tabstop=2
set expandtab
set encoding=utf-8
map <Space> <c-D>
map <A-Space> <c-U>

"save sessions before leave
function SaveSess()
  execute 'silent! SSave!'
endfunction

autocmd VimLeave * call SaveSess()

""set nowrap



""vundle settings
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim

"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/vimfiles/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""Plugin 'klen/python-mode'

" bookmark
Plugin 'MattesGroeger/vim-bookmarks'

Plugin 'tomtom/tcomment_vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'easymotion/vim-easymotion'

Plugin 'a.vim'

Plugin 'majutsushi/tagbar'
Plugin 'mhinz/vim-startify'
"Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'

Plugin 'honza/vim-snippets'
""Plugin 'junegunn/goyo.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
""Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'gtags.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'ervandew/supertab'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
Plugin 'lervag/vimtex'
Plugin 'elzr/vim-json'
Plugin 'plasticboy/vim-markdown'

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


"for debug
""let g:ycm_keep_logfiles = 1
""let g:ycm_log_level = 'debug'


""autocmd vimenter * NERDTree
""autocmd StdinReadPre * let s:std_in=1
""autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
""autocmd StdinReadPre * let s:std_in=1
""autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <A-n> :NERDTreeToggle<CR>
""let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 0
let NERDTreeIgnore = ['\.o$','\.pyc$','\.png','\.jpg','\~']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""let g:NERDTreeDirArrowExpandable = '>'
""let g:NERDTreeDirArrowCollapsible = '^'

"set my own gtags map
""let Gtags_Auto_Map = 1
""nmap <F2> :copen<CR>
""nmap <F4> :cclose<CR>
""nmap <F5> :Gtags<SPACE>
""nmap <F6> :Gtags -f %<CR>
""nmap <F7> :GtagsCursor<CR>
""nmap <F8> :Gozilla<CR>
""nmap <C-n> :cn<CR>
""nmap <C-p> :cp<CR>
""nmap <C-\><C-]> :GtagsCursor<CR>

map <A-g> :GtagsCursor<CR>

"cpp-enchanced-lightlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
"slow template highlight
let g:cpp_experimental_simple_template_highlight = 1
"fast template highlight
"let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1


"unbind bookmark keys whenever Nerdtree becoms active
let g:bookmark_no_default_key_mappings = 1
"Save/show bookmarks per working directory/project(default 0)
let g:bookmark_save_per_working_dir = 1
"Turn on line highlighting(default 0)
let g:bookmark_highlight_lines = 1
let BookmarkLine = 1
let BookMarkAnnotationLine = 1
function! BookmarkMapKeys()
    nmap mm :BookmarkToggle<CR>
    nmap mi :BookmarkAnnotate<CR>
    nmap mn :BookmarkNext<CR>
    nmap mp :BookmarkPrev<CR>
    nmap ma :BookmarkShowAll<CR>
    nmap mc :BookmarkClear<CR>
    nmap mx :BookmarkClearAll<CR>
    nmap mkk :BookmarkMoveUp
    nmap mjj :BookmarkMoveDown
endfunction
function! BookmarkUnmapKeys()
    unmap mm
    unmap mi
    unmap mn
    unmap mp
    unmap ma
    unmap mc
    unmap mx
    unmap mkk
    unmap mjj
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()

noremap <Leader>y "*y
noremap <Leader>p "*p
map <F12> :silent !gtags -i<CR>
map <F11> :silent !ctags -R<CR>

map <A-t> :TagbarToggle<CR>
map <A-j> <C-w>j
map <A-l> <C-w>l
map <A-h> <C-w>h
map <A-k> <C-w>k

"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<leader><tab>"
"let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
"let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

""set rubydll="C:\Ruby24\bin\x64-msvcrt-ruby240.dll"


"use most recently used search to replace default one
nmap <silent> <leader>z <Plug>(CommandTBuffer)
nnoremap <silent> <leader>v :CommandTMRU<CR>

set wildignore+=*.o,*.obj,*png,*jpg,*~,*suo,*swp
"auto resize splits equally when vim's window resized
autocmd VimResized * wincmd =


let g:startify_session_dir = '~/vimfiles/session'
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
"not working
""let g:startify_seeeion_persistence = 1

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ ]


""syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"prevent :mksession from saving syntastic-error-window as empty quickfix
"windows
"set sessionoptions-=blank
"let g:syntastic_cpp_cppcheck_args = "--language=c++"

"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_cpp_cpplint_exec = "cpplint"
"let g:syntastic_cpp_checkers = ['cppcheck']
"let g:ycm_show_diagnostics_ui = 0

"let g:ycm_semantic_completion_toggle = '<c-f>'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

