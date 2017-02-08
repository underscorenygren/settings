_JAVA_HOME=$(/usr/libexec/java_home)
export CODEHOME="$HOME/dev"
export GOPATH="$CODEHOME/go"
export PATH="$PATH:$HOME/.rvm/bin:$_JAVA_HOME/bin:/Users/erik/dev/scala-2.11.6/bin:usr/local/opt/go/libexec/bin:$GOPATH/bin:$CODEHOME/terraform:$CODEHOME/utilities/bin:$CODEHOME/phabricator/arcanist/bin"
export EDITOR=vim
export HISTCONTROL=ignoreboth

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
source "$HOME/git_prompt.sh"
PS1='\h@\u:\w $(__git_ps1 "(%s)")\$ '

alias ll="ls -al"
alias rgrep="grep -r --color=always"
alias web="cd $CODEHOME/website/rails"
alias webd="cd $CODEHOME/website/rails/dckr"
alias serv="cd $CODEHOME/services/javaworker"
alias util="cd $CODEHOME/utilities"
alias start_dynamo="cd $CODEHOME/dynamo && nohup java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -inMemory -port 8888 > ~/dynamoout.txt 2> ~/dynamoerr.text < /dev/null &"
alias grep="grep --color=always"
alias dpurge="docker ps -a | grep -Eiv Up | cut -d ' ' -f 1 | xargs docker rm"
alias dipurge="docker images | grep none | tr -s ' ' | cut -d ' ' -f 3 | xargs docker rmi"
alias dkillall="docker ps -a | cut -d ' ' -f 1 | xargs docker stop | xargs docker rm"
alias dclean="docker ps -a | grep 'Exited' | awk '{print \$1}' | xargs docker rm"
alias diclean="docker images | grep '<none>' | awk '{print \$3}' | xargs docker rmi"
alias d="docker"
alias dc="docker-compose"
alias dir="docker run --rm -i -t"

rg() {
  if [ $# -eq 2 ]
    then
      rgrep $1 $2
    else
      rgrep $1 *
  fi
}

code() {
  if [ ! -z "$1" ]
    then
      cd $CODEHOME/$1
  else
    cd $CODEHOME
  fi
}

delimfn() {
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

gget() {
  if [ ! -d ./src ]
    then
      echo "must run from root go path ($GOPATH)"
    else
      out="$(go get $1 2>&1)"
      if [ -z "$out" ]
        then
          echo $out
          echo "[submodule \"$1\"]
  path = src/$1
  url = http://$1" >> .gitmodules
        else
          echo $out
      fi
  fi
}

jagfn() {
  ag -G "\.((java)|(scala))" "$1"
}

killpsfn() {
  kill $(ps aux | grep "$1" | awk '{print $2}')
}
psid() {
  ps aux | grep "$1" | awk '{print $2}'
}


alias delim=delimfn
alias psvim=psvimfn
alias psgrep=psgrepfn
alias pcgrep=pcgrepfn
alias dm=docker-machine
alias jag=jagfn
alias grepkill=killpsfn
alias grepid=psid

#eval "$(docker-machine env default)"

#unset DOCKER_CERT_PATH
#unset DOCKER_TLS_VERIFY

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

docker-ip() {
  docker-machine ip default 2> /dev/null
}

alias rc='web && bundle exec rails c'

alias unseal='curl -XPUT -k https://vault.service.consul:8200/v1/sys/unseal -d "{\"key\": \"$UNSEAL_KEY\"}"'
alias keynoteconnect='ssh -i ~/dev/utilities/docformation/.ssh/cfn-docukey.pem sysadmin@66.219.169.94'
alias demomaster='ssh demo.akka.master.i-7df7b5ee -L 8989:demo.akka.master.i-7df7b5ee:8081 2> /dev/null'
alias prodmaster='ssh production.akka.master.i-7bb0ee83 -L 8989:production.akka.master.i-7bb0ee83:8081 2> /dev/null'

dconnfn() {
  util
  cd docformation
  ruby docconnection.rb $1 $2 $3 $4
}
alias dconn=dconnfn
source ~/.tmuxinator/tmuxinator.bash
alias tm=tmuxinator
sshafn() {
  eval $(ssh-agent)
  ssh-add
}
alias ssha=sshafn
source ~/.tokens

