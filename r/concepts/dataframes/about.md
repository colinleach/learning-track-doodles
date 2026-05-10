# About

In other parts of the syllabus, we have seen various data types with different characteristics.

- Atomic [vectors][concept-vectors] are 1-dimensional and homogenous in type.
- [Lists][concept-lists] are 1-dimensional and elements can be of heterogenous types.
- [Matrices and arrays] are multi-dimensional and homogeneous.

This Concept will look at ways to store multi-dimensional, heterogenous data.
In practice, _most_ real-world data is like this, so we are now getting to the heart of how R is (mostly) used in practice.

## Dataframe variants

Over the decades, R has added multiple data types to handle tabular data.

This syllabus will focus mainly on tibbles, but it is useful to know about some alternatives.

### The `data.frame`

In Base R, a [`data.frame`][web-dataframe] is a `list` of equal-length `vectors`.
This can be thought of as a rectangular table of data, in which each column is homogeneous, but each row can (and usually does) contain different types of data.

An example to illustrate this:

```R
# create the column vectors
languages <- c("Fortran", "R", "Python", "Julia")
created <- c(1957, 1993, 1991, 2012)
has.syllabus <- c(FALSE, TRUE, TRUE, TRUE)

# join columns to create the dataframe
df <- data.frame(languages, created, has.syllabus)
df
  languages created has.syllabus
1   Fortran    1957        FALSE
2         R    1993         TRUE
3    Python    1991         TRUE
4     Julia    2012         TRUE
# look at the structure
str(df)
'data.frame':	4 obs. of  3 variables:
 $ languages   : chr  "Fortran" "R" "Python" "Julia"
 $ created     : num  1957 1993 1991 2012
 $ has.syllabus: logi  FALSE TRUE TRUE TRUE
 ```

 We have a column of character strings, a column of numbers and a column of booleans.
 Scaled up, this is an intuitive way to represent many collections of real world data.

### The `tibble`

The `data.frame` design is _old_.

Multi-decade experience, plus changing patterns of how R is used, led to a redesign to create a modernized alternative in the Tidyverse: [tibbles][web-tibble].

Compared to Base R, tibbles have:

- Different defaults, to reduce common problems.
- Less willingness to coerce data types during input.
- More and clearer error messages.
- Different, usually better, display formats.

In short, a `tibble` aims to "do less and complain more", also described as "lazy and surly".

However, the types are interchangeable: any function which accepts a `data.frame` will also accept a `tibble`, and _vice versa_.

For new work, using tibbles will probably help you create more robust code.
However, legacy code and legacy data is very plentiful in the R world, so the `data.frame` is likely to remain common for a long time.

```R
# column vectors are same as for data.frame
library(tibble)
tbl <- tibble(languages, created, has.syllabus)
tbl
# A tibble: 4 × 3
  languages created has.syllabus
  <chr>       <dbl> <lgl>       
1 Fortran      1957 FALSE       
2 R            1993 TRUE        
3 Python       1991 TRUE        
4 Julia        2012 TRUE      
  
str(tbl)
tibble [4 × 3] (S3: tbl_df/tbl/data.frame)
 $ languages   : chr [1:4] "Fortran" "R" "Python" "Julia"
 $ created     : num [1:4] 1957 1993 1991 2012
 $ has.syllabus: logi [1:4] FALSE TRUE TRUE TRUE
```

Note the default print format: the comment line with dimensions is printed automatically, and column types are also displayed.

### The `data.table`

Tibbles are one relatively recent evolution of the original `data.frame`, fully integrated into the Tidyverse packages and available in the Exercism test runner.

Separately, [`data.table`][ref-data-table] is an alternative attempt to improve on the `data.frame`, in a third-party package.

Both are well-respected, and there is inevitably much argument about which is "better".
Maybe there is some degree of consensus around the following points (_even if they will be criticized as simplistic_).

- `tibble` is optimized mainly for ease of use, and integration with the Tidyverse ecosystem.
- `data.table` is optimized mainly for raw power and scalability, especially when working with very large datasets.

In any case, `data.table` is not available within Exercism, so it is mentioned here just for completeness.

## Working with tibbles

Tibbles are a core part of the Tidyverse, so add them with either `library(tibble)` or `library(tidyverse)`.

Documentation is fairly extensive, in the Tidyverse style:

- A [website][web-tibble].
- A [function reference][ref-tibbles].
- A [chapter][book-tibble] in R for Data Science.

### Creating a tibble

Most simply, we can use the [`tibble()`][ref-tibble] function to join column vectors, as for `data.frame()`.
An example of this was shown in a previous section.

If it is more convenient to enter values row-wise, the corresponding function is [`tribble()`][ref-tribble].

```R

```

In practice, there are dozens of ways to create tibbles, as they are the ddefault output format from a diverse variety of Tidyverse functions.
We will return to this in a future Concept.

### Manipulating a tibble

The [Functional Programming][concept-funcprog] Concept discussed the `purrr` library to manipulate vectors and lists (1-D data structures).

For dataframes (whether traditional or tibbles), the corresponding library to use is [`dplyr`][web-dplyr].

We introduced `dplyr` previously, in the [Switch Concept][concept-switch].
That just used a few utility functions, but now we can start to explore the rest of this large library.




[web-dataframe]: https://bioinformatics.ccr.cancer.gov/docs/rintro/Lesson_3/
[web-tibble]: https://tibble.tidyverse.org/
[ref-tibbles]: https://tibble.tidyverse.org/reference/index.html
[book-tibble]: https://r4ds.had.co.nz/tibbles.html
[ref-data-table]: https://cran.r-project.org/web/packages/data.table/vignettes/datatable-intro.html
[ref-tibble]
