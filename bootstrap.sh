#!/usr/bin/env bash
set -euo pipefail
set -x

sudo apt update
sudo apt install \
	atuin \
	beets \
	fd-find \
	git \
	mpd \
	mpdris2 \
	ncmpcpp \
	ripgrep \
	stow \
	vim \

./.local/bin/stowdots

SRC=$HOME/src

mkdir -p $SRC
pushd $SRC

ln -sf $(which fdfind) $HOME/.local/bin/fd

# install gnome-terminal colours
if [[ -z "${SRC}/Gogh" ]]; then
	git clone https://github.com/Gogh-Co/Gogh.git
fi
export TERMINAL=gnome-terminal
./Gogh/installs/kanagawa-dragon.sh

# install mise
curl https://mise.run | sh

# install ble.sh
if [[ -z "${SRC}/ble.sh" ]]; then
	git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
fi
make -C ble.sh install PREFIX=~/.local

# set up atuin
atuin login -u lucymcphail
atuin sync

# install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz

# enable mpd service
systemctl --user enable --now mpd.service
systemctl --user enable --now mpDris2.service
