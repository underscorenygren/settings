brew install python tmux bash-completion git-extras
gem install tmuxinator

mkdir ~/.tmuxinator
curl -o ~/.tmuxinator/tmuxinator.bash https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.bash

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

