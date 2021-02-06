#!/usr/bin/python
import time

def fib(n):
    return 1 if n <= 2 else fib(n-1) + fib(n-2)

cnt = 0

print 'Calculating Fib(40)...'

while 1:
    t = time.time()
    fib(40)
    cnt += 1
    print 'Iteration', cnt, ':', time.time()-t, 'Seconds'
