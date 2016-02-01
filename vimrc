set nocompatible
filetype plugin on

syntax enable           " 开启语法高亮功能
syntax on               " 允许用指定语法高亮配色方案替换默认方案

"set background=dark
if has("gui_running")
    colorscheme solarized
else
endif

set t_Co=256

set history=500
set number
set ruler
set hlsearch
set ignorecase
set smartcase
set smartindent

set ts=4
set sw=4
set sts=4
set expandtab

nnoremap <silent> <C-T> <Esc>:Ydc<CR> 
vnoremap <silent> <C-T> <Esc>:Ydv<CR> 
noremap <leader>yd :Yde<CR>

set autochdir
set suffixesadd+=.h

set pastetoggle=<f5>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" 暂时屏蔽左右移动, 练习单词间跳转以及f, t命令
noremap l <Nop>
noremap h <Nop>

nnoremap <F4> :!ctags -R --c++-kinds=+px --fields=+iaS --extra=+q .<CR><CR>

" 在原有基础之上增加暂时关闭查找高亮的功能
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" &本身会忽略标志位, 重定义普通模式下的&含义
nnoremap & :&&<CR>

" 为可视模式创建一个类似的命令
xnoremap & :&&<CR>

"set incsearch
"set spell
"cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_Right_Window=1
"let Tlist_Auto_Open=0


" 可视模式下*/#, 根据选中内容查询
xnoremap * :<C-u>call <SID>VSetSearch() <CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch() <CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction


" 总是显示状态栏
set laststatus=2
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

" 打开tabline功能,方便查看Buffer和切换
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1

" 设置切换Buffer快捷键"
"nnoremap <C-n> :bn<CR>
"nnoremap <C-p> :bp<CR>


" ctags 索引文件
set tags+=tags;,~/ctags/tags/cpp
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1 
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" 自动关闭补全窗口 
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

" 补全窗口配色
highlight Pmenu    guibg=darkgrey  guifg=black
highlight PmenuSel guibg=lightgrey guifg=black


" Vundle Start
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle    " required!
Bundle 'gmarik/vundle'

Bundle 'a.vim'
Bundle 'vimcdoc'
Bundle 'STL-improved'
Bundle 'OmniCppComplete'
Bundle 'The-NERD-Commenter'
"Bundle 'DfrankUtil'             " indexer 依赖项
"Bundle 'vimprj'                 " indexer 依赖项
"Bundle 'indexer'
"Bundle 'nathanaelkane/vim-indent-guides'

Bundle 'Valloric/YouCompleteMe'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'bling/vim-airline'
Bundle 'ianva/vim-youdao-translater'
Bundle 'majutsushi/tagbar'
"Bundle 'maksimr/vim-translator'
"Bundle 'kshenoy/vim-signature'

filetype plugin indent on     " required!
" Vundle End

