# About

Regular expressions are a highly versatile way to _pattern match_ strings, using a Domain Specific Language (DSL) designed for the purpose.

~~~~exercism/advanced
Like many other programming languages, R makes no attempt to implement its own Regex library.
Instead, it wraps the [ICU][web-icu] regular expression engine.
ICU is similar to the popular [PCRE2][web-PCRE] library used by most newer languages, though some edge cases are handled differently.

[web-PCRE]: https://www.pcre.org/current/doc/html/pcre2syntax.html
[web-icu]: https://unicode-org.github.io/icu/userguide/strings/regexp.html
~~~~

Many RegEx capabilities are built into Base R, and you may see examples in older code.

For new code, it is _strongly_ recommended to use the [`stringr`][web-stringr] library.

As noted in the [Strings Concept][concept-strings], `stringr` has good documentation, typically written by the package author(s).

- A [reference website][ref-stringr]
- A [cheatsheet][cheat-stringr]
- A [Strings chapter][book-strings] in "R for Data Science".
- A [RegEx chapter][book-regex] in "R for Data Science".

~~~~exercism/note
This R syllabus assumes that you are already familiar with basic Regex syntax.
We will concentrate solely on R-specific features.

Some resources to refresh your regular expression knowledge are listed below.

- [Regex101][regex101]
- [RegExr][regexr]
- [RexEgg][rexegg]
- [RegexOne][regexone]
- [Regular Expressions Info][regex-info]

[regex101]: https://regex101.com/
[regexr]: https://regexr.com/
[regex-info]: https://www.regular-expressions.info/
[rexegg]: https://www.rexegg.com/
[regexone]: https://regexone.com/
~~~~

R's interface to regular expressions is described in the [manual][regex].

A regular expression in R is simply a string prefaced by `r` before the opening `"`.
All the basic functionality is part of the standard library.

In fact, many of the functions already discussed in the [`Strings`][strings] Concept are designed for Regex searches as standard, such as [`occursin()`][occursin].

```R
re = r"test$"
r"test$"

typeof(re)
Regex

# Does a string end with "test"?
occursin(re, "this is a test")
true

occursin(re, "these are tests")
false
```

Modifier characters can follow the closing quote, such as `i` for a case-insensitive match.

```R
occursin(r"test", "Testing")
false

occursin(r"test"i, "Testing")
true
```

## Captures

Commonly, we want to know _what_ matches. This is achieved by including capture groups in parentheses within the regex, then using the [`match()`][match] function.

```R
m = match(r"(\d+g) .* (\d+ml)", "dissolve 25g sugar in 200ml water")
RegexMatch("25g sugar in 200ml", 1="25g", 2="200ml")

m.captures
2-element Vector{Union{Nothing, SubString{String}}}:
 "25g"
 "200ml"

# how many matches?
length(m.captures)
2

# what matched?
m[1], m[2]
("25g", "200ml")

# Starting positions of the matches (character index)
m.offsets
2-element Vector{Int64}:
 10
 23
```

Of course, matches can fail.
The result will then be the special value `Nothing` instead of a `RegexMatch`, so be ready to test for this.

```R
# failed match
m = match(r"(not here)", "dissolve 25g sugar in 200ml water")

typeof(m)
Nothing

isnothing(m)
true
```

Though `match` defaults to starting at the begining of the string, we can also specify an offset `n` to ignore the first `n` characters.

```R
# capture first match
m = match(r"(\wat)", "cat, sat, mat")
RegexMatch("cat", 1="cat")

# ignore first 5 characters, then match
m = match(r"(\wat)", "cat, sat, mat", 5)
RegexMatch("sat", 1="sat")
```

In R, `match()` will only find the _first_ match within the target string: there is no global modifier as in some other languages.

Instead, we have [`eachmatch()`][eachmatch], which returns an iterator of matches.
This is lazily evaluated, so you may need to convert it to your desired format.

```R
matches = eachmatch(r"(\wat)", "cat, sat, mat")
Base.RegexMatchIterator{String}(r"(\wat)", "cat, sat, mat", false)

# convert to vector
collect(matches)
3-element Vector{RegexMatch}:
 RegexMatch("cat", 1="cat")
 RegexMatch("sat", 1="sat")
 RegexMatch("mat", 1="mat")

# convert with comprehension
[m.match for m in matches]
3-element Vector{SubString{String}}:
 "cat"
 "sat"
 "mat"

# broadcast an anonymous function
(m -> m.match).(matches)
3-element Vector{SubString{String}}:
 "cat"
 "sat"
 "mat"
```

Overlapping matches are not allowed by default.
Add `overlap = true` as a keyword argument to override this.

```R
eachmatch(r"aba", "abababa") |> collect  # matches at positions 1, 5
2-element Vector{RegexMatch}:
 RegexMatch("aba")
 RegexMatch("aba")

eachmatch(r"aba", "abababa"; overlap = true) |> collect  # also matches at position 3
3-element Vector{RegexMatch}:
 RegexMatch("aba")
 RegexMatch("aba")
 RegexMatch("aba")
```

## Replace

One common reason to use a Regex is to replace the match with a different string.

The [`replace()`][replace] function was discussed in the [`Strings`][strings] Concept, using string literals to search on.
The same function can exploit the full power of Regex matching.

```R
replace("some string", r"[aeiou]" => "*")
"s*m* str*ng"

replace("first second", r"(\w+) (?<agroup>\w+)" => s"\g<agroup> \1")
"second first"
```

The second example above shows how both numbered and named capture groups can be used in the replacement, within an `s" "` string.

See the [manual][regex] for more details: this is a topic which constantly forces most programmers back to the documentation!



[concept-strings]: https://exercism.org/tracks/R/concepts/strings
[ref-stringr]: https://stringr.tidyverse.org/index.html
[ref-tidyverse]: https://tidyverse.org/
[cheat-stringr]: https://github.com/rstudio/cheatsheets/blob/main/strings.pdf
[book-strings]: https://r4ds.hadley.nz/strings.html
[book-regex]: https://r4ds.hadley.nz/regexps.html
