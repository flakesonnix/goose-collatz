# Collatz Conjecture

Computes the number of steps of the Collatz sequence (3n+1) until reaching 1, using recursion.

## Build & Run

```bash
goose build collatz.goose && ./collatz
```

Or directly in the compiler (JIT):

```bash
goose collatz.goose
```

## Expected Output

```
collatz_steps(1)   = 0
collatz_steps(27)  = 111
collatz_steps(100) = 25
```

## Features

- `recursive fn` for recursive Collatz step counting
- Base case: `n == 1` returns 0
- Even case: `1 + collatz_steps(n / 2)`
- Odd case: `1 + collatz_steps(3 * n + 1)`
- No allocation, no heap
