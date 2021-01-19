echo "linking to $PWD"
ln -sf "$PWD/dotgitconfig" ~/.gitconfig
ln -sf "$PWD/dotjshint-config"  ~/.jshint-config
ln -sf "$PWD/dotprofile"  ~/.profile
ln -sf "$PWD/dotzprofile"  ~/.zprofile
ln -sf "$PWD/dotscreenrc" ~/.screenrc
ln -sf "$PWD/dottmux.conf" ~/.tmux.conf
ln -sf "$PWD/dotvimrc" ~/.vimrc
ln -sf "$PWD/git_prompt.sh" ~/git_prompt.sh
VSCODE_DIR="$HOME/Library/Application Support/Code/User/"
if [[ -d "$VSCODE_DIR" ]]; then
  echo "linking vscode settings to $VSCODE_DIR"
  ln -sf "$PWD/vscodesettings.json" "$VSCODE_DIR/settings.json"
  ln -sf "$PWD/vscodekeybindings.json" "$VSCODE_DIR/keybindings.json"
else
  echo "$VSCODE_DIR not present, skipping linking"
fi

