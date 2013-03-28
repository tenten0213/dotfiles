export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
eval "$(rbenv init -)"
_Z_CMD=j
source ~/.zsh/z/z.sh
precmd() {
  _z --add "$(pwd -P)"
}
setopt prompt_subst

source $HOME/.zsh/prompt-git-current-branch
PROMPT='
%B%(?.%F{green}^-^%f.%F{red}@_@%f) %F{blue}[%M:%/]%f`prompt-git-current-branch`%b
%(!.%F{red}%B%n%b%f # .%F{green}%B%n%b%f $ )'

alias ll='ls -la'
vi=vim
source $HOME/.pythonbrew/etc/bashrc
