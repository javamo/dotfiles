function clean_pyc {
    for i in $(find . -name '*.pyc'); do rm -f $i; done
}

# For GAE environment
# Taken from https://gist.github.com/3353248
export WORKON_HOME=$HOME/envs
source `which virtualenvwrapper.sh`

#export CC=llvm-gcc-4.2
#export CXX=llvm-g++-4.2