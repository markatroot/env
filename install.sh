#!/bin/bash
# Link dotfiles from this repo into $HOME. Safe to re-run.
set -e

DOTFILES=~/env/dotfiles

link() {
  local src=$1 dest=$2
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    mv "$dest" "$dest.bak"
    echo "backed up $dest -> $dest.bak"
  fi
  ln -sfn "$src" "$dest"
  echo "linked $dest -> $src"
}

link "$DOTFILES/bashrc" ~/.bashrc

[ -f "$DOTFILES/rc/privaterc" ] || echo "note: create $DOTFILES/rc/privaterc (see README)"
