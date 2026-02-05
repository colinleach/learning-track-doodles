# About

## Introduction

A string is a piece of text between quotes.

```R
mystring <- "some text"
> mystring
[1] "some text"
> typeof(mystring)
[1] "character"
```

Unfortunately, the terminology may be confusing to programmers familiar with other languages.

Although the `type` is `character`, R makes no distinction between a single letter (called `char` in several other languages, but not R) and a long string.
Both are a single item, and can be in single `' '` or double `" "` quotes interchangeably.

The style guide recommends using double quotes, except when you want to use double quotes within the string without escaping them.

```R
str2 <- 'String with "quotes"'  # convenience format
> str2
[1] "String with \"quotes\""    # standard format
```

A `character vector` is thus a vector of strings, with each string as a single element.

```R
s <- c("some", "strings")
> s
[1] "some"    "strings"
> length(s)
[1] 2
length(s[1])  # equivalent to length("some") : the number of vector elements, not the string length
[1] 1
```

In the above example, `length(s[1])` is equivalent to `length("some")`: the number of _vector elements_, not the _string length_.

Manipulating an individual string is obviously possible, but needs particular functions that will be discussed below.

### Escaping

As we saw above, some punctuation characters need to be "escaped" by being preceeded with backslash `\`.

The list will be no surprise to most experienced programmers, as this topic is fairly well standardized across languages.

As well as quotes (as shown above), the list includes newlines `\n`, tabs `\t`, backslash `\\`, and Unicode symbols beginning with `\U` or `\u`.

To avoid using lots of escape characters, it is possible to define raw strings within `r"( )"`:

```R
r"(raw "string")"
[1] "raw \"string\""
```

For raw strings containing parentheses `( )`, there are many other syntax options.

### Locales

Any currently-supported version of R encodes strings in UTF-8, so most world languages can be supported.

```R
"आधुनिक मानक हिन्दी"
[1] "आधुनिक मानक हिन्दी"
```

Additionally, many R functions are aware of [`locale`][wiki-locale], and try to follow local conventions for string sorting, conversion to upper/lower case, dates and times, etc.

This syllabus will show examples only for US English: both because this is a common default, and because the syllabus authors hapen to be US-resident.

Locales are a complex topic, so please search for documentation on your own situation.


## String functions

Most things are possible in base R, but many programmers support for string manipulation rather limited and confusing.
Fortunately, there are `tidyverse` packages that are much more intuitive and flexible.

### Base R



____

See [this thread](https://forum.exercism.org/t/is-it-possible-to-use-a-dependency-library-module/4218/10) plus various reverted PRs on the [test runner](https://github.com/exercism/r-test-runner/pulls?q=is%3Apr+is%3Aclosed) repo.