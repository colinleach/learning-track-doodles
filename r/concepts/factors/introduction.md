# Introduction

In data science, many variables can only take one of a limited set of discrete values: coin flips (head, tails), blood groups (A, B, AB, O), rabbits (male, female), etc.

Also, it may be convenient to simplify continuous variables (such as height) by creating discrete categories (short, medium, tall). This can help with graphical representation (bar or pie charts) and some types of statistical analysis.

Naturally, R has ways to handle this type of data, implemented as `factors`.

```R
> v <- sample(c("H", "T"), 5, replace = TRUE) # 5 coin flips
> v
[1] "H" "H" "T" "T" "H"

> vf <- factor(v) # convert vector to factors
> vf
[1] H H T T H
Levels: H T
```

So it appears that we now have a vector plus a set of `levels`: the allowed values.

How are these represented internally?

```R
> str(v)
 chr [1:5] "H" "H" "T" "T" "H"

> str(vf)
 Factor w/ 2 levels "H","T": 1 1 2 2 1
 ```

 Quite different: the vector stores the values, the factor stores the levels plus the *positional indices* of the levels. 

 Listing the levels is simple.

 ```R
 > levels(vf)
[1] "H" "T"
```

Elements in a factor can be replaced, but only with another valid level.

```R
vf
[1] H H T T H
Levels: H T
> vf[1] <- "T" # no problem
> vf
[1] T H T T H
Levels: H T

> vf[1] <- "X" # bad!
Warning message:
In `[<-.factor`(`*tmp*`, 1, value = "X") :
  invalid factor level, NA generated
> vf
[1] <NA> H    T    T    H   
Levels: H T
```

There is no explicit command to convert a factor back to a vector, but `as.character()` will achieve this if the levels are strings.

```R
> as.character(vf)
[1] NA  "H" "T" "T" "H"
```
