source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
set number
behave mswin
if has("gui_running")
"au GUIEnter * simalt ~x " ´°¿ÚÆô¶¯Ê±×Ô¶¯×î´ó»¯
set guioptions-=m " Òþ²Ø²Ëµ¥À¸
set guioptions-=T " Òþ²Ø¹¤¾ßÀ¸
set guioptions-=L " Òþ²Ø×ó²à¹ö¶¯Ìõ
set guioptions-=r " Òþ²ØÓÒ²à¹ö¶¯Ìõ
set guioptions-=b " Òþ²Øµ×²¿¹ö¶¯Ìõ
set showtabline=0 " Òþ²ØTabÀ¸
endif
set diffexpr=MyDiff()
""set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
""colorscheme peachpuff

colorscheme solarized
set background=light
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

"×¢ÊÍºê
nnoremap <F2> i/<ESC>70a*<ESC>o
               \*<CR>
               \<ESC>69a*<ESC>o
               \*return:<CR>
               \*param:<CR>
               \<ESC>71a*<ESC>a/
               \<ESC>4ka
set cursorcolumn
""set cursorline
set ts=4
set expandtab
set encoding=utf-8

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

" bookmark
Plugin 'MattesGroeger/vim-bookmarks'

Plugin 'tomtom/tcomment_vim'
Plugin 'dhruvasagar/vim-table-mode'

Plugin 'a.vim'

Plugin 'majutsushi/tagbar'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
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
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
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


"for debug
""let g:ycm_keep_logfiles = 1
""let g:ycm_log_level = 'debug'


""autocmd vimenter * NERDTree
""autocmd StdinReadPre * let s:std_in=1
""autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
""autocmd StdinReadPre * let s:std_in=1
""autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-m> :NERDTreeToggle<CR>
""let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 0
let NERDTreeIgnore = ['\.o$','\.pyc$','\.png','\.jpg']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""let g:NERDTreeDirArrowExpandable = '>'
""let g:NERDTreeDirArrowCollapsible = '^'

let Gtags_Auto_Map = 1

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

"put current time
map <F10> "=strftime("%c")<CR>P

