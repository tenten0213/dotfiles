"vunlde.vimで管理してるpluginを読み込む
source ~/dotfiles/.vimrc.bundle

"基本設定
source ~/dotfiles/.vimrc.basic
"StatusLine設定
source ~/dotfiles/.vimrc.statusline
"インデント設定
source ~/dotfiles/.vimrc.indent
"表示関連
source ~/dotfiles/.vimrc.apperance
"補完関連
source ~/dotfiles/.vimrc.completion
"検索関連
source ~/dotfiles/.vimrc.search
"移動関連
source ~/dotfiles/.vimrc.moving
"Color関連
source ~/dotfiles/.vimrc.colors
"編集関連
source ~/dotfiles/.vimrc.editing
"エンコーディング関連
source ~/dotfiles/.vimrc.encoding
"プラグインに依存する設定
source ~/dotfiles/.vimrc.plugins_setting

filetype plugin indent on     " required!
filetype indent on
syntax on
