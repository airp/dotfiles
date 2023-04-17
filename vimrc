set nocompatible
"filetype plugin on

"syntax enable           " 开启语法高亮功能
syntax on               " 允许用指定语法高亮配色方案替换默认方案

if has("gui_running")
    set background=dark
    colorscheme solarized
else
    " 使vim在tmux中显示的颜色与在外部显示的一致
    " 如果仍然有问题, 强制tmux使用256色, 使用tmux -2启动
    set background=dark
    set t_Co=256
endif

set history=500
set number
set rnu
set ruler
set hlsearch
set ignorecase
set smartcase
set smartindent

set ts=4
set sw=4
set sts=4
set expandtab

" 当前项目环境编码异常, 需要添加以下3项
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set encoding=utf8

let mapleader=" "

" 有道翻译
vnoremap <silent> <C-T> :<C-u>Ydv<CR>
nnoremap <silent> <C-T> :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>

"set autochdir
"set suffixesadd+=.h

set pastetoggle=<f5>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" 暂时屏蔽左右移动, 练习单词间跳转以及f, t命令
"noremap l <Nop>
"noremap h <Nop>
"noremap j <Nop>
"noremap k <Nop>


map <leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <leader>l <Plug>(easymotion-lineforward)
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)
map <Leader>s <Plug>(easymotion-s)

" nnoremap <F4> :!find . -name "*.h" -o -name "*.c" -o -name "*.cpp" > src.files | ctags -R --c++-kinds=+px --fields=+iaS --extra=+q -L src.files<CR><CR>

" 在<C-l>原有基础上增加临时关闭查找高亮的功能
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

" ycm相关配置
let g:ycm_complete_in_comments=1                            " 补全功能在注释中同样有效
let g:ycm_confirm_extra_conf=0                              " 允许vim加载.ycm_extra_conf.py文件,不再提示
let g:ycm_collect_identifiers_from_tags_files=1             " 开启 YCM 标签补全引擎
"set tags+=~/ctags/tags/cpp                                  " 引入 C++ 标准库tags
set completeopt-=preview                                    " 补全内容不以分割子窗口形式出现，只显示补全列表
let g:ycm_min_num_of_chars_for_completion=1                 " 从第一个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                                  " 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1                    " 语法关键字补全
let g:ycm_show_diagnostics_ui=1                             " YCM 显示诊断信息的功能
"let g:ycm_max_diagnostics_to_display=0
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

nnoremap <leader>i :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>u :YcmCompleter GoToDeclaration<CR>
nnoremap <F4> :YcmDiags<CR>

nnoremap <leader>fl :NERDTreeToggle<CR>
let NERDTreeWinSize=32
"let NERDTreeShowHidden=1                    " 显示隐藏文件
let NERDTreeMinimalUI=1                     " NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeAutoDeleteBuffer=1              " 删除文件时自动删除文件对应 buffer

nnoremap <F8> :TagbarToggle<CR>
let g:tagbar_width=32
let g:tagbar_compact=1
"autocmd BufReadPost *.h,*.c,*.cpp,*.hpp,*.cc,*.cxx call tagbar#autoopen()

" fzf快捷键配置
nmap <C-p> :Files<CR>
nmap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }

" 在vim中, 重新设定fzf的文件搜索规则与预览样式
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
let $FZF_DEFAULT_OPTS = '--layout=reverse'

" Files命令搜索结果带有预览窗口
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" 自定义fzf全文搜索, ripgrep配置
let g:rg_command = '
  \ rg --column --line-number --no-heading --ignore --no-fixed-strings --smart-case --hidden --follow --color "always"
  \ -g "!.{log,log.*}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

" indentline 开启了vim的conceal功能. 例如,会自动隐藏json的双引号. 视影响程度决定是否要关闭该功能
" indentline 层级样式
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" UltiSnips 配置
let g:UltiSnipsExpandTrigger='<CR>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
let g:UltiSnipsEditSplit="vertical"
" 指定UltiSnips的搜索路径
let g:UltiSnipsSnippetDirectories=[$HOME.'/.UltiSnips', 'UltiSnips']

" Vundle Start
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle    " required!
Bundle 'gmarik/vundle'

Bundle 'a.vim'
Bundle 'vimcdoc'
Bundle 'STL-improved'
Bundle 'Valloric/YouCompleteMe'
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'flazz/vim-colorschemes'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'ianva/vim-youdao-translater'
Bundle 'christoomey/vim-system-copy'
Bundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Bundle 'junegunn/fzf.vim'
Bundle 'easymotion/vim-easymotion'
Bundle 'sirver/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'yggdroot/indentline'
"Bundle 'airblade/vim-gitgutter'
"Bundle 'christoomey/vim-tmux-navigator'
"Bundle 'TimothyYe/vim-tips'                    " Need ruby enviroument
"Bundle 'uguu-org/vim-matrix-screensaver'

filetype plugin indent on     " required!
" Vundle End

