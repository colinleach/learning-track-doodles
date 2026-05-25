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

## Manipulating a tibble

The [Functional Programming][concept-funcprog] Concept discussed the `purrr` library to manipulate vectors and lists (1-D data structures).

For dataframes (whether traditional or tibbles), the corresponding library to use is [`dplyr`][web-dplyr].

We introduced `dplyr` previously, in the [Switch Concept][concept-switch].
That just used a few utility functions, but now we can start to explore the rest of this large library.

### Subsetting

Dataframes, including tibbles, can be treated as lists of column vectors, so list indexing recovers a specified column.

```R
> tbl
# A tibble: 4 × 3
  languages created has.syllabus
  <chr>       <dbl> <lgl>       
1 Fortran      1957 FALSE       
2 R            1993 TRUE        
3 Python       1991 TRUE        
4 Julia        2012 TRUE  

> tbl$created
[1] 1957 1993 1991 2012
```

A dataframe can also be indexed with [matrix-style][concept-matrices-arrays] indexing.

```R
> tbl[c(2, 4), 1:2]
# A tibble: 2 × 2
  languages created
  <chr>       <dbl>
1 R            1993
2 Julia        2012
```

In modern R with the Tidyverse ecosystem, `dplyr` functions are generally more flexible and convenient, and will be the focus for the rest of this Concept.

~~~~exercism/note
Because many (_not all!_) students interested in dataframes have previous experience of Python-Pandas and/or SQL, we will provide examples in those other languages for operations we descibe in R (where appropriate).

Such examples are just a convenience for some students, so _please feel free to ignore them_.
~~~~

### Column-wise operations

Get a single column with [`pull()`][ref-pull] with the name or sequential number (negative numbers to count right-to-left).

```R
> tbl |> pull(created)
[1] 1957 1993 1991 2012
```

This is the same result as `tbl$created`, but using a pipeline-friendly function.

To get multiple columns, the appropriate function is [`select()`][ref-select], which is highly versatile.
Get (or drop) columns based on properties of their name or type.

```R
# Range with position and/or name
> tbl |> select(1:created)
# A tibble: 4 × 2
  languages created
  <chr>       <dbl>
1 Fortran      1957
2 R            1993
3 Python       1991
4 Julia        2012

# Exclude a column
> tbl |> select(!created)
# A tibble: 4 × 2
  languages has.syllabus
  <chr>     <lgl>       
1 Fortran   FALSE       
2 R         TRUE        
3 Python    TRUE        
4 Julia     TRUE        

# Use type of column
> tbl |> select(where(is.numeric))
# A tibble: 4 × 1
  created
    <dbl>
1    1957
2    1993
3    1991
4    2012
```

Multiple criteria are allowed, using Boolean operators `&`, `|` and `!` (and, or not).

Column names that are _valid R identifiers_ do not need quotes within a `select()`.
Invalid names (e.g. those including spaces) can be enclosed in backticks, though renaming them might be better.

The `select()` function can work with a range of helper functions to pick column names: [`starts_with`][ref-starts_with], [`contains`][ref-contains], [`num_range`][ref-num_range] and various others.
[`matches`][ref-matches] allows full [RegEx][concept-regex] matching.
See the [documentation][ref-select] for details.

This seems quite silly with our toy dataframe of languages.
The `starwars` tibble is included with `dplyr`, giving us something bigger to practice with.

