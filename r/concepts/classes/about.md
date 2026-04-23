# About

By this point in the syllabus, you have seen R used often as an imperative language, and increasingly as a functional language (especially with the [`purrr` library][ref-purrr]).

Suggesting now that R is primarily object-oriented may provoke some skepticism!

Oddly, this is a true statement.
Internally, R is implemented using classes, inheritance, polymorphism, and the sort of attitudes familiar to OOP programmers.

However, anyone familiar with Java or Ruby (explicitly OOP) or even Python (semi-covertly OOP, in some respects) will find the R approach ... _unfamiliar_.

For a start, there are multiple class designs: perhaps three in common use (S3, S4, R6), plus various others of mainly theoretical interest.

A thorough discussion can be found in [Advanced R 2e][book-advanced-r], chapters 12-16.
This 2019 book is aimed largely at people who want to understand and maintain the internals of R, so OOP is esential.

More end-user-oriented textbooks vary.

- The Art of R Programming (2011, print-only) has an OOP chapter covering S3 and (more briefly) S4, which were important at the time.
  The comment that "S3 classes have a rather cobbled-together structure" is still strikingly true.
- R in Action (3e, 2022) relegates OOP to 3 pages in a chapter on Advanced Programming near the end.
- [R for Data Science, 2e][book-r-data-sci] (2023, with 548 pages in the print edition) makes no mention of OOP.

This Concept will concentrate on S3 classes, which are the simplest, most common and most relevant to Exercism-type problems.

## S3 classes

These are old: the name just means they were introduced in version 3 of the S language (a commercial precursor of R).

An S3 class is also very simple: essentially, a [List][concept-lists] with two extra attributes.

[book-advanced-r]: https://adv-r.hadley.nz/oo.html
[book-r-data-sci]: https://r4ds.hadley.nz/
[concept-lists]: https://exercism.org/tracks/r/concepts/lists
