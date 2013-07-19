set nocompatible " viとの互換をOFF
set noswapfile " swpファイルを作成しない
set nobackup "バックアップファイルを作らない設定にする
set autoread "他で書き換えられたら読み込み直す
set formatoptions=lmoq " テキスト整形オプション，マルチバイト系を追加
set hidden
set vb t_vb= " ビープをならさない
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
syntax on "シンタックスハイライトを有効にする
set autoindent "オートインデントする
" タブ幅の設定
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set number "行番号を表示する
set incsearch "インクリメンタルサーチ
set ignorecase "検索時に大文字小文字を無視する
set showmatch "対応する括弧のハイラ/イト表示する
set showcmd "コマンドをステータス行に表示
set showmode "モード表示する
set backspace=indent,eol,start
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
set title "編集中のファイル名を表示する
set ruler "ルーラーの表示する
set virtualedit+=block " 矩形選択で自由に移動する
set cursorline " カーソル行をハイライト
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black
" Leader キーを設定
let mapleader = ","
" 横分割時は下へ､ 縦分割時は右へ新しいウィンドウが開くようにする
set splitbelow
set splitright

" OSのクリップボードを使用する
set clipboard+=unnamed
"ヤンクした文字は、システムのクリップボードに入れる
set clipboard=unnamed
" 挿入モードでCtrl+kを押すとクリップボードの内容を貼り付けられるようにする
imap <C-p>  <ESC>"*pa
" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2
" ファイルタイプ判定をon
filetype plugin on

"-------------------------------------------------------------------------------
" エンコーディング関連 Encoding
"-------------------------------------------------------------------------------
set ffs=unix,dos,mac  " 改行文字
set encoding=utf-8    " デフォルトエンコーディング

set encoding=utf-8 "デフォルトの文字コード
set fileencoding=utf-8 "デフォルトの文字コード

" 文字コード認識はbanyan/recognize_charcode.vimへ
" cvsの時は文字コードをeuc-jpに設定
autocmd FileType cvs :set fileencoding=euc-jp
" 以下のファイルの時は文字コードをutf-8に設定
autocmd FileType svn :set fileencoding=utf-8
autocmd FileType js :set fileencoding=utf-8
autocmd FileType css :set fileencoding=utf-8
autocmd FileType html :set fileencoding=utf-8
autocmd FileType xml :set fileencoding=utf-8
autocmd FileType json :set fileencoding=utf-8
autocmd FileType java :set fileencoding=utf-8
autocmd FileType scala :set fileencoding=utf-8
autocmd FileType clojure :set fileencoding=utf-8
autocmd FileType ruby :set fileencoding=utf-8

" ワイルドカードで表示するときに優先度を低くする拡張子
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" 指定文字コードで強制的にファイルを開く
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932

" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

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
"ビジュアルモード時vで行末まで選択
vnoremap v $h

filetype off " ファイル形式の検出を無効にする
" Vundle を初期化してVundle 自身も Vundle で管理
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" 文字コード
Bundle 'banyan/recognize_charcode.vim'

" ライブラリ管理
Bundle 'gmarik/vundle'

" tagsを利用したソースコード閲覧・移動補助機能
Bundle 'Source-Explorer-srcexpl.vim'
Bundle 'taglist.vim'
Bundle 'trinity.vim'

" multipule
Bundle 'terryma/vim-multiple-cursors'

" endなどを自動挿入
Bundle 'tpope/vim-endwise.git'
" vimからdb弄る
Bundle 'vim-scripts/dbext.vim'
" ブラウザで開く
Bundle 'open-browser.vim'
" ググる
nnoremap <Leader>ggr :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>
" httpでGetとか出来る
Bundle 'mattn/webapi-vim'
" indentの深さに色を付ける
Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'tell-k/vim-browsereload-mac' "vimからブラウザをリロードする

"日本語の移動に便利なの
Bundle "deton/jasegment.vim"

" コード補完
Bundle "Shougo/neocomplcache"
Bundle "Shougo/neosnippet"
Bundle "taichouchou2/vim-rsense"

" unite
Bundle "Shougo/unite.vim"
Bundle 'ujihisa/unite-colorscheme'
Bundle 'h1mesuke/unite-outline'

" vimfiler
Bundle "Shougo/vimfiler"

" vimからなにかを実行するのに利用
Bundle 'thinca/vim-quickrun'
Bundle "Shougo/vimproc"
Bundle "Shougo/vimshell"


"------------------------------------
"" smooth_scroll.vim
"------------------------------------
Bundle 'yuroyoro/smooth_scroll.vim'
map  :call SmoothScroll("d",1, 1)<CR>
map :call SmoothScroll("u",1, 1)<CR>

" ファイルツリー表示
Bundle "scrooloose/nerdtree"

"------------------------------------
" NERD_commenter.vim
"------------------------------------
" コメントトグル<Leader>c<space>でコメントをトグル)
Bundle 'scrooloose/nerdcommenter.git'
" コメントの間にスペースを空ける
let NERDSpaceDelims = 1
"<Leader>xでコメントをトグル(NERD_commenter.vim)
map <Leader>x, c<space>
"未対応ファイルタイプのエラーメッセージを表示しない
let NERDShutUp=1

