# About chars

This is a _big_ subject!
It is possible to write a long book about it, and several people have done so (search Amazon for "unicode book" to see some examples).

## A very brief history

Handling characters in computers was much simpler in earlier decades, when programmers assumed that English was the only important language.
So: 26 letters, upper and lower case, 10 digits, several punctuation marks, plus a code (0x07) to ring a bell, and it all fitted into 7 bits: the [ASCII][ascii] character set.

Naturally, people started asking what about à, ä and Ł, then other people started asking about ऄ, ஹ and ญ, and young people wanted emojis 😱.
What to do?

To cut a long story short, many smart and patient people had to serve on committees for years, working out the details of the [Unicode][unicode] character set, and of encodings such as [UTF-8][utf-8], and lots of software needed a _very_ complicated rewrite.
Also, lots of new bugs were introduced.

To prevent _everything_ breaking, the Unicode/UTF-8 design ensures that the first 127 codes are identical to ASCII _(even the bell)_.

## Characters in Kotlin

Languages designed after about 2005 have the huge advantage that a reasonably stable Unicode standard already existed.

Kotlin (first released 2011) was able to assume that users would use a variety of (human) languages, and would need Unicode to express them.

Note that there is no attempt to implement the full Unicode standard, which uses up to six bytes per character.

Characters in Kotlin are all 16-bit: enough to express most written alphabets, but not a wide range of emojis.
The 

Character literals are written in single-quotes, and are distinct from strings written in double quotes.

This is probably obvious to people from the C/C++ world, but potentially confusing to Python and JavaScript programmers.

```kotlin
val a = 'a'
a::class.qualifiedName  // => kotlin.Char
a.code  // => 97

val jha = 'झ'  // Devanagari alphabet
jha.code  // => 2333

val heart = '❤'  // heart emoji
heart.code  // => 10084

Char.MAX_VALUE.code  // => 65535 (64k, the largest code point allowed)
```

Converting between `Char` and `Int` is simple:

```kotlin
a.code  // => 97  (a.toInt() is deprecated)
Char(97) // => 'a'
```

The compiler allows _some_ forms of integer arithmetic on `Char`s:

```kotlin
a + 5       // => 'f'
'c' - 'a'   // => 2
'c' + 'a'   // => error!

'f' + ('A' - 'a')  // => 'F' (same as 'f'.uppercase()
```

## Functions for `Char`

A subset of string-handling functions can also work on `Char` input.

- For appropriate alphabets, change case with [`uppercase()`][uppercase] and [`lowercase()`][lowercase].
- Test case with [`isuppercase()`][isuppercase] and [`islowercase()`][islowercase].
- Test character type with:
    - [`isletter()`][isletter], covers many alphabets
    - [`isdigit()`][isdigit], tests for strictly 0:9
    - [`isnumeric()`][isnumeric], broader than `isdigit`, so `true` for ¾ and various non-European scripts
    - [`isxdigit()`][isxdigit], hexadecimal digits
    - [`isascii()`][isascii], pre-Unicode character
    - [`ispunct()`][ispunct], punctuation
    - [`isspace()`][isspace], any whitespace character
    - [`isprint()`][isprint], printable characters (opposite is `iscntrl()`)

```julia
islowercase('A')  # false
uppercase('γ')  # 'Γ': Unicode U+0393 (category Lu: Letter, uppercase)
ispunct('@')  # true
isdigit('A')  # false
isxdigit('A')  # true
```
To check if a character is present in a string, we have [`in`][ranges].
Note that this differs from substrings:

```kotlin
# char search
julia> 'a' ∈ "xabcahliazlnkiw"
true

# substring search
julia> "a" ∈ "xabcahliazlnkiw"
use occursin(needle, haystack) for string containment
```

Also, regular expressions (the subject of another Concept) allow powerful search and manipulation.

## Char Vector and String interconversions

For String to Char Vector, we can use `collect()`.

For Char Vector to String, there is the `String()` constructor.

```kotlin
julia> s = "abcde"
"abcde"

julia> cv = collect(s)
5-element Vector{Char}:
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 'c': ASCII/Unicode U+0063 (category Ll: Letter, lowercase)
 'd': ASCII/Unicode U+0064 (category Ll: Letter, lowercase)
 'e': ASCII/Unicode U+0065 (category Ll: Letter, lowercase)

julia> String(cv)
"abcde"
```

This works with any characters, not just ASCII.

```kotlin
julia> collect("❤,😱")
3-element Vector{Char}:
 '❤': Unicode U+2764 (category So: Symbol, other)
 ',': ASCII/Unicode U+002C (category Po: Punctuation, other)
 '😱': Unicode U+1F631 (category So: Symbol, other)
```

Note that the `String()` constructor operates on a Vector.
To _cast_ a single `Char` to a 1-character string, the function is `string()`, with lowercase `s`.

```kotlin
julia> string('a')
"a"
```

## Storage

Everything so far in the document seems relatively simple, so is there really not much to worry about?

Unfortunately, this is too optimistic!

One complication comes from the need for "up to" 6 hex digits per code point.
This means that different characters need different amounts of space in memory when UTF-8 encoded.

A byte can only store (unsigned) numbers up to 255, two hex digits, so UTF-8 uses a variable number of bytes (1 to 4) to store a `Char`.
These are called "code units", and the `ncodeunits()` function will return the number needed for a given character.

```kotlin
julia> codepoint(jha)  # jha 'झ' is defined in an earlier example
0x0000091d

julia> ncodeunits(jha)
3

julia> ncodeunits('a')  # ASCII character
1

julia> ncodeunits('😱')  # emoji
4
```

Also, not everything that can be displayed on screen has its own unique code point.
Some visually-distinct characters are considered to be derived from others, so Unicode treats them as a parent character plus a modifier.


[ascii]: https://en.wikipedia.org/wiki/ASCII
[unicode]: https://home.unicode.org/
[utf-8]: https://en.wikipedia.org/wiki/UTF-8
