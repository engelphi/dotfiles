#!/bin/bash

install_brew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_mac() {
    install_brew
    sudo chown -R "$(whoami)" /usr/local/bin /usr/local/etc /usr/local/sbin
    chmod u+w /usr/local/bin /usr/local/etc /usr/local/sbin
    sudo brew install neovim tmux the_silver_searcher python pynvim llvm
    nvim +PlugUpdate +PlugClean! +qa
}
