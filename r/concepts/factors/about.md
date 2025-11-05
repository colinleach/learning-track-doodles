# About

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

Listing the levels is simple.

 ```R
 > levels(vf)
[1] "H" "T"
```

If you know all the allowed levels in advance, it may be worth specifying them instead of relying on R to guess from the input data.

```R
> grades <- c("B", "A", "C", "F")
> grades_factor <- factor(grades, levels = LETTERS[1:6])
> grades_factor
[1] B A C F
Levels: A B C D E F
```

If the levels have a meaningful order, there is the `ordered()` function to preserve this.

```R
> ordered(c("short", "tall"), levels = c("short", "medium", "tall"))
[1] short tall 
Levels: short < medium < tall
```

## Structure of factors

How are these represented internally?

```R
> str(v)
 chr [1:5] "H" "H" "T" "T" "H"

> str(vf)
 Factor w/ 2 levels "H","T": 1 1 2 2 1
 ```

 Quite different: the vector stores the values, the factor stores the levels plus the *positional indices* of the levels. For large datasets, this can be a substantial saving on memory.

### Modifying factors

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

Conversion to a list uses `split()`, giving an entry for each level and a vector of positional indices.

```R
> split(1:5, vf)
$H
[1] 1 2 5

$T
[1] 3 4
```

## Avoiding factors (advanced topic)

This section looks ahead to concepts such as `dataframes`. 
It will be relevant to note that several common R functions such as `read.csv()` and `data.frame()` automatically convert character vectors to factors.

This is not always desired, so these functions allow a `stringsAsFactors = FALSE` argument to override the default.

The Tidyverse packages invert the default, with conversion to factors never automatic.
Deliberate conversion can be done with the `forcats` package (outside Exercism).

