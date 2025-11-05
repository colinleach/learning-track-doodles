# About

In R, a dataframe is a `list` of equal-length `vectors`. 
This can be thought of as a rectangular table of data, in which each column is homogeneous but each row can and usually does contain different types of data.

An example to illustrate this:

```R
# create the column vectors
> languages <- c("Fortran", "R", "Python", "Julia")
> created <- c(1957, 1993, 1991, 2012)
> has.syllabus <- c(FALSE, FALSE, TRUE, FALSE)

# join columns to create the dataframe
> df <- data.frame(languages, created, has.syllabus)
> df
  languages created has.syllabus
1   Fortran    1957        FALSE
2         R    1993        FALSE
3    Python    1991         TRUE
4     Julia    2012        FALSE

# look at the structure
> str(df)
'data.frame':	4 obs. of  3 variables:
 $ languages   : chr  "Fortran" "R" "Python" "Julia"
 $ created     : num  1957 1993 1991 2012
 $ has.syllabus: logi  FALSE FALSE TRUE FALSE
 ```

 We have a column of character strings, a column of numbers and a column of booleans. 
 Scaled up, this is an intuitive way to represent many collections of real world data.



