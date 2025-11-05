# Introduction

R makes no distinction between strings and characters, so `"A"` is just a one-character string.

To find the length of a string, use `nchar()`.
Using `length()` will return the length of the vector of strings, typically 1.

```R
> x <- "Some string"
> length(x)
[1] 1
> nchar(x)
[1] 11
````

## Constructing strings

To concatenate several strings we have `paste()`.
The default separator is a space, so override this if necessary.

```R
> paste("Mon", "Tue", "Wed", sep = "")
[1] "MonTueWed"
```

Numbers will be converted to strings as necessary.

There is also `sprintf()`, taken directly from C with identical syntax.
This allows precise formatting of the output string, but at its simplest just use `%s` as a placeholder for the string you want to interpolate.

```R
> sprintf("Hello, %s, nice to see you", "Carol")
[1] "Hello, Carol, nice to see you"
```

## String parts

For a substring whose position is known:

```R
> x <- "Some string"
> substr(x, 3, 6)
[1] "me s"
```

The start and end indices are both inclusive.

To split on some separator, such as space:

```R
> strsplit(x, " ")[[1]]
[1] "Some"   "string"
```

One thing to beware of is that this (like several string functions) returns a `list`. 
If you have not yet unlocked that concept, just add `[[1]]` in double brackets to get the vector in the first element of the list.

## Whitespace

Leading and/or trailing whitespace can be removed with `trimws()`:

```R
> s <- "    messy string   "
> trimws(s)
[1] "messy string"
```

There is a `which = "left"` (or "right") parameter to avoid trimming both ends.
