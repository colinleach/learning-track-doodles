# Introduction

## Comparison operators

R has a set of operators that is the same as many other languages:

```R
1 == 2 # FALSE
1 != 2 # TRUE
1 < 2 # TRUE
1 > 2 # FALSE
1 <= 2 # TRUE
1 >= 2 # FALSE
```

## Branching

The basic form of an if-else is 

```R
if (x > 10) {
    y <- "big"
} else if (x > 2) {
    y <- "medium"
} else {
    y <- "tiny"
}
```

In this case, parentheses `()` around the boolean and braces `{}` around the statement are both required.

A simple `if` statement can be shortened:

```R
if (x == 0) return("success")
```

A shorter if-else form may be useful:

```R
y <- ifelse(x > 8, "big", "small")
```

`ifelse()` takes exactly three parameters: boolean clause, value if `TRUE`, value if `FALSE`.

The two possible return values must be of the same type (string in the example above).
Mixing numeric and string is likely to cause problems: 

```R
ifelse(x > 8, 10, "small") # numeric or string result? Expect problems!
```

Another option is using the similar `if_else()` function from the `dplyr` package.
At this early stage of the syllabus, you can use them interchangeably, and benefit from `if_else` giving better error messages than the older `ifelse`.
Other differences will be discussed in future concepts.

```R
library(dplyr) # may give warnings, not shown here (ignore for now)

x <- 10
if_else(x > 8, "big", "small")
#> [1] "big"
```
