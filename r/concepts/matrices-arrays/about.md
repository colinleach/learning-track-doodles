# About

When handling collections of homegeneous atomic data (e.g. all numeric or all character), the following structures are available in R:
- `vector` for 1-dimensional data, accessed with a single index
- `matrix` for 2-dimensional, rectangular (not ragged) data
- `array` for the general N-dimensional case. A `matrix` is just an `array` with N=2.

**Note for Python programmers**: This section may look familiar. Any resemblance to NumPy is not coincidental (but R is older, and has all this in the core language).

## Matrices

This is essentially just a vector plus row and column counts.

There is a `matrix()` function to create them:

```R
# data already available 
> matrix(1:6, nrow=2, ncol=3)
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6

# empty matrix to be filled in later
> matrix(nrow=2, ncol=3)
     [,1] [,2] [,3]
[1,]   NA   NA   NA
[2,]   NA   NA   NA
```

Note that the data is stored in column-major order (i.e. down then across).

Find the dimensions of a matrix with `dim()` for both rows and columns, `nrow()` or `ncol()` to get one. 
Using `length()` will just return the length of the underlying vector (6 in the example above).

## Matrix indexing

This works in all the same ways as vector indexing, except for the need to specify row(s) and column(s), in that order.
Leave a dimension empty to get the entire row/column.

Using the same matrix as above:

```R
> m <- matrix(1:6, nrow=2, ncol=3)
> m
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6

> m[2, 3]
[1] 6

> m[1:2, 3]
[1] 5 6

>  m[2, ]  # all of row 2
[1] 2 4 6
```

## Adding and deleting rows/columns

With vectors, the `c()` function was sufficient to insert and append data. 
Matrices have more structure so need more care in specifying what is required.

The `rbind()` and `cbind()` functions bind new row(s) or column(s) to the matrix.

## Filtering and functions

All the vector techniques will also work on matrices, applied across all elements. 
However, they may lose the matrix structure and return a vector.

```R
> sqrt(m)
         [,1]     [,2]     [,3]
[1,] 1.000000 1.732051 2.236068
[2,] 1.414214 2.000000 2.449490

> sum(m)
[1] 21

> m[m > 3]
[1] 4 5 6
```

## The `apply()` function

For finer control


## Linear algebra

*This sub-section assumes a level of mathematical knowledge outside the scope of Exercism.*

Please skip it if it makes no sense to you. However, R is a data science language and many users have a background in applied mathematics and statistics, so it may be of interest.

----

A full range of linear algebra operations are available. 
