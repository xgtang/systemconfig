"brew install fzf
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

set nocompatible              " 去除VI一致性,必须要添加
filetype off                  " 必须要添加

call plug#begin('~/.vim/plugged')

" 用法 默认对其选中 :Easyalign*\
Plug 'junegunn/vim-easy-align'
"文件查找
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plug 'vim-airline/vim-airline'

"有道词典在线翻译
Plug 'ianva/vim-youdao-translater'

"go 主要插件
 Plug 'fatih/vim-go', { 'tag': '*' }
"go 中的代码追踪，输入 gd 就可以自动跳转
 Plug 'dgryski/vim-godef'

" markdown 插件
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" Initialize plugin system
call plug#end()

filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本

" fzf普通模式下快捷键查找文件
:map \f :Files<CR>
:map \b :Buffers<CR>
:map \e :Explore<CR>

" 设置行号
set nu

" 尾部空格高亮
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set directory=~/.vim/temp/swp/
set backupdir=~/.vim/temp/backup/

"tab为空格
set tabstop=3
set softtabstop=3
set shiftwidth=3
set expandtab

