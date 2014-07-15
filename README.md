# my dotfiles

## proxy settings

```
$ touch ~/.proxy
$ echo "export http_proxy=http://yourproxy:8080" >> ~/.proxy
$ echo "export https_proxy=http://yourproxy:8080" >> ~/.proxy
```

`.proxy` is load by `.zshenv`.

## git settings

### install git

```
$ sudo apt-get install git
```

### install hub

```
$ git clone git://github.com/github/hub.git
$ cd hub
$ sudo -E rake install
```

## zsh settings

###  install zsh

```
$ sudo apt-get install zsh
$ chsh
/bin/zsh
```

### install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

```
$ wget --no-check-certificate http://install.ohmyz.sh -O - | sh
```

### install [z](https://github.com/rupa/z)

```
$ mkdir ~/.zsh.d
$ git clone https://github.com/rupa/z ~/.zsh.d/z
$ touch ~/.z
```

## tmux settings

### install tmux

```
$ sudo apt-get remove tmux
$ sudo apt-get install libevent-dev libncurses-dev pkg-config
$ wget http://sourceforge.net/projects/tmux/files/tmux/tmux-1.9/tmux-1.9a.tar.gz/download
$ mv download tmux.tar.gz
$ tar zxvf tmux.tar.gz
$ cd tmux-1.9a
$ ./configure
$ make
$ sudo make install
```

## Ruby settings

### install require packages

```
$ sudo apt-get install build-essential bison libreadline6-dev curl git-core zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev autoconf libncurses5-dev
```

### install rbenv & ruby-build & ruby

```
$ git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
$ git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
$ rbenv install --list
$ rbenv install 2.1.2
$ rbenv global 2.1.2
$ gem install rbenv-rehash
$ rbenv rehash
$ gem install bundler
$ gem install rake
```

## Node.js settings
