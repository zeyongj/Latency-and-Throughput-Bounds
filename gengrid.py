#!/usr/bin/python

import random
import sys

if len(sys.argv) != 3:
    print("Usage:  %s rows cols" % sys.argv[0]); sys.exit(1)
try:
    N = int(sys.argv[1])
    if N <= 0:
        raise Exc()
except:
    print("Error:  rows must be a positive integer."); sys.exit(1)
try:
    M = int(sys.argv[2])
    if M <= 0:
        raise Exc()
except:
    print("Error:  cols must be a positive integer."); sys.exit(1)

print N, M
for i in range(N):
    l = []
    for j in range(M):
        l.append("%2d" % (round(random.randint(5,135) ** .5) + 56))
    print(" ".join(l))

