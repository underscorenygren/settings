#install brew
#install karabiner-elements
#install rvm?

brew install reattach-to-user-namespace #Might not be needed, fixes this on MacOSX Sierra https://github.com/tmux/tmux/issues/543
brew install python tmux bash-completion git-extras
gem install tmuxinator
pip install --upgrade --user awscli

mkdir ~/.tmuxinator
curl -o ~/.tmuxinator/tmuxinator.bash https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.bash

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

