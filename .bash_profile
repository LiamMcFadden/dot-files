# sh_profile

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=~/bin:$PATH:./:/mnt/c/Program\ Files/Common\ Files/Oracle/Java/javapath:/mnt/c/Program\ Files/Common\ Files/Oracle/Java/javapath

export PATH

#eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
#. "$HOME/.cargo/env"
