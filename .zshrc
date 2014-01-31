# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
case ${OSTYPE} in
  darwin*)
    ZSH_THEME="powerline"
    ;;
  linux*)
    ZSH_THEME="gianu"
    ;;
esac

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby osx brew rails emoji-clock)

_Z_CMD=j
source $ZSH/oh-my-zsh.sh
source "$HOME/.zsh.d/z/z.sh"

bindkey -v

# show hidden-files
alias hfon="defaults write com.apple.finder AppleShowAllFiles true|killall Finder"
# hidden hidden-files
alias hfoff="defaults write com.apple.finder AppleShowAllFiles false|killall Finder"

la='ls -la'
function cdls() {
    # cdがaliasでループするので\をつける
    \cd $1;
    ls;
}
alias cd=cdls

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

# 全検索
function history-all { history -E 1 }

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# 余分な空白は詰めて記録
setopt hist_reduce_blanks  

# 古いコマンドと同じものは無視 
setopt hist_save_no_dups

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 補完時にヒストリを自動的に展開         
setopt hist_expand

# 履歴をインクリメンタルに追加
setopt inc_append_history

bindkey "^P" up-line-or-history
bindkey "^N" down-line-or-history

# インクリメンタルからの検索
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

# Customize to your needs...
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/share/npm/bin:/usr/local/share/python
eval "$(rbenv init -)"

fpath=(~/.zsh/completion $fpath)
autoload -U compinit
compinit -u

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### virtualenv settings
export WORKON_HOME="$HOME/.virtualenvs"

# added by travis gem
[ -f /home/tenten0213/.travis/travis.sh ] && source /home/tenten0213/.travis/travis.sh
PATH="/usr/local/heroku/bin:$PATH"
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc
source `which virtualenvwrapper.sh`
export TERM="xterm-256color"
