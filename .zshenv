export EDITOR="emacsclient -t"
export ALTERNATE_EDITOR=""

export GOPATH=$HOME/.go/workspace/bin

# Node version manager
export NVM_DIR="$HOME/.nvm"

# Use Docker buildkit
export DOCKER_BUILDKIT=1

if (( $+commands[rg] )); then
    # Ripgrep configuration file
    # https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#configuration-file
    export RIPGREP_CONFIG_PATH=$DOTFILES/.ripgreprc
fi

# ┏━┓┏━┓╺┳╸╻ ╻
# ┣━┛┣━┫ ┃ ┣━┫
# ╹  ╹ ╹ ╹ ╹ ╹
# path

export PATH="${GOPATH}:${PATH}"
export PATH="${HOME}/.yarn/bin/:${PATH}"
export PATH="${HOME}/bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"
export DENO_INSTALL="${HOME}/.deno"
export PATH="${DENO_INSTALL}/bin:${PATH}"
# Ruby might be fun
export PATH="${HOME}/.rbenv/bin:${PATH}"
if (( $+commands[rbenv] )); then
    eval "$(rbenv init -)"
    export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
fi

# Yarn: js/ts package manager
if (( $+commands[yarn] )); then
    export PATH="$PATH:$(yarn global bin)"
fi
