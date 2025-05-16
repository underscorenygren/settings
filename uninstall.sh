echo "Remove installation files? (y/n): " # -n suppresses the newline
read -r agreement # -r prevents backslash escapes

if [[ "$agreement" == "y" ]]; then
  echo "removing files"
else
  exit 1
fi

unlink  ~/.gitconfig
unlink ~/.jshint-config
unlink ~/.profile
unlink ~/.zprofile
unlink ~/.screenrc
unlink ~/.tmux.conf
unlink ~/.vimrc
unlink ~/git_prompt.sh

