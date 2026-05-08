# About

When handling collections of homegeneous atomic data (e.g. all numeric or all character), the following structures are available in R:

- `vector` for 1-dimensional data, accessed with a single index
- `matrix` for 2-dimensional, rectangular (not ragged) data
- `array` for the general N-dimensional case. A `matrix` is just an `array` with N=2.

~~~~exercism/note
**For Python programmers**: This section may look familiar. 

Any resemblance to NumPy is not coincidental (but R is older, and has all this in the core language).
~~~~

## Matrices

A matrix is essentially just a vector plus row and column counts.

There is a [`matrix()`][ref-matrix] function to create them:

```R
# data already available 
matrix(1:6, nrow=2, ncol=3)
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6

# empty matrix to be filled in later
matrix(nrow=2, ncol=3)
     [,1] [,2] [,3]
[1,]   NA   NA   NA
[2,]   NA   NA   NA
```

Note that the data is stored in column-major order (i.e. down then across).

Find the dimensions of a matrix with [`dim()`][ref-dim] for both rows and columns, [`nrow()`][ref-nrow] or [`ncol()`][ref-nrow] to get one dimension.
Using [`length()`][ref-length] will just return the length of the underlying vector (6 in the example above).

## Matrix indexing

This works in all the same ways as vector indexing, except for the need to specify row(s) and column(s), in that order.
Leave a dimension empty to get the entire row/column.

Using the same matrix as above:

```R
m <- matrix(1:6, nrow=2, ncol=3)
m
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6

m[2, 3]    # row 2, col 3
[1] 6

m[1:2, 3]  # rows 1:2, col 3
[1] 5 6

 m[2, ]    # all of row 2
[1] 2 4 6
```

Note that a subset with a single row and/or column will be returned as a vector, not a matrix.

```R
class(m)
[1] "matrix" "array" 
class(m[2,])
[1] "integer"
```

This type of `dimension reduction` is not always wanted, especially in a function pipeline that expects matrix inputs.

Specifying `drop=FALSE` will guarantee a matrix return value from matrix input.

```R
m[2, , drop = FALSE]
     [,1] [,2] [,3]
[1,]    2    4    6
```

## Adding and deleting rows/columns

With vectors, the [`c()`][ref-c] function was sufficient to insert and append data. 
Matrices have more structure so need more care in specifying what is required.

The [`rbind()`][ref-cbind] and [`cbind()`][ref-cbind] functions bind new row(s) or column(s) to the matrix.

```R
m
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6
m2 <- matrix(7:9, nrow = 1, ncol = 3)
rbind(m, m2)
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6
[3,]    7    8    9
```

## Filtering and functions

All the vector functions will also work on matrices, applied across all elements.
However, they may lose the matrix structure and return a vector.

```R
sqrt(m)
         [,1]     [,2]     [,3]
[1,] 1.000000 1.732051 2.236068
[2,] 1.414214 2.000000 2.449490

sum(m)
[1] 21

m[m > 3]
[1] 4 5 6
```

For matrices, the [`colSums()`][ref-colsums] and [`rowSums()`][ref-colsums] functions may also be useful.

Dimension reduction is intended in this case, so the return values are vectors.

```R
# m as defined above
rowSums(m)
[1]  9 12
colSums(m)
[1]  3  7 11
```

Similarly, there are `rowMeans()` and `colMeans()` functions for calculating averages.

## General functions operating on matrices

In other concepts, we have seen that Tidyverse libraries can simplify operations on vectors and lists ([`purrr`][concept-functional-progamming]) or dataframes ([`dplyr`][concept-dataframes]).

However, matrices and arrays are mostly out of scope for Tidyverse inputs (at least for now).

The [`apply()`][ref-apply] function is part of Base R, and still the best tool for finer control over matrix programming.

The parameters, in order, are:

1. The input matrix.
2. The dimesion to operate on (1 for rows, 2 for columns).
3. The function to apply.
4. Optionally, any extra parameters for the function.

The [`rowMeans()`][ref-rowmeans] function exists in Base R, but we could also simulate it with `apply()`.

```R
randm <- matrix(sample(1:10, 16, replace = TRUE), 4, 4)
randm
     [,1] [,2] [,3] [,4]
[1,]    4    9    8    3
[2,]    6    8    5    5
[3,]    4    2    1    2
[4,]    4    2    5    4

apply(randm, 1, mean)
[1] 6.00 6.00 2.25 3.75

rowMeans(randm)
[1] 6.00 6.00 2.25 3.75
```

## Linear algebra

~~~~exercism/note
*This sub-section assumes a level of mathematical knowledge outside the scope of Exercism.*

Please skip it if it makes no sense to you.

However, R is a data science language, and many users have a background in applied mathematics and statistics, so it may be of interest.
~~~~

Modern R is "obviously" a data science language: designed to work mainly with data tables, and popular with users such as statisticians, epidemiologists and social scientists.
The main competitor in this field is the Python scientific stack, including packages such as Pandas or Polars.

However, in earlier decades R was also seen as a potential engineering language, competing directly with Matlab.

Perhaps surprisingly, Base R still supports a full range of linear algebra operations on vectors and matrices.
It is not clear how much these are now used by end users, but such techniques remain very important internally.

LinAlg in R is still taught in some college courses, such as this [econometrics class][web-econ407].

[ref-dim]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/dim
[ref-nrow]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/nrow
[ref-length]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/length
[ref-c]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/c
[ref-cbind]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/cbind
[ref-colsums]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/colSums
[web-econ407]: https://econ.pages.code.wm.edu/407/notes/docs/R_linalg.html