"------------------------------------
" Align
"------------------------------------
" Align : 高機能整形・桁揃えプラグイン
Bundle 'Align'
" Alignを日本語環境で使用するための設定
let g:Align_xstrlen = 3

" マルチバイト対応の整形
Bundle 'h1mesuke/vim-alignta'

"------------------------------------
" surround.vim
"------------------------------------
" surround.vim : テキストを括弧で囲む／削除する
Bundle 'tpope/vim-surround'
" s, ssで選択範囲を指定文字でくくる
"nmap s <Plug>Ysurround
"nmap ss <Plug>Yssurround
let g:surround_{char2nr('e')} = "begin \r end"
let g:surround_{char2nr('d')} = "do \r end"
let g:surround_{char2nr("-")} = ":\r"

" smartchr.vim : ==などの前後を整形
Bundle 'smartchr'

" YankRing.vim : ヤンクの履歴を管理し、順々に参照、出力できるようにする
" pasteした後にCtrl+n,pで履歴から貼り付けられる
Bundle 'YankRing.vim'
" Yankの履歴参照
" ノーマルモード,yでYankの履歴参照
nnoremap <silent> ,y :YRShow<CR>

" Ruby
Bundle 'ruby-matchit'
Bundle 'tpope/vim-cucumber'
Bundle "reinh/vim-makegreen"

" railsサポート
Bundle 'tpope/vim-rails'
Bundle "rails.vim"
Bundle 'ujihisa/unite-rake'
Bundle 'basyura/unite-rails'
"Bundle 'vim-scripts/project.vim'

" js
Bundle 'JavaScript-syntax'
" Bundle 'itspriddle/vim-javascript-indent'
Bundle 'jiangmiao/simple-javascript-indenter'
Bundle 'teramako/jscomplete-vim'

" DOMとMozilla関連とES6のメソッドを補完
let g:jscomplete_use = ['dom', 'moz', 'es6th']
" Bundle 'taichouchou2/vim-javascript' " jQuery syntax追加
Bundle 'kchmck/vim-coffee-script'
Bundle 'jQuery'

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
Bundle 'scrooloose/syntastic'
" jshintを使ってチェック
let g:syntastic_javascript_checker = "jshint"

" Haml
Bundle 'tpope/vim-haml'
" Slim
Bundle 'slim-template/vim-slim'

" CSS
Bundle 'mattn/zencoding-vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'taichouchou2/html5.vim'

" Less
Bundle 'groenewege/vim-less'

"scss
Bundle 'cakebaker/scss-syntax.vim'

" clojure
Bundle 'slimv.vim'
let g:slimv_swank_clojure = '!osascript -e "tell app \"iTerm\"" -e "tell the first terminal" -e "set mysession to current session" -e "launch session \"Default Session\"" -e "tell the last session" -e "exec command \"/bin/bash\"" -e "write text \"cd $(pwd)\"" -e "write text \"lein swank\"" -e "end tell" -e "select mysession" -e "end tell" -e "end tell"'
au BufRead,BufNewFile,BufReadPre *.clj   set filetype=clojure
"Bundle "thinca/vim-ft-clojure"
"Bundle 'VimClojure'
"let vimclojure#WantNailgun = 1
"let vimclojure#NailgunClient = "ng"

" git
Bundle "git://git.wincent.com/command-t.git"
Bundle "tpope/vim-fugitive"
nnoremap <silent> ,ga :Gwrite<CR>
nnoremap <silent> ,gc :Gcommit<CR>
nnoremap <silent> ,gcv :Gcommit-v<CR>
nnoremap <silent> ,gs :Gstatus<CR>
nnoremap <silent> ,gd :Gdiff<CR>
nnoremap <silent> ,gb :Gblame<CR>
nnoremap <silent> ,gl :Glog<CR>

" markdown
Bundle 'plasticboy/vim-markdown'

" textile
Bundle 'timcharper/textile.vim'

" JSON
Bundle 'elzr/vim-json'
" jq
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction

" reference環境
Bundle 'thinca/vim-ref'
Bundle 'taichouchou2/vim-ref-ri'
Bundle 'taq/vim-rspec'
" :HttpStatus でHttpStatusを表示
Bundle 'mattn/httpstatus-vim'
" カラースキーマ
Bundle 'ujihisa/unite-colorscheme'
Bundle 'nanotech/jellybeans.vim'
Bundle 'tomasr/molokai'
colorscheme desert

" Twitter
Bundle 'TwitVim'
let twitvim_count = 40
nnoremap ,tw :<C-u>PosttoTwitter<CR> "ツイーヨ
nnoremap ,tl :<C-u>FriendsTwitter<CR><C-w><C-k> "タイムライン表示
nnoremap ,tu :<C-u>UserTwitter<CR><C-w><C-k> "自分のつぶやき
nnoremap ,tr :<C-u>RepliesTwitter<CR><C-w><C-k> "リプ
nnoremap ,td :<C-u>NextTwitter<CR> "DM
"Bundle "mattn/streamer-vim"
"Bundle "basyura/twibill.vim"
"Bundle "rhysd/unite-twitter.vim"

