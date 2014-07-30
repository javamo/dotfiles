function gh() {
  # Open up the github url for the branch you are on.
  giturl=$(git config --get remote.origin.url)
  if [ "$giturl" == "" ]
    then
     echo "Not a git repository or no remote.origin.url set"
     return 1
  fi

  giturl=${giturl/git\@github\.com\:/https://github.com/}
  giturl=${giturl/\.git/\/tree/}
  branch="$(git symbolic-ref HEAD 2>/dev/null)" ||
  branch="(unnamed branch)"     # detached HEAD
  branch=${branch##refs/heads/}
  giturl=$giturl$branch
  open $giturl
  echo $giturl
}

function addmod() {
  # Quickly stage all of the modified files.
  printf "Staging files\n=============\n"
  for output in $(git status | grep modified | sed 's/\(.*modified:\s*\)//')
  do
    read -p "Stage $output (y/N) " yn
    if [ "$yn" = "y" ] || [ "$yn" = "Y" ]; then
      git add $output
    fi
  done
}

alias bowerredo='rm -r bower_components && bower cache clean && bower install'

function clean_pyc {
    for i in $(find . -name '*.pyc'); do rm -f $i; done
}

# For GAE environment
# Taken from https://gist.github.com/3353248
export WORKON_HOME=$HOME/envs
source `which virtualenvwrapper.sh`

#export CC=llvm-gcc-4.2
#export CXX=llvm-g++-4.2