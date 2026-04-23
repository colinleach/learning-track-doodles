# About

_"Dates and times are something we teach to young children. How hard can it be?"_

Many programmers have made that mistake, and the subsequent experience tends to have a bad effect on their health and happiness. 

Anyone doing non-trivial programming with dates and times should at least be prepared to understand and mitigate potential problems.

This document will attempt to give an overview of how R handles dates and times, but consulting the full documentation will be necessary for further details.

As a data science language, dates and times have a particular importance in R.
So much of the data arrives in the form of time series: daily patient numbers during a disease outbreak, monthly employment figures reported by goverments, bird populations in a nesting colony, annual GDP for major economies, and endless more examples.

_Does this mean that R makes data and time handling simple?_

Sadly, no!

Date and time functionality in Base R has a poor reputation and is now rarely used.

The [`lubridate`][ref-lubridate] package is a big improvement, but be prepared for a large and complicated library, designed to handle a large and complicated range of problems.

Originally independent, `lubridate` is now bundled with the `tidyverse` collection.
Load it with either `library(lubridate)` or `library(tidyverse)`.

Resources to help you work with `lubridate` include:

- A [reference page][ref-lubridate].
- A [cheatsheet][cheat-lubridate] in PDF format.
- a [chapter][book-dates-times] in R for Data Science.

## Dates and Datetimes

A `date` is just a day, with no time information.

Internally, dates are stored as the (signed) number of days since `1970-01-01`.

```R
> today()
[1] "2026-04-22"
> typeof(today())  # just a number
[1] "double"
> class(today())  # the class understands how to interpret the raw number
[1] "Date"
```

A `datetime` combines date, time and timezone information.

Internally, it is stored as the number of seconds since the beginning 0f 1970 in the UTC timezone.

```R
> now()
[1] "2026-04-22 15:37:11 MST"  # mid-afternoon in Arizona
> typeof(now())
[1] "double"  # again, just a number
# POSIX datetimes are built into most operating systems as standard
> class(now())
[1] "POSIXct" "POSIXt"
```

Parhaps surprisingly, R has no internal representation for time-only values.
Anyone needing this functionality (outside Exercism) can install the [`hms`][ref-hms] package.

## Working with `date` and `datetime` values

Perhaps the most frequent date/time needs are:

- Parse some appropriate input format to construct a date or datetime.
- Get the required numerical or string format from a date or datetime.
- Apply an offset to a date or datetime value.
- Calculate the time span between two such values.
- Get the current date (with `today()`) and/or datetime (with `now()`).

### Parsing from strings

There are many ways to write dates and times, which tend to be culturally-specific.
All-number dates such as "7/6/23" are ambiguous, confusing, and have led to many expensive mistakes in multinational organizations (_the author says this from bitter personal experience_).

The international standard is defined in [`ISO 8601`][wiki-ISO8601], with two main advantages:

- Parsing is quick and unambiguous.
- Sorting is easy, as the datetime can be treated as normal text and sorted alphabetically.

However, data science is about working with whatever data you can find, and it is pointless to complain about how other people format it.

Base R has conversion functions which take a format string (defaulting to ISO 8601).

```R
> as.Date("2026-04-22")
[1] "2026-04-22"
> as.Date("4/22/26", format = "%m/%d/%y")
[1] "2026-04-22"
> as.POSIXct("2026-04-22 15:30:09 MST")
[1] "2026-04-22 15:30:09 MST"
```

The format strings resemble the decades-old `strptime()` function, included in [many languages][wiki-strptime].

More helpfully, `lubridate` provides a wide range of [helper functions][ref-parsing], with names that represent the order of fields.
Once the functions know which values to look for, and in which order, parsing is impressively flexible.

```R
> mdy("4/22/26")
[1] "2026-04-22"
> mdy("April 22nd 26")
[1] "2026-04-22"
> mdy("Wednesday, April 22nd 2026")
[1] "2026-04-22"
> mdy_hm("Wednesday, April 22nd 2026, 4:14 pm")
[1] "2026-04-22 16:14:00 UTC"  # defaults to your OS timezone
```

### Constructing from numerical values

In situations where your programs has components of a date/datetime as separate numbers, they can be assembled with [`make_date()` or `make_datetime()`][ref-make_datetime].

These are the components that can be supplied, showing their ordering and default values:

```R
make_datetime(
  year = 1970L,
  month = 1L,
  day = 1L,
  hour = 0L,
  min = 0L,
  sec = 0,
  tz = "UTC"
)

> make_datetime(2026, 4, 22, 17)
[1] "2026-04-22 17:00:00 UTC"
```

Naturally, `make_date()` takes only year, month and day arguments.

### Outputting in human-readable form

The R console automatically displays dates/datetimes as a string representation.
This is usually convenient, but sometimes misleading.

Internally, dates and datetimes are numbers (plus a few attributes), not strings.
Returning a date(time) when a string is expected will cause problems, so we need to know how to do the conversion.

A simple approach is to use [`as.character()`][ref-ascharacter] from Base R, which outputs a string in ISO 8601 format.

There is also a [`format_ISO8601()`][ref-iso8601] function for datetimes, which has options for rounding to a desired precision.

```R
> today() |> as.character()  # a date
[1] "2026-04-23"
> now() |> as.character()  # a datetime
[1] "2026-04-23 09:07:09.779319"
> now() |> format_ISO8601() # defaults to nearest second
[1] "2026-04-23T09:07:38"
```

Few non-progammers want to see ISO 8601 output, so handling culture-specific date/time formats is essential.

Base R provides the [`format()`][ref-format] function, which uses format strings similar to the venerable `strftime()` functions included in many other languages.

```R
> format(today(), "%A, %d %B %Y")
[1] "Thursday, 23 April 2026"
```

Lubridate provides a more human-friendly alternative with the [`stamp()`][ref-stamp] function, and the narrower `stamp_date()` and `stamp_time()`.

These take a template string which is an example of the desired output, and create a custom function to generate that format.

Lubridate attempts to guess the format, but often runs into ambiguities and produces the wrong result.
Be prepared to provide format string (such as `"dmy"`) to disambiguate.

### Setting or extracting components

Lubridate provides [many functions][ref-set-get] to get or set elements of a date or datetime: obvious ones such as `year()` and `second()`, but also more specialist ones such as `quarter()` and `epiweek()`.

All such functions can be used to get a value, and most can also be used to set the value.

```R
> dt <- now()
> dt
[1] "2026-04-23 15:47:11 MST"

# get
> month(dt)
[1] 4

# set
> month(dt) <- 11
> dt
[1] "2026-11-23 15:47:11 MST"
```

For `wday()` (day of week) and `month()`, the default is integer output but:

- Setting `labels = TRUE` returns an abbreviated character string corresponding to the current locale.
- Also setting `abbr = FALSE` returns the full name.

```R
> d <- today()
> d
[1] "2026-04-23"
> wday(d)
[1] 5
> wday(d, label = TRUE)
[1] Thu
Levels: Sun < Mon < Tue < Wed < Thu < Fri < Sat
> wday(d, label = TRUE, abbr = FALSE)
[1] Thursday
Levels: Sunday < Monday < Tuesday < Wednesday < Thursday < Friday < Saturday
```

The labels are `categorical variables`, which will be the subject of another Concept.
Values are restricted to the listed `Levels`, which also show sort order.

The week starts on Sunday by default, but this can be changed with the `week_start` argument (use `1` for Monday).

A few utility functions return `TRUE`/`FALSE` values, such as `leap_year()` and `dst()` (is Daylight Saving Time active?).

Months vary in length, so `days_in_month()` gives the integer value.

### Rounding



## Time spans

Both `date` and `datetime` values represent an instant along the timeline.

How do we handle concepts like "this time yesterday" or "a week from now"?

Students familiar with other science-oriented languages may be aware of `datetime.timedelta` in Python or the `Period` type in Julia.

In contrast, R has no less than three ways to represent time spans, with different strengths and limitations.
As always, choose the one best suited to your context.

### Periods


### Durations


### Intervals


## Timezones

Dealing with timezones can be challanging.
The quote below is from the Python documentation, but equally relevant to R:

> "The rules for time adjustment across the world are more political than rational, change frequently, and there is no standard suitable for every application aside from UTC."



[web-lubridate]: https://lubridate.tidyverse.org/index.html
[ref-lubridate]: https://lubridate.tidyverse.org/reference/index.html
[cheat-lubridate]: https://github.com/rstudio/cheatsheets/blob/main/lubridate.pdf
[book-dates-times]: https://r4ds.hadley.nz/datetimes.html
[wiki-ISO8601]: https://en.wikipedia.org/wiki/ISO_8601
[ref-parsing]: https://lubridate.tidyverse.org/reference/index.html#date-time-parsing
[ref-make_datetime]: https://lubridate.tidyverse.org/reference/make_datetime.html
[ref-set-get]: https://lubridate.tidyverse.org/reference/index.html#setting-getting-and-rounding
