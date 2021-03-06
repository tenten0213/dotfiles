# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# Customize to your needs...
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/share/npm/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$HOME/.rbenv/shims:$PATH

### Added by Golang
export GOROOT="/usr/local/Cellar/go/1.2.1"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

### Added by Node.js
export PATH=$HOME/.nodebrew/current/bin:$PATH

### Added by Groovy
export PATH=$PATH:$HOME/.gvm/bin
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

### Added by WildFly
export JBOSS_HOME=/usr/local/opt/wildfly-as/libexec
export PATH=${PATH}:${JBOSS_HOME}/bin

### Added by Boot2Dokcer
export DOCKER_HOST=tcp://localhost:4243

case ${OSTYPE} in
  darwin*)
    # added by travis gem
    [ -f /home/tenten0213/.travis/travis.sh ] && source /home/tenten0213/.travis/travis.sh
    [[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc
    export TERM="xterm-256color"
    export LANG=ja_JP.UTF-8
    export LESSCHARSET=utf-8
    export GOROOT=/usr/local/go
    export GOPATH=$HOME/_go
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
    export PATH=$HOME/.nodebrew/current/bin:$PATH
    export M2_HOME=/usr/local/apache-maven-3.3.1
    export PATH=$PATH:$M2_HOME/bin:$PATH
    # export MAVEN2_HOME=/usr/local/Cellar/maven/3.1.1
    # export PATH=$PATH:$MAVEN2_HOME/bin:$PATH
    export PATH=$PATH:$HOME/.rbenv/versions/2.1.0-preview1/bin/xmpfilter
    export PATH=$PATH:$HOME/.rbenv/versions/2.1.0-preview1/rubocop
    ;;
esac

# proxyの設定を読み込む
[ -f ~/.proxy ] && source ~/.proxy
