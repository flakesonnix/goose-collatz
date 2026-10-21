// collatz.goose — Collatz step count (3n+1 problem, recursive)

recursive fn collatz_steps(n: i64) -> i64 {
    if n == 1 { return 0; }
    if n % 2 == 0 {
        return 1 + collatz_steps(n / 2);
    } else {
        return 1 + collatz_steps(3 * n + 1);
    }
}

fn main() {
    print("collatz_steps(1)   = ", collatz_steps(1));
    print("collatz_steps(27)  = ", collatz_steps(27));
    print("collatz_steps(100) = ", collatz_steps(100));
}
