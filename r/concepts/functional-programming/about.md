# About

What is functional programming?

## Pipes

The use of pipes `|>` to connect functions will be discussed in more detail in other parts of the syllabus.

For now, it is useful to know that:

- A result from the left of the pipe becomes the first argument in the function to the right (where "right" ignores optional line breaks).
- Any remaining arguments can be included in the function call.
- In R, we must pipe to a function _call_, not just a _name_, so parentheses are always required (_this differs from some other languages_).

The example below illustrates the syntax.
Individual functions will be discussed later.

```R
library(stringr)

"Monday-25-February" |> 
  str_split("-") |>     
  unlist() |>               # [1] "Monday"   "25"       "February"
  str_sub(1, 3) |>          # [1] "Mon" "25"  "Feb"
  str_to_upper() |>         # [1] "MON" "25"  "FEB"
  str_flatten(collapse = ", ")
#> [1] "MON, 25, FEB"
```

## Apply functions

We saw previously that many functions in R are "vectorized": they will operate across entire vectors, with no need to write explicit loops. 

Functions using only vectorized functions are themselves likely to be automatically vectorized.
In a trivial example:

```R
> triple <- function(x) return(3 * x)
> triple(1:10)
 [1]  3  6  9 12 15 18 21 24 27 30
 ```

However, more complex functions may not accept vector input, for example if they contain loops or if-else blocks.

We need a more general way to apply functions to vectors (similar to `map()` in some other languages).

Because R has a rich variety of data structures in the base language, it also has a whole family of `*apply()` functions to operate on them.

For now, consider `lapply()` and `sapply()`.

### `lapply()`

"List-apply" is designed to work on list inputs, but vectors will be silently coerced to lists as necessary.

The output is a list, so this may need unpacking to get a vector:

```R
h <- function(size) {
    switch(size,
           "small" = 6,
           "medium" = 8,
           "large" = 10
    )
}

> v <- c("small", "large", "medium")

> h(v) # bad use of an unvectorized function
Error in switch(size, small = 6, medium = 8, large = 10) : 
  EXPR must be a length 1 vector

> lapply(v, h)  # output is a list
[[1]]
[1] 6

[[2]]
[1] 10

[[3]]
[1] 8

> lapply(v, h) |> unlist() # output is a vector
[1]  6 10  8
```

Students familiar with the [Switch Concept][concept-switch] may notice that we could alternatively replace scalar `switch` with vectorized [`recode_values()`][ref-recode_values] from the [`dplyr`][ref-dplyr] library.

```R
library(dplyr)

h <- function(size) {
  recode_values(size,
         "small" ~ 6,
         "medium" ~ 8,
         "large" ~ 10
  )
}

v <- c("small", "large", "medium")
h(v)
#> [1]  6 10  8
```

### `sapply()`

"Simplified-apply" will do something similar, but in this case returns a named vector.
Depending on context, use of `unname()` may be necessary:

```R
> sapply(v, h)
 small  large medium 
     6     10      8 

> sapply(v, h) |> unname()
[1]  6 10  8
```

## The `purrr` library

`lapply` and `sapply` are simple, familiar to most R users, and still quite popular for vectors and simple lists.

Base R also has several other apply functions:

- `vapply()`is similar to `sapply()` but also has a required parameter to specify the output format.
- `apply()` for matrices and higher-dimensional arrays.
- `mapply()` for multiple list or vector arguments in parallel.
- `tapply()` is harder to explain, but works with grouping operations and ragged arrays.
- `vectorize()` is a rather mysterious function, which appears to be a wrapper for `mapply()`.

_Enough, already!_

Providing a simpler and more consistent replacement for this sort of confusion is a key goal of the Tidyverse.

There is now the `purrr` package, which provides several additional options such as `map()`, while improving consistency in design, and clarity in error messages.

Less constrained by backwards compatibility than base R, this package is currently closer to modern functional programming in other languages.

***TODO*** : purrr examples

## Recursion

Most functional languages use recursion as their preferred alternative to loops.

R has other and often better options: vectorized functions and higher-order functions.

However, recursion is supported in R, and can be useful in contexts such as traversing tree structures.

The maximum recursion depth defaults to 5000, which is relatively generous (Python defaults to 1000).
It is possible to override the default.

Tail-call optimization is not standard in R, though some workarounds have been developed.
