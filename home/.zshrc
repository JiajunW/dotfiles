# {{{ Functions
include () {
    # `true` to make $? to 0
    # some prompt, such as powerline, may show an error if not suppress $?
    [[ -f "$1" ]] && source "$1" || true
}

append_path () {
    [[ -d "$1" ]] && export PATH=$PATH:"$1"
}

prepend_path () {
    [[ -d "$1" ]] && export PATH="$1":$PATH
}
# }}}

# {{{ OS specific
case "$(uname -s)" in

   Darwin)
     # Mac OS X
     include $HOME/.zshrc.mac
     ;;

   Linux)
     # Linux
     include $HOME/.zshrc.linux
     ;;

   CYGWIN*|MINGW32*|MSYS*)
     include $HOME/.zshrc.windows
     ;;

   *)
     echo 'other OS (or missing cases for above OSs)'
     ;;
esac

include $HOME/.zshrc.local
# }}}

# {{{ homeshick
# Must set fpath before compinit
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
# }}}

# {{{ zsh config
HISTFILE=~/.zshhistory
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory beep extendedglob nomatch notify
setopt HIST_IGNORE_DUPS
setopt completealiases
setopt nohashdirs
unsetopt autocd
bindkey -e

autoload -U compinit promptinit select-word-style
compinit
promptinit
prompt suse

select-word-style bash

zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' rehash true
# }}}

# {{{ Environment variables
[ -z $EDITOR ] && export EDITOR=vim

append_path  /sbin
append_path  /usr/sbin
append_path  /usr/local/bin
prepend_path $HOMEBREW_ROOT/bin
prepend_path $HOMEBREW_ROOT/opt/coreutils/libexec/gnubin
prepend_path $HOME/prefix/bin
append_path  $HOME/.local/bin
append_path  $HOME/Library/Python/2.7/bin
append_path  $HOME/Library/Python/3.5/bin
append_path  $HOME/.node/bin
append_path  $HOME/.gem/ruby/2.2.0/bin

if [ $TERM = "xterm" ]; then
    export TERM=xterm-256color
fi
# }}}

# {{{ Powerlevel10k
source $HOME/.p10k/powerlevel10k.zsh-theme
source $HOME/.p10k.zsh
# }}}

# {{{ alias
alias du='du -h'
alias df='df -h'

alias unzip-gbk='unzip -O CP936'
alias wgsite='wget -r -p -np -k'
# }}}

# {{{ tmuxinator
include $HOME/.gem/ruby/2.2.0/gems/tmuxinator-0.6.11/completion/tmuxinator.zsh
# }}}

# {{{ virtualenv
include $HOME/Library/Python/2.7/bin/virtualenvwrapper.sh      # mac
include /usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh # ubuntu
# }}}

# vim: set foldmethod=marker :
