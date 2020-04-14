set nocompatible              " 去除VI一致性,必须要添加
filetype off                  " 必须要添加

call plug#begin('~/.vim/plugged')

" 用法 默认对其选中 :Easyalign*\
Plug 'junegunn/vim-easy-align'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本

" fzf普通模式下快捷键查找文件
:map \f :Files<CR>
:map \b :Buffers<CR>
