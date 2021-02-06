package main

import (
	"fmt"
	"os"
	"runtime"
	"strconv"
	"time"
)

func fib(n int) int {
	if n <= 2 {
		return 1
	} else {
		return fib(n-1) + fib(n-2)
	}
}

func par_fib(n int, disturbers int) int {
	for i := 0; i < disturbers; i++ {
		go fib(n)
	}
	return fib(n)
}

func main() {
	max_thread := runtime.NumCPU()
	args := os.Args
	n := 45
	if len(args) > 1 {
		new_n, err := strconv.ParseInt(args[1], 10, 0)
		if err != nil {
			panic("expect int")
		}
		n = int(new_n)
	}
	fmt.Printf("\n Single Core & Multi-CPU Degradation Tester -- Fib(%v) -- Max %v Threads\n\n", n, max_thread)
	t := time.Now()
	step := 1
	for cores := 1; cores <= max_thread; cores += step {
		fmt.Printf(" %v CPU: ", cores)
		par_fib(n, cores-1)
		fmt.Printf("Calculated in %v\n", time.Since(t))
		if cores >= 16 {
			step = 4
		} else if cores >= 4 {
			step = 2
		}
		t = time.Now()
	}
}
