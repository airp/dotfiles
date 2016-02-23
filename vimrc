set nocompatible
filetype plugin on

syntax enable           " 开启语法高亮功能
syntax on               " 允许用指定语法高亮配色方案替换默认方案

if has("gui_running")
    set background=dark
    colorscheme solarized
else
    "set background=dark
    "let g:solarized_termcolors=256
    "colorscheme solarized
    set t_Co=256
endif

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

"set autochdir
"set suffixesadd+=.h

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

"nnoremap <F4> :!find . -name "*.h" -o -name "*.c" -o -name "*.cpp" > src.files | ctags -R --c++-kinds=+px --fields=+iaS --extra=+q -L src.files<CR><CR>

" 在原有基础之上增加暂时关闭查找高亮的功能
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" &本身会忽略标志位, 重定义普通模式下的&含义
nnoremap & :&&<CR>

" 为可视模式创建一个类似的命令
xnoremap & :&&<CR>

"set incsearch
"set spell
"cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'


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
"highlight Pmenu    guibg=darkgrey  guifg=black
"highlight PmenuSel guibg=lightgrey guifg=black


"let g:ycm_complete_in_comments=1                            " 补全功能在注释中同样有效
"let g:ycm_confirm_extra_conf=0                              " 允许vim加载.ycm_extra_conf.py文件,不再提示
"let g:ycm_collect_identifiers_from_tags_files=1             " 开启 YCM 标签补全引擎
""set tags+=~/ctags/tags/cpp                                  " 引入 C++ 标准库tags
"set completeopt-=preview                                    " 补全内容不以分割子窗口形式出现，只显示补全列表
"let g:ycm_min_num_of_chars_for_completion=1                 " 从第一个键入字符就开始罗列匹配项
"let g:ycm_cache_omnifunc=0                                  " 禁止缓存匹配项，每次都重新生成匹配项
"let g:ycm_seed_identifiers_with_syntax=1                    " 语法关键字补全
"
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <F4> :YcmDiags<CR>

nnoremap <Leader>fl :NERDTreeToggle<CR>
let NERDTreeWinSize=32
"let NERDTreeShowHidden=1                    " 显示隐藏文件
let NERDTreeMinimalUI=1                     " NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeAutoDeleteBuffer=1              " 删除文件时自动删除文件对应 buffer

nnoremap <leader>tl :TagbarToggle<CR>
let g:tagbar_width=32
let g:tagbar_compact=1
"autocmd BufReadPost *.h,*.c,*.cpp,*.hpp,*.cc,*.cxx call tagbar#autoopen()


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

"Bundle 'Valloric/YouCompleteMe'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'ianva/vim-youdao-translater'
"Bundle 'TimothyYe/vim-tips'                    " Need ruby enviroument
"Bundle 'uguu-org/vim-matrix-screensaver'

filetype plugin indent on     " required!
" Vundle End

