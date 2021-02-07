use std::time::Instant;

fn main() {
    println!("Running Single Core Fib(45)...");
    let start = Instant::now();
    fib(45);
    println!("Elapsed: {} ms", start.elapsed().as_millis());
}

fn fib(n : i64) -> i64 {
	if n <= 2 {
		return 1
	} else {
		return fib(n-1) + fib(n-2)
	}
}

