# About

The boolean values in R are `TRUE` and `FALSE`.

Boolean operators:

```R
!TRUE # FALSE (not)
TRUE && FALSE # FALSE (scalar and)
TRUE || FALSE # TRUE (scalar or)

TRUE & FALSE # FALSE (vector and)
TRUE | FALSE # TRUE (vector or)
```

Note that there are two sets of and/or operators.
The double-character versions operate on single values.
The single-character variants operate element-wise on vectors, returning a vector of booleans.

Using `&&` or `||` on vectors means that only fhe first element is used in the comparison, yielding a single `TRUE`/`FALSE` and probably a warning message.

This distinction will become important, and probably clearer, in the [`vector-filtering`][concept-vector-filtering] concept.

There is no infix operator for [exclusive or][wiki-xor] (i.e. A OR B, but not both). The [`xor()`][ref-xor] function can be used in this case.

```r
xor(TRUE, FALSE)
#> [1] TRUE
xor(TRUE, TRUE)
#> [1] FALSE
```

[wiki-xor]: https://en.wikipedia.org/wiki/Exclusive_or
[ref-xor]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/Logic.html
[concept-vector-filtering]: https://exercism.org/tracks/r/concepts/vector-filtering
