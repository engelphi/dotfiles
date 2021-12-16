#!/bin/bash

setup_xfce_terminal() {
  git clone https://github.com/arcticicestudio/nord-xfce-terminal.git /tmp/nord-xfce-terminal
  mkdir -p ~/.local/share/xfce4/terminal/colorschemes/
  cp /tmp/nord-xfce-terminal/src/nord.theme ~/.local/share/xfce4/terminal/colorschemes/
}

install_linux() {
    setup_xfce_terminal
    sudo pacman -Syy --noconfirm neovim tmux the_silver_searcher python python-pynvim
    nvim +PlugUpdate +PlugClean! +qa
}
