export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PS1="\[\e[1;31m\]\u\[\e[34m\]\$ \[\e[32m\]\t \[\e[35m\]LV$SHLVL \[\e[36m\]\#-\j  \[\e[33m\][\[\e[34m\]\w\[\e[33m\]]\[\e[30m\]\r\n-:>\[\e[0m\] " 


source /usr/local/bin/virtualenvwrapper.sh
export HISTSIZE=10000
set autoexpand

export SVN_EDITOR=/usr/bin/vim

export ANDROID_HOME=/Users/qixi/tools/android-sdk-macosx

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Users/qixi/tools/node-v4.2.6-darwin-x64/bin:/usr/local/share/scala-2.11.7/bin:/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH


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

