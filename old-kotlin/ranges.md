# About Ranges

Suppose you want all the non-negative integers up to 1000.
It would be ridiculous if you had to type all these into a list!

Kotlin, like many languages, has a [range][range] type to simplify this.

Most simply, a range can be consecutive integers.
To make clear what is included, most of the following examples convert the range type (a `lazy` iterator) to a list.

```kotlin
1..5  // => 1..5
(1..5).toList()  // => [1, 2, 3, 4, 5]

// closed interval
1..<5  // => 1..4
(1..<5).toList()  // => [1, 2, 3, 4]
```

Note that the end limit is included in the range by default (a "closed" range).

To get an "open" range, omitting the end limit, use `..<`.
This more closely mimics some other languages such as Python.

A `step` keyword can be included, but the `..` syntax only allows positive steps. 
Use `downTo` for descending sequences.

```kotlin
(1..5 step 2).toList()  // => [1, 3, 5]

(5 downTo 1).toList()  // => [5, 4, 3, 2, 1]
(5 downTo 1 step 2).toList()  // => [5, 3, 1]
```

Other ordered, discrete types can also be used in ranges, such as characters (and not just ASCII).

```kotlin
('a'..'e').toList()  // => [a, b, c, d, e]

// Devanagari
('ऄ'..'ई').toList()  // => [ऄ, अ, आ, इ, ई]
```

***Note:*** The output listed here after a `=>` was generated interactively by [Kotlin Notebook][notebook], which omits quotes from characters and strings for readability.
Assume that all the characters would be surrounded by `' '` in code.


[range]: https://kotlinlang.org/docs/ranges.html#range
[notebook]: https://kotlinlang.org/docs/kotlin-notebook-overview.html
