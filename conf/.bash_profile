export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PS1="\[\e[1;31m\]\u\[\e[34m\]\$ \[\e[32m\]\t \[\e[35m\]LV$SHLVL \[\e[36m\]\#-\j  \[\e[33m\][\[\e[34m\]\w\[\e[33m\]]\[\e[30m\]\r\n-:>\[\e[0m\] " 


export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export HISTSIZE=100000
set autoexpand

export SVN_EDITOR=/usr/bin/vim

export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Users/a0x55aa/.cargo/bin:/usr/local/share/dotnet:/Users/qixi/tools/phantomjs-2.1.1-macosx/bin:/Users/qixi/tools/node-v4.2.6-darwin-x64/bin:/usr/local/share/scala-2.11.7/bin:/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH


# 匹配ssh host
_complete_hosts () {
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	host_list=`{ 
		for c in /etc/ssh_config /etc/ssh/ssh_config ~/.ssh/config
		do [ -r $c ] && sed -n -e 's/^Host[[:space:]]//p' -e 's/^[[:space:]]*HostName[[:space:]]//p' $c
		done
		for k in /etc/ssh_known_hosts /etc/ssh/ssh_known_hosts ~/.ssh/known_hosts
		do [ -r $k ] && egrep -v '^[#\[]' $k|cut -f 1 -d ' '|sed -e 's/[,:].*//g'
		done
		sed -n -e 's/^[0-9][0-9\.]*//p' /etc/hosts; }|tr ' ' '\n'|grep -v '*'`
	COMPREPLY=( $(compgen -W "${host_list}" -- $cur))
	return 0
}
complete -F _complete_hosts ssh

# virtualenv auto active
# Support for bash
export PROMPT_COMMAND='prompt'

function prompt()
{
    if [ "$PWD" != "$MYOLDPWD" ]; then
        MYOLDPWD="$PWD"
        test -e .venv && workon `cat .venv`
    fi
}


# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/qixi/cocos2d-x-3.11/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Users/qixi
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/qixi/cocos2d-x-3.11/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH


MAVEN_HOME=~/tools/apache-maven-3.3.9
PATH=$MAVEN_HOME/bin:$PATH 
export MAVEN_HOME

export BXSHARE="$HOME/opt/bochs/share/bochs"
export PATH="$PATH:$HOME/opt/bochs/bin"
export GOPATH="/Users/a0x55aa/mygo"
export REACT_EDITOR=vim

. /Users/a0x55aa/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
