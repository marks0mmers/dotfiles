export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"

plugins=(
    git
    zsh-autosuggestions
    you-should-use
    zsh-bat
    aws
    kubectl
)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim
export PATH=~/.local/bin:$PATH
export PATH=$GHOSTTY_BIN_DIR:$PATH

if [[ $(uname) == "Darwin" ]]; then
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home
    export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
    export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
    export PATH="$(brew --prefix llvm)/bin:${PATH}"
    export PATH="/opt/homebrew/opt/ruby@2.7/bin:$PATH"
    export PATH="$BUN_INSTALL/bin:$PATH" 
    export PATH="/usr/local/go/bin:$PATH"
    export PATH="$HOME/.juliaup/bin:$PATH"
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="/opt/homebrew/Cellar/zigup/2025.01.02/bin:$PATH"
    eval "$(rbenv init -)"
    eval "$(zoxide init zsh)"

    [ -s ~/.luaver/luaver ] && . ~/.luaver/luaver
    luaver set-default-luarocks 3.11.1 > /dev/null
    luaver set-default 5.1 > /dev/null

else 
    export PATH="/usr/local/go/bin:$PATH"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi


[[ ! -r '~/.opam/opam-init/init.zsh' ]] || source '~/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source <(fzf --zsh)

. ~/.cargo/env
~/.config/fzf/tokyonight_night.sh

alias k='kubectl'
alias vim='nvim'
alias vi='nvim'
alias v='nvim .'
alias vzshrc='nvim ~/.zshrc'
alias szshrc='source ~/.zshrc'
alias oldvim='\vim'

