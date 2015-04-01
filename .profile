
_JAVA_HOME=$(/usr/libexec/java_home)
export CODEHOME="$HOME/dev"
export GOPATH="$CODEHOME/go"
export PATH="$PATH:$HOME/.rvm/bin:$_JAVA_HOME/bin:/Users/erik/dev/scala-2.11.6/bin:usr/local/opt/go/libexec/bin:$GOPATH/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
source "$HOME/git_prompt.sh"
PS1='\h@\u:\w $(__git_ps1 "(%s)")\$ '

alias ll="ls -al"
alias rgrep="grep -r --color=always"
alias web="cd $CODEHOME/website/rails"
alias serv="cd $CODEHOME/services"
alias util="cd $CODEHOME/utilities"
alias start_dynamo="cd $CODEHOME/dynamo && nohup java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -inMemory -port 8888 > ~/dynamoout.txt 2> ~/dynamoerr.text < /dev/null &"
alias grep="grep --color=always"
alias dpurge="docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm"
alias dipurge="docker images | grep none | tr -s ' ' | cut -d ' ' -f 3 | xargs docker rmi"
alias dvpurge="docker-volumes list | tr -s ' ' | grep '| |' | cut -d ' ' -f 2 | xargs docker-volumes rm"
alias dkillall="docker ps -a | cut -d ' ' -f 1 | xargs docker stop | xargs docker rm"
alias d="docker"
alias dc="docker-compose"
alias dir="docker run --rm -i -t"
alias dv="docker-volumes"

code() {
  cd $CODEHOME
  if [ ! -z "$1" ]
    then
      cd $1
  fi
}

delim() {
  docker stop $1
  docker rm $1
}

psvimfn() {
  ps axu | grep $1 > /tmp/psvim
  vim /tmp/psvim
}
pcgrepfn() {
  ps axu -c | grep $1
}
psgrepfn() {
  ps axu | grep $1 
}

alias psvim=psvimfn
alias psgrep=psgrepfn
alias pcgrep=pcgrepfn

`boot2docker shellinit 2> /dev/null &`
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

docker-ip() {
  boot2docker ip 2> /dev/null
}
