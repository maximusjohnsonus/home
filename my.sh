# TODO
# https://github.com/zsh-users/zsh-syntax-highlighting

alias msj="ssh andrew"
alias ccmsj="ssh cclub"
alias ece="ssh ece"

alias e="emacs -nw"
alias edit="emacs -nw"
export EDITOR="emacs -nw"

export PATH=$PATH:$HOME/bin:$HOME/home/bin:$HOME/.local/bin
export CPPFLAGS=("-Wall" "-Wextra" "-Wshadow" "-Werror" "-std=c++14" "-pedantic" "-g")
export CFLAGS=("-Wall" "-Wextra" "-Wshadow" "-Werror" "-std=c11" "-pedantic" "-g")

alias gst=" git status"

export PS1=" %{%F{red}%B%}%n%{%f%b%} | "  # " max | "
#export PS1="[%{%F{red}%B%}%n%{%f%b%}]: " # "[max]: "
export RPROMPT="%F{green}%~%f"

# ls things
alias ls=' ls --color=auto --hide="*~"'
alias la=" ls -a"
alias l=" ls -alh"
alias fg=" fg"
eval $(dircolors -b $HOME/.dircolors) # https://github.com/trapd00r/LS_COLORS

export WORDCHARS="*?[]~&;!#$%^(){}<>" # Chars that are treated as words

function mkcd(){
  if mkdir $1; then
    cd $1
  fi
}
alias ..="cd .."

# NixOS things
alias nixedit="sudo emacs -nw /etc/nixos/configuration.nix"
alias nixswitch="sudo nixos-rebuild switch"
alias nixtest="sudo nixos-rebuild test"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/nix/var/nix/profiles/system/sw/lib


if [[ $TERM == "dumb" ]]
then
    # dumb terms do weird things with PS1
    export PS1="> "
else
    # ZSH things
    bindkey '^[[1;5C' forward-word
    bindkey '^[[1;5D' backward-word
    bindkey '^W' kill-region
    bindkey '^[[3;5~' kill-word
    # fg binding - runs a widget that runs fg?
    fg_widget() fg
    zle -N fg_widget
    bindkey '^Z' fg_widget

    # Make pretty colors
    export TERM=xterm-256color
    # if [[ ! -o login ]] ; then
    #     export TERM=xterm-256color
    # else
    #     export TERM=xterm          # This makes control+arrows work better
    # fi

    # Make ls and fg not clog up the history
    setopt histignorespace
    # We also added a space in front of ls and fg above
fi