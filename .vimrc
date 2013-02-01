" viとのをOFF
set nocompatible
" ファイル形式の検出を無効にする
filetype off

syntax on "シンタックスハイライトを有効にする
set nobackup "バックアップファイルを作らない設定にする
set encoding=utf-8 "デフォルトの文字コード
set fileencoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,utf-8,ucs-2,cp932,sjis "自動判別に使用する文字コード 
set autoindent "オートインデントする
" タブ幅の設定
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set number "行番号を表示する
set incsearch "インクリメンタルサーチ
set ignorecase "検索時に大文字小文字を無視する
set showmatch "対応する括弧のハイライト表示する
set showmode "モード表示する
set title "編集中のファイル名を表示する
set ruler "ルーラーの表示する
" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

"行末の空白文字を可視化
highlight WhitespaceEOL cterm=underline ctermbg=red guibg=#FF0000
au BufWinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')
au WinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')

"行頭のTAB文字を可視化
highlight TabString ctermbg=red guibg=red
au BufWinEnter * let w:m2 = matchadd("TabString", '^\t+')
au WinEnter * let w:m2 = matchadd("TabString", '^\t+')

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
"特殊文字(SpecialKey)の見える化。listcharsはlcsでも設定可能。
""trailは行末スペース。
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<

" ヤンクした値を連続でペーストする設定
vnoremap <silent> <C-p> "0p<CR>

" Vundle を初期化して
" Vundle 自身も Vundle で管理
set rtp+=~/dotfiles/.vim/vundle.git/
call vundle#rc()

Bundle 'Source-Explorer-srcexpl.vim'
Bundle 'taglist.vim'
Bundle 'trinity.vim'

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-endwise.git'
Bundle 'vim-scripts/dbext.vim'
Bundle 'open-browser.vim'
Bundle 'mattn/webapi-vim'
" indentの深さに色を付ける
Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'tell-k/vim-browsereload-mac' "vimからブラウザをリロードする

Bundle "Shougo/neocomplcache"
Bundle "Shougo/neosnippet"
Bundle "Shougo/unite.vim"
Bundle 'thinca/vim-quickrun'

Bundle "Shougo/vimproc"
Bundle "Shougo/vimshell"

Bundle "taichouchou2/vim-rsense"
Bundle "opsplorer"
Bundle "scrooloose/nerdtree"
Bundle "reinh/vim-makegreen"

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'ruby-matchit'
Bundle 'tpope/vim-cucumber'

" コメント
Bundle 'tomtom/tcomment_vim'
Bundle 'taichouchou2/surround.vim'

" railsサポート
Bundle 'tpope/vim-rails'
Bundle "rails.vim"
Bundle 'ujihisa/unite-rake'
Bundle 'basyura/unite-rails'
Bundle 'vim-scripts/project.vim'

" js
Bundle 'JavaScript-syntax'
Bundle 'itspriddle/vim-javascript-indent'
" Bundle 'taichouchou2/vim-javascript' " jQuery syntax追加
Bundle 'kchmck/vim-coffee-script'


" CSS
Bundle 'mattn/zencoding-vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'taichouchou2/html5.vim'

" Less
Bundle 'groenewege/vim-less'

"scss
Bundle 'cakebaker/scss-syntax.vim'

" git
Bundle "git://git.wincent.com/command-t.git"
Bundle "tpope/vim-fugitive"

" reference環境
Bundle 'thinca/vim-ref'
Bundle 'taichouchou2/vim-ref-ri'
Bundle 'taq/vim-rspec'

" カラースキーマ
Bundle 'ujihisa/unite-colorscheme'
Bundle 'nanotech/jellybeans.vim'
Bundle 'tomasr/molokai'
colorscheme desert

" ファイル形式検出、プラグイン、インデントを ON
:set shiftwidth=2
filetype plugin indent on

source $VIMRUNTIME/macros/matchit.vim
filetype plugin on

"rsenseの設定
let g:rsenseUseOmniFunc = 1
let g:rsenseHome = expand('~/.vim/ref/rsense-0.3')

"vimshellの設定
if has('mac')
  let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/vimproc_mac.so'
