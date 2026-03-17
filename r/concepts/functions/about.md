# About

Functions were introduced back in the [Basics][concept-basics] Concept, with examples such as this:

```R
squareit <- function(x) {
    x * x
}

squareit(3)
[1] 9

# shorter form
squareit_short <- function(x) x ^ 2
```

Looking more closely at the definition of `squareit`, we can identify various parts:

- The function takes a formal argument `x`.
- There is a function body, usually in braces`{ }`.
- Once the function object is created, it is assigned to a variable `squareit`.

A function is a first class object in R, much like numbers and strings.
Thus, `squareit <- function...` is an assignment syntactically just like `x <- 42`.

~~~~exercism/advanced
Accessing the components of a function is unusual in normal use, but quite easy.

```R
class(squareit)
#> [1] "function"
> formals(squareit)
#> $x

body(squareit)
#> {
#>     x * x
#> }
```

The arguments obtained with [`formals()`][ref-formals] look like a [list][concept-lists], with the `$x` syntax.
In fact, the type is [`pairlist`][ref-pairlist], a particular type of list.

The body is executable code, with the type `language` (*not something you probably need to care about*).

[ref-formals]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/formals
[ref-pairlist]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/list
[concept-lists]: https://exercism.org/tracks/r/concepts/lists
~~~~

## Arguments

R makes no distinction between positional arguments and keyword arguments, in contrast to other scripting languages such as Python and Julia.

Function calls can pass values either positionally or by name.
The latter is useful for complex functions with many arguments, where it is hard to remember their order.

```R
> f <- function(x, y) x / y

# call positionally
> f(4, 2)
[1] 2

# call by name
> f(y = 2, x = 4)
[1] 2
```

Default argument values can be specified in the function definition, after all the arguments without defaults.

```R
g <- function(x, y = 2) x / y
> g(6)
[1] 3
```

To accept an arbitrary number of additional arguments, use a `...` (ellipsis) in the definition.
It is possible to convert any extra values in the function call to a list, but read on for an alternative way to use these "dot args" (called "varargs" in several other languages).

```R
var_f <- function(x, y, ...) {
  print(list(...))
}

var_f(2, 3, "opt1", "opt2")
[[1]]
[1] "opt1"

[[2]]
[1] "opt2"
```

## Function Environment

Previously, we said that the formal arguments and the body are both components of a function.

In fact, there is a third component: the *environment* in which the function is defined.

This can be illustrated with the case of nested functions:

```R
outer_func <- function(x) {
  inner_func <- function(y) {
    x * y
  }
  
  inner_func(3)
}

outer_func(5)
[1] 15
```

The function call passes `x = 5` to the outer function, and this value is available within that function body.

The inner function is *part* of the outer function body, and has access to the value of `x`.
Worded differently, `x = 5` is part of the *environment* of the inner function.

Technically, this is known as a [closure][wiki-closure].

The environment is particularly important with dot args, as any values supplied this way can be passed through to function calls within the outer function body.
The outer function need not know or care what the dot args mean.

```R
f_var <- function(x, ...) {
  sum(x, ...)
}

x <- c(1, 2, NA, 6)

# na.rm defaults to FALSE
f_var(x)
[1] NA

# pass through the na.rm value
> f_var(x, na.rm = TRUE)
[1] 9
```

This technique is used extensively by Tidyverse libraries such as `stringr`.
Many of the `stringr` functions are a user-friendly wrapper around low-level functions from `stringi` and base R.
Extra arguments supplied to the `str_*()` functions are simply passed through to those low-level functions.

## Copy on Modify

xx

## TODO

- default arguments
- named arguments
- scope of variables
- copy-on-modify
- recursion
- pipes



[concept-basics]: https://exercism.org/tracks/r/concepts/basics
