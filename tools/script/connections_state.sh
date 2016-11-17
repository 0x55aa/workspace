# TCP连接状态详解：


# LISTEN：侦听来自远方的TCP端口的连接请求
# SYN-SENT：在发送连接请求后等待匹配的连接请求
# SYN-RECEIVED：在收到和发送一个连接请求后等待对方对连接请求的确认
# ESTABLISHED：代表一个打开的连接
# FIN-WAIT-1：等待远程TCP连接中断请求，或先前的连接中断请求的确认
# FIN-WAIT-2：从远程TCP等待连接中断请求
# CLOSE-WAIT：等待从本地用户发来的连接中断请求
# CLOSING：等待远程TCP对连接中断的确认
# LAST-ACK：等待原来的发向远程TCP的连接中断请求的确认
# TIME-WAIT：等待足够的时间以确保远程TCP接收到连接中断请求的确认
# CLOSED：没有任何连接状态

# TIME_WAIT：   等待足够的时间以确保远程TCP接收到连接中断请求的确认
# FIN_WAIT1：   等待远程TCP连接中断请求，或先前的连接中断请求的确认
# FIN_WAIT2：   从远程TCP等待连接中断请求
# ESTABLISHED： 代表一个打开的连接
# SYN_RECEIVED：再收到和发送一个连接请求后等待对方对连接请求的确认
# CLOSING：     等待远程TCP对连接中断的确认
# LAST_ACK：    等待原来的发向远程TCP的连接中断请求的确认
# LISTEN：      侦听来自远方的TCP端口的连接请求
# SYN_SENT：    再发送连接请求后等待匹配的连接请求
# CLOSE-WAIT：  等待从本地用户发来的连接中断请求
# CLOSED：      没有任何连接状态
# SYN_RECV表示正在等待处理的请求数；
# ESTABLISHED表示正常数据传输状态；
# TIME_WAIT表示处理完毕，等待超时结束的请求数。


echo 'TCP连接状态统计：'
netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}' 
echo 'TCP连接状态统计：'
netstat -ant | awk '{++S[$NF]} END {for(a in S) print a, S[a]}'

echo 'TCP连接配置：'
cat /etc/sysctl.conf | grep 'ip_conntrack_'
cat /etc/sysctl.conf | grep 'tcp_max_syn_backlog'
cat /etc/sysctl.conf | grep 'tcp_synack_retries'
cat /etc/sysctl.conf | grep 'ip_conntrack_tcp_timeout_syn_recv'

# SYN_REC 小于5，大于可能dos攻击
# netstat -n -p|grep SYN_REC | wc -l
# netstat -n -p | grep SYN_REC | sort -u
# netstat -n -p | grep SYN_REC | awk '{print $5}' | awk -F: '{print $1}'
# netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n