elseif has('win32')
  let g:vimproc_dll_path = $HOME . '.vim/bundle/vimproc/autoload/vimproc_win32.dll'
elseif has('win64')
  let g:vimproc_dll_path = $HOME . '.vim/bundle/vimproc/autoload/vimproc_win64.dll'
elseif has('win64')
  let g:vimproc_dll_path = $HOME . '.vim/bundle/vimproc/autoload/vimproc_win64.dll'
endif

"RSpec対応
let g:quickrun_config = {}
let g:quickrun_config['ruby.rspec'] = {'command': "rspec"}
"let g:quickrun_config['ruby.rspec'] = { 'command': 'rspec', 'cmdopt': 'bundle exec', 'exec': '%o %c %s' }
"
augroup RSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

"function! SetUpRubySetting()
"  setlocal completefunc=RSenseCompleteFunction
"  nmap <buffer>tj :RSenseJumpToDefinition<CR>
"  nmap <buffer>tk :RSenseWhereIs<CR>
"  nmap <buffer>td :RSenseTypeHelp<CR>
"endfunction
"autocmd FileType ruby,eruby,ruby.rspec call SetUpRubySetting()

" CoffeeScriptの設定
let g:quickrun_config = {}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}
" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
" 保存時にコンパイル
autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!
" インデントの深さに色を付ける
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_color_change_percent=20
let g:indent_guides_guide_size=1
let g:indent_guides_space_guides=1

hi IndentGuidesOdd  ctermbg=235
hi IndentGuidesEven ctermbg=237
au FileType coffee,ruby,javascript,python IndentGuidesEnable
nmap <silent><Leader>ig <Plug>IndentGuidesToggle

"rubyの設定
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.ruby = 'RSenseCompleteFunction'

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby       = '[^. *\t]\.\w*\|\h\w*::'

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 30
let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_enable_smart_case = 1
" like AutoComplPop
let g:neocomplcache_enable_auto_select = 1
" search with camel case like Eclipse
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

" nerdtree
nmap <Leader>n :NERDTreeToggle<CR>

" タブ関連のキーマッピング
nnoremap [TABCMD]  <nop>
nmap     <leader>t [TABCMD]

nnoremap <silent> [TABCMD]f :<c-u>tabfirst<cr>
nnoremap <silent> [TABCMD]l :<c-u>tablast<cr>
nnoremap <silent> [TABCMD]n :<c-u>tabnext<cr>
nnoremap <silent> [TABCMD]N :<c-u>tabNext<cr>
nnoremap <silent> [TABCMD]p :<c-u>tabprevious<cr>
nnoremap <silent> [TABCMD]e :<c-u>tabedit<cr>
nnoremap <silent> [TABCMD]c :<c-u>tabclose<cr>
nnoremap <silent> [TABCMD]o :<c-u>tabonly<cr>
nnoremap <silent> [TABCMD]s :<c-u>tabs<cr>
te.vim
""""""""""""""""""""""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert = 1

nnoremap    [unite]   <Nop>
nmap    f [unite]

" 分割しないでuniteのbufferを表示する
nnoremap [unite]u  :<C-u>Unite -no-split<Space>

" 全部乗せ
nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -no-split -buffer-name=files buffer file_mru bookmark file<CR>
" ファイル一覧
nnoremap <silent> [unite]f  :<C-u>Unite -no-split -buffer-name=files file<CR>
" バッファ一覧
nnoremap <silent> [unite]j  :<C-u>Unite -no-split buffer<CR>
" 常用セット
nnoremap <silent> [unite]u  :<C-u>Unite -no-split buffer file_mru<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]m  :<C-u>Unite -no-split file_mru<CR>
" 現在のバッファのカレントディレクトリからファイル一覧
nnoremap <silent> [unite]d  :<C-u>UniteWithBufferDir -no-split file<CR>

" Ctrl + JはESCとする                                                                                                                                                                                                                        
au FileType unite inoremap <silent> <buffer> <C-j> <ESC>

" ESCキーで終了する
au FileType unite nmap <silent> <buffer> <C-j> <Plug>(unite_exit)
au FileType unite nmap <silent> <buffer> <ESC> <Plug>(unite_exit)