```R
# limit display to top 3 rows of non-list columns
starwars |> 
  select(!where(is.list)) |> 
  head(3)
# A tibble: 3 × 11
  name           height  mass hair_color skin_color  eye_color birth_year sex   gender    homeworld species
  <chr>           <int> <dbl> <chr>      <chr>       <chr>          <dbl> <chr> <chr>     <chr>     <chr>  
1 Luke Skywalker    172    77 blond      fair        blue              19 male  masculine Tatooine  Human  
2 C-3PO             167    75 NA         gold        yellow           112 none  masculine Tatooine  Droid  
3 R2-D2              96    32 NA         white, blue red               33 none  masculine Naboo     Droid  

# pick a subset of columns
> starwars |> 
  select(name | ends_with("color")) |> 
  head(5)
# A tibble: 5 × 4
  name           hair_color skin_color  eye_color
  <chr>          <chr>      <chr>       <chr>    
1 Luke Skywalker blond      fair        blue     
2 C-3PO          NA         gold        yellow   
3 R2-D2          NA         white, blue red      
4 Darth Vader    none       white       yellow   
5 Leia Organa    brown      light       brown    
```

### Row-wise operations

~~~~exercism/note
Clearly, `dplyr` provides powerful ways to select columns by name.

Can we do similar things with row names?

_No!_
Traditional R dataframes can have row names, but (after a history of bugs and performance issues) row names are _not allowed_ in `tibbles`.

If you want names, put them in a character column (typically column 1), used like any other column.
Import functions such as [`as.tibble()`][ref-astibble] will create this automatically when importing data with named rows.

If this row-name limitation seems oddly restrictive, remember that most large database systems handle tables the same way: Oracle, SQL Server, PostgreSQL, MySQL...

[ref-astibble]
~~~~

Get rows matching some criteria with [`filter()`][ref-filter], or exclude them with `filter_out()`.

```R
starwars |> 
  select(name:mass) |> 
  filter(between(height, 150, 165) & !is.na(mass))
# A tibble: 4 × 3
  name               height  mass
  <chr>               <int> <dbl>
1 Leia Organa           150    49
2 Beru Whitesun Lars    165    75
3 Nien Nunb             160    68
4 Ben Quadinaros        163    65
```

Filter criteria can be arbitrarily complex, but always based on row contents.

If row numbers are known, we can use a variety of [`slice()`][ref-slice] functions.

```R
starwars |> 
  select(name | homeworld) |> 
  slice(20:25)
# A tibble: 6 × 2
  name             homeworld
  <chr>            <chr>    
1 Palpatine        Naboo    
2 Boba Fett        Kamino   
3 IG-88            NA       
4 Bossk            Trandosha
5 Lando Calrissian Socorro  
6 Lobot            Bespin   

# random sample of rows
> starwars |> 
  select(name | homeworld) |> 
  slice_sample(n = 4)
# A tibble: 4 × 2
  name            homeworld
  <chr>           <chr>    
1 Shaak Ti        Shili    
2 Luminara Unduli Mirial   
3 Grievous        Kalee    
4 Palpatine       Naboo    
```

To remove duplicate rows, use [`distinct()`][ref-distinct].

[web-dataframe]: https://bioinformatics.ccr.cancer.gov/docs/rintro/Lesson_3/
[web-tibble]: https://tibble.tidyverse.org/
[ref-tibbles]: https://tibble.tidyverse.org/reference/index.html
[book-tibble]: https://r4ds.had.co.nz/tibbles.html
[ref-data-table]: https://cran.r-project.org/web/packages/data.table/vignettes/datatable-intro.html
[ref-tibble]: https://tibble.tidyverse.org/reference/tibble.html
[ref-tribble]: https://tibble.tidyverse.org/reference/tribble.html
[ref-pull]: https://dplyr.tidyverse.org/reference/pull.html
[ref-select]: https://dplyr.tidyverse.org/reference/select.html
[ref-relocate]: https://dplyr.tidyverse.org/reference/relocate.html
[concept-switch]: https://exercism.org/tracks/r/concepts/switch
[concept-funcprog]: https://exercism.org/tracks/r/concepts/functional-programming
[concept-matrices-arrays]: https://exercism.org/tracks/r/concepts/matrices-arrays
[concept-strings]: https://exercism.org/tracks/r/concepts/strings
[concept-regex]: https://exercism.org/tracks/r/concepts/regular-expressions
