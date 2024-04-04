# C-Inspired Language Features

## Abstract

This language is designed to include some of the type features found in C. Key features include:

1. The ability to represent integers as either hexadecimal or numerical values, and dictate their use in expressions.
2. Allowing allocation of specific byte sizes to integer representations.
3. Checking the validity of expressions.

## Grammar

The language's grammar incorporates C-like features with a focus on compile-time checks and specific type operations.

### Addition Operator

- **Syntax**: `(C +)`
- **Description**: Behaves like the C addition operator, performing checks at compile time.

### Integer Declaration and Initialization

- **Syntax**: `(int a 5)`
- **Description**: The `int` keyword is treated as an operator that checks if its argument is a number. In this example, the integer `a` is initialized with the value `5`.

### Integer Operation

- **Syntax**: `(int b (+ a 5))`
- **Description**: Demonstrates an operation where `b` is declared as an integer and initialized to the result of the addition of `a` and `5`, adhering to C-like addition rules.
