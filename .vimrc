" viとのをOFF
set nocompatible
" ファイル形式の検出を無効にする
filetype off

" Vundle を初期化して
" Vundle 自身も Vundle で管理
set rtp+=~/dotfiles/.vim/vundle.git/
call vundle#rc()
Bundle 'gmarik/vundle'

" github にあるプラグイン
Bundle "tpope/vim-fugitive"
Bundle 'tpope/vim-rails'
Bundle "Shougo/neocomplcache"
Bundle "Shougo/unite.vim"
Bundle "thinca/vim-quickrun"
Bundle "Shougo/vimshell"
Bundle "Shougo/vimproc"

" vim-scripts プラグイン
Bundle "rails.vim"
" github にないプラグイン
Bundle "git://git.wincent.com/command-t.git"
" ファイル形式検出、プラグイン、インデントを ON
:set shiftwidth=2
filetype plugin indent on

source $VIMRUNTIME/macros/matchit.vim
filetype plugin on

" 入力モードで開始
" let g:unite_enable_start_insert=1
"mru,reg,buf
noremap :um :<C-u>Unite file_mru -buffer-name=file_mru<CR>
noremap :ur :<C-u>Unite register -buffer-name=register<CR>
noremap :ub :<C-u>Unite buffer -buffer-name=buffer<CR>

"file current_dir
noremap :ufc :<C-u>Unite file -buffer-name=file<CR>
noremap :ufcr :<C-u>Unite file_rec -buffer-name=file_rec<CR>

"file file_current_dir
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
noremap :uffr :<C-u>UniteWithBufferDir file_rec -buffer-name=file_rec<CR>

" c-jはescとする
au FileType unite nnoremap <silent> <buffer> <c-j> <esc><CR>

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

:set ecoding=utf-8
:set fileencoding=utf-8