autocmd FileType twitvim call s:twitvim_my_settings()
function! s:twitvim_my_settings()
  set nowrap
endfunction

" ファイル形式検出、プラグイン、インデントを ON
:set shiftwidth=2
filetype plugin indent on

"source $VIMRUNTIME/macros/matchit.vim
filetype plugin on

"rsenseの設定
let g:rsenseUseOmniFunc = 1
let g:rsenseHome = expand('~/.vim/ref/rsense-0.3')

"vimshellの設定
if has('mac')
  let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/vimproc_mac.so'
elseif has('win32')
  let g:vimproc_dll_path = $HOME . '/.vim/bundle/vimproc/autoload/vimproc_win32.dll'
elseif has('win64')
  let g:vimproc_dll_path = $HOME . '/.vim/bundle/vimproc/autoload/vimproc_win64.dll'
else
  let g:vimproc_dll_path = $HOME . '/.vim/bundle/vimproc/autoload/vimproc_unix.so'
endif

" RSpecコマンド
nnoremap <silent> ,rs :RunSpec<CR>
nnoremap <silent> ,rl :RunSpecLine<CR>

augroup RSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

function! SetUpRubySetting()
  setlocal completefunc=RSenseCompleteFunction
  nmap <buffer>tj :RSenseJumpToDefinition<CR>
  nmap <buffer>tk :RSenseWhereIs<CR>
  nmap <buffer>td :RSenseTypeHelp<CR>
endfunction
autocmd FileType ruby,eruby,ruby.rspec call SetUpRubySetting()

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
au FileType coffee,ruby,javascript,python,clojure IndentGuidesEnable
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
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" rails.vim の設定(うまくいってない…)
autocmd User Rails.controller* Rnavcommand api app/controllers/api -glob=**/* -suffix=_controller.rb
autocmd User Rails.controller* Rnavcommand tmpl app/controllers/tmpl -glob=**/* -suffix=_controller.rb
autocmd User Rails Rnavcommand config config   -glob=*.*  -suffix= -default=routes.rb
autocmd User Rails nmap :<C-u>RScontroller :<C-u>Rcj
autocmd User Rails nmap :<C-u>RVcontroller :<C-u>Rcl
autocmd User Rails nmap :<C-u>RSmodel :<C-u>Rml
autocmd User Rails nmap :<C-u>RVmodel :<C-u>Rmj
autocmd User Rails nmap :<C-u>RSview :<C-u>Rvj
autocmd User Rails nmap :<C-u>RVview :<C-u>Rvl

" neocomplcacheの設定
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

" neosnippetの設定
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" quickrunの設定
nmap <Leader>r <Plug>(quickrun)
" 横分割をするようにする
let g:quickrun_config={'*': {'split': 'below'}}
" CoffeeScriptの設定
let g:quickrun_config = {}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}
"RSpec対応
let g:quickrun_config = {}
let g:quickrun_config['ruby.rspec'] = {'command': "rspec"}
let g:quickrun_config['ruby.rspec'] = { 'command': 'rspec', 'cmdopt': 'bundle exec', 'exec': '%o %c %s' }


let g:quickrun_config = {
    \ 'textile': {
    \   'command'   : 'redcloth',
    \   'exec'      : '%c  %s',
    \   'outputter' : 'browser',
    \ },
    \}

" nmap <Leader>n :NERDTreeToggle<CR>

" Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" insert mode での移動
inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-b> <BS>
inoremap <C-d> <DEL>

"%の移動をtabでも可能に。
" tab means %
nnoremap <tab> %

"splitの移動を簡単に。ctrl押しながらhjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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

" unite-rails
" model
nnoremap <silent> [unite]rm  :<C-u>Unite -no-split -buffer-name=files rails/model<CR>
" view
nnoremap <silent> [unite]rv  :<C-u>Unite -no-split -buffer-name=files rails/view<CR>
" controller
nnoremap <silent> [unite]rc  :<C-u>Unite -no-split -buffer-name=files rails/controller<CR>
" db
nnoremap <silent> [unite]rd  :<C-u>Unite -no-split -buffer-name=files rails/db<CR>
" javascript
nnoremap <silent> [unite]rj  :<C-u>Unite -no-split -buffer-name=files rails/javascript<CR>
" stylesheet
nnoremap <silent> [unite]rs  :<C-u>Unite -no-split -buffer-name=files rails/stylesheet<CR>
" config
nnoremap <silent> [unite]rf  :<C-u>Unite -no-split -buffer-name=files rails/controller<CR>


" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

" ESCキーで終了する
au FileType unite nmap <silent> <buffer> <ESC> <Plug>(unite_exit)
" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
endfunction
