# include files
if [ -f ${HOME}/.zsh_main ]; then
    source ${HOME}/.zsh_main
fi

if [ -f ${HOME}/.zsh_option ]; then
    source ${HOME}/.zsh_option
fi

if [ -f ${HOME}/.zsh_alias ]; then
    source ${HOME}/.zsh_alias
fi

if [ -f ${HOME}/.zsh_local ]; then
    source ${HOME}/.zsh_local
fi


export PATH=/usr/bin/:/usr/sbin:/sbin:/bin:/usr/local/bin/:$HOME/dotfiles/script/tools:$PATH
export PATH=$HOME/dotfiles/script/tools/peco_linux_amd64:$PATH

# incude anyframe functions
fpath=($HOME/.zsh/anyframe(N-/) $fpath)
autoload -Uz anyframe-init
anyframe-init

export PATH=/usr/bin/:/usr/sbin:/sbin:/bin:/usr/local/bin/:$HOME/dotfiles/script/tools:$PATH
export LESS='-R'
export LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh %s'
