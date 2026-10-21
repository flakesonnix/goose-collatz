// Unit test: Collatz Conjecture (recursive)
// Checks known step counts of the Collatz sequence.

recursive fn collatz_steps(n: i64) -> i64 {
    if n == 1 { return 0; }
    if n % 2 == 0 {
        return 1 + collatz_steps(n / 2);
    } else {
        return 1 + collatz_steps(3 * n + 1);
    }
}

fn main() {
    assert(collatz_steps(1) == 0);
    assert(collatz_steps(2) == 1);
    assert(collatz_steps(3) == 7);
    assert(collatz_steps(4) == 2);
    assert(collatz_steps(5) == 5);
    assert(collatz_steps(6) == 8);
    assert(collatz_steps(7) == 16);
    assert(collatz_steps(8) == 3);
    assert(collatz_steps(9) == 19);
    assert(collatz_steps(10) == 6);
    assert(collatz_steps(27) == 111);
    assert(collatz_steps(100) == 25);
    print("collatz unit tests passed");
}
