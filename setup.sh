#!/bin/bash
function setup_tmux() {
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	cp tmux.conf ~/.tmux.conf
}

function setup_xfce_terminal() {
	git clone https://github.com/arcticicestudio/nord-xfce-terminal.git /tmp/nord-xfce-terminal
	mkdir -p ~/.local/share/xfce4/terminal/colorschemes/
	cp /tmp/nord-xfce-terminal/src/nord.theme ~/.local/share/xfce4/terminal/colorschemes/
}

setup_tmux
setup_xfce_terminal



cp vimrc ~/.vimrc
cp -r config/* ~/.config/
