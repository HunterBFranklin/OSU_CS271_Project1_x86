# ``` Proj1_franklhu: Basic Arithmetic Program```

**Author:** Hunter B. Franklin  
**Course:** CS271 Section 400  
**Project:** Project 1  
**Due Date:** January 25, 2026  

A 32-bit x86 MASM assembly program that performs basic integer arithmetic on two user-supplied values (X and Y). The program prompts for input, validates ordering, then calculates and displays the sum, difference, product, Y−X difference, and integer division with remainder.

## Features

### Core
- Prompts the user to enter two integers, X and Y
- Calculates and displays:
  - `X + Y` (sum)
  - `X - Y` (difference)
  - `X * Y` (product)

### Extra Credit

| # | Feature |
|---|---------|
| EC 1 | After each run, the user can press `q` to quit or any other key to run again |
| EC 2 | Validates that X > Y (descending order); re-prompts on failure |
| EC 3 | Computes and displays `Y - X` (handles negative results via `WriteInt`) |
| EC 4 | Computes and displays `X / Y` showing both quotient and remainder |

## Requirements

- Windows (32-bit or 32-bit compatibility layer)
- [MASM (Microsoft Macro Assembler)](https://docs.microsoft.com/en-us/cpp/assembler/masm/)
- [Irvine32 Library](http://www.asmirvine.com/) — must be installed and linked
- Visual Studio (or any IDE configured for MASM + Irvine32)

## How to Build & Run

1. Open `Proj1_franklhu.asm` in Visual Studio with the Irvine32 project template.
2. Build the project (F7 or **Build → Build Solution**).
3. Run the executable (Ctrl+F5 or **Debug → Start Without Debugging**).

## Notes

- X must be strictly greater than Y. If not, the program will display an error and re-prompt.
- Multiplication uses `MUL` (unsigned), so both inputs should be non-negative for correct results.
- Division uses `DIV` (unsigned); dividing by zero will cause a runtime exception.
- `WriteInt` is used for the Y−X calculation to correctly display negative values.

## File Structure

```
Proj1_franklhu.asm    — Main source file (all logic in a single MASM file)
```

## License

Submitted as coursework for Oregon State University CS271. Not licensed for redistribution.
