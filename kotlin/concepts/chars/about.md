# About chars

This is potentially a _big_ subject!
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

Kotlin (first released in 2011) was able to assume that users would use a variety of (human) languages, and would need Unicode to express them.

Note that there is no attempt to implement the full Unicode standard, which uses up to six bytes per character.

Characters in Kotlin are all 16-bit: enough to express most written alphabets, but not a wide range of emojis.

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
'a' + 5       // => 'f'
'c' - 'a'   // => 2
'c' + 'a'   // => error!

'f' + ('A' - 'a')  // => 'F' (same as 'f'.uppercase()

'f'.dec() // => 'e' (decrement)
'f'.inc() // => 'g' (increment)
```

## Functions for `Char`

- For appropriate alphabets, change case with [`uppercase()`][uppercase] and [`lowercase()`][lowercase].
- Test case with [`isUpperCase()`][isuppercase] and [`isLowerCase()`][islowercase].
- Test character type with:
    - [`isLetter()`][isletter], covers many alphabets
    - [`isDigit()`][isdigit], in range 0..9
    - `isLetterOrDigit()`, combines the previous two
    - [`isWhitespace()`][iswhitespace], any whitespace character

```kotlin
'झ'.isLetter()      // => true
'A'.isLowerCase()   // => false
'4'.isDigit()       // => true
'\t'.isWhitespace() // => true  (tab character)
```
To check if a character is present in a `String`, or a `Char` list or array, we have [`in`][ranges].

```kotlin
val clist = "kotlin".toList()  // => [k, o, t, l, i, n]
't' in clist     // => true
't' in "kotlin"  // => true
```

Also, regular expressions (the subject of a later Concept) allow powerful search and manipulation.

## Char List and String interconversions

For String to Char List, we can use `toList()`.

For Char List to String, there is the [`joinToString()`][jointostring] function, which takes a separator as argument.

```kotlin
val kt = "kotlin".toList()  // => [k, o, t, l, i, n]
kt.joinToString("")   // => "kotlin"
kt.joinToString("_")  // => "k_o_t_l_i_n"
```

Note that `joinToString()` operates on a List or Array.
To _cast_ a single `Char` to a 1-character string, use `toString()`.

```kotlin
'a'.toString() // => "a"
```


[ascii]: https://en.wikipedia.org/wiki/ASCII
[unicode]: https://home.unicode.org/
[utf-8]: https://en.wikipedia.org/wiki/UTF-8
[uppercase]: 
[lowercase: 
[isuppercase]: 
[islowercase]: 
[isletter]: 
[isdigit]: 
[iswhitespace]: 
[jointostring]: 
