#!/usr/bin/env python
# coding: utf-8
from __future__ import print_function

import os
import sys
import hashlib
import sqlite3
from datetime import datetime


conn = sqlite3.connect('accounts.db')


# TODO: 添加email,,搜索字段，不全显示


def generate_password(host, username, salt):
    s = hashlib.sha1(host+username+salt).hexdigest()
    return hashlib.md5(s+salt).hexdigest()


def get_password(id_):
    c = conn.cursor()
    c.execute("SELECT host, username FROM accounts WHERE id=?", str(id_))
    r = c.fetchone()
    if not r:
        print("没有这个记录")
        return
    host, username = r

    c.execute("SELECT salt FROM salt")
    salt = c.fetchone()
    if not salt:
        print("没有salt")
        return
    salt = salt[0]

    pwd = generate_password(host, username, salt)
    os.system('printf "{}" | pbcopy'.format(pwd))


def get_list(word):
    c = conn.cursor()
    if word:
        r = c.execute("SELECT * FROM accounts WHERE host like ?", ("%{}%".format(word), ))
    else:
        r = c.execute("SELECT * FROM accounts")

    print()
    for row in r:
        for i in row:
            print(i, end='\t')
        print()


def init():
    conn.execute('''CREATE TABLE accounts
        (id INTEGER PRIMARY KEY, host text, username text, desc text, datetime text)''')
    conn.execute('''CREATE TABLE salt (salt text)''')
    conn.commit()


def add_salt(salt):
    c = conn.cursor()
    c.execute('INSERT INTO salt VALUES (?)', (salt, ))
    conn.commit()
    print("添加成功 ")


def add_record(host, username, desc):
    c = conn.cursor()

    c.execute('INSERT INTO accounts(host, username, desc, datetime) VALUES (?,?,?,?)',
              (host.decode('utf-8'), username.decode('utf-8'), desc.decode('utf-8'), str(datetime.now())))
    conn.commit()

    c.execute("SELECT salt FROM salt")
    salt = c.fetchone()
    if not salt:
        print("没有salt")
        return
    salt = salt[0]

    pwd = generate_password(host, username, salt)
    os.system('printf "{}" | pbcopy'.format(pwd))


def del_record(id_):
    s = raw_input('确定删除吗?(y)')
    if s == 'y':
        c = conn.cursor()
        c.execute('DELETE FROM accounts WHERE id=?', (id_, ))
        conn.commit()
        print("删除成功")
    else:
        print("删除取消")


def help_txt():
    print("init: \t 初始化表结构")
    print("list [word]: \t 显示所有列表, 带world搜索")
    print("del id: \t 删除一条记录")
    print("salt string: \t 添加salt")
    print("id 数字: \t 查询密码")
    print("add host username desc: \t 添加一条密码")


if __name__ == '__main__':
    if len(sys.argv) > 1:
        if sys.argv[1] == 'init':
            init()
        elif sys.argv[1] == 'list':
            word = sys.argv[2] if len(sys.argv) > 2 else None
            get_list(word)
        elif sys.argv[1].isdigit():
            get_password(int(sys.argv[1]))
        elif sys.argv[1] == 'salt':
            add_salt(sys.argv[2])
        elif sys.argv[1] == 'del':
            del_record(int(sys.argv[2]))
        elif sys.argv[1] == 'add':
            _, _, host, username, desc = sys.argv
            add_record(host, username, desc)
        else:
            help_txt()
    else:
        help_txt()
