#!/bin/sh
dir=$(realpath $(dirname "$0"))

echo "Install settings at $dir to $PWD? (y/n): " # -n suppresses the newline
read -r agreement # -r prevents backslash escapes

if [[ "$agreement" == "y" ]]; then
  echo "Creating symlinks"
else
  exit 1
fi

set -x

ln -sf "$dir/dotgitconfig" $PWD/.gitconfig
ln -sf "$dir/dotjshint-config"  $PWD/.jshint-config
ln -sf "$dir/dotprofile"  $PWD/.profile
ln -sf "$dir/dotzprofile"  $PWD/.zprofile
ln -sf "$dir/dotscreenrc" $PWD/.screenrc
ln -sf "$dir/dottmux.conf" $PWD/.tmux.conf
ln -sf "$dir/dotvimrc" $PWD/.vimrc
ln -sf "$dir/git_prompt.sh" $PWD/git_prompt.sh

set +x

VSCODE_DIR="$PWD/Library/Application Support/Code/User/"
if [[ -d "$VSCODE_DIR" ]]; then
  echo "linking vscode settings to $VSCODE_DIR"
  set -x
  ln -sf "$dir/vscodesettings.json" "$VSCODE_DIR/settings.json"
  ln -sf "$dir/vscodekeybindings.json" "$VSCODE_DIR/keybindings.json"
else
  echo "$VSCODE_DIR not present, skipping linking"
fi

