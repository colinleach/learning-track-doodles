# About

A [`string`][string] in Kotlin is an immutable sequence of Unicode characters.

[`Immutable`][immutable] means that any operation on a string must return a new string: the original string can never change.

[`Unicode`][unicode] means that most of the world's writing systems can be represented, but (in contrast to older languages such as C) there is no 1:1 mapping between characters and bytes.

A string is usually surrounded by double-quotes `" "`.

Some characters need escaping: `\'`, `\\`, plus the usual non-printing characters such as `\t` (tab) and `\n` (newline).

```kotlin
val s = "Escape apostrophe \' and backslash \\."
// Escape apostrophe ' and backslash \.
```

Raw strings use 3 double-quotes, and can contain arbitrary text (no need for escaping).
Multiline strings are also supported, including flexible handling of indents.

```kotlin
val multi = """I'm a
    |multi-line
    |string with special characters \ \t """

multi.trimMargin()  // delimiter defaults to | but can be specified
//I'm a
//multi-line
//string with special characters  \ \t 
```

Strings can be concatenated with `+`, but this is best limited to short and simple cases.
There are other and often better options.

## String templates

This refers to what some other languages call "interpolation".

if a dollar sign `$` is followed by an identifier or expression within a string, the _value_ is substituted.

```kotlin
val x = 42
val st = "x is $x, x squared is ${x * x}"
// x is 42, x squared is 1764
```

The braces `{ }` are needed around expressions when parsing would otherwise be ambiguous.

## String formatting

On the JVM platform, `String.format()` allows more precise formatting than string templates, with [syntax][formats] similar to the (_very old!_) [`printf`][printf] functions.

```kotlin
String.format("%s %.3f", "π ≈", 3.14159)
//π ≈ 3.142
```

## StringBuilder

Sometimes a long string needs to be built up in stages, for example within a loop.

Concatenating strings with `+` soon becomes neither elegant nor performant: immutability means that there is a _lot_ of copying required.

Use of [`StringBuilder`][stringbuilder] can be much more efficient.

In essence, a `StringBuilder` is a list-like structure, with convenient methods:

- `append()` to add to the end.
- `insert()` to add at a specified position.
- `delete()` to remove from a specified position.
- `toString()` to convert to a normal string at the end: concatenating everything in a single, performant operation.

```kotlin
val sb = StringBuilder()
sb.append("Hello ")
sb.append("World!")
sb.toString()
//Hello World!
```

## String functions

Kotlin strings 


[string]: https://kotlinlang.org/docs/strings.html
[immutable]: https://en.wikipedia.org/wiki/Immutable_object
[unicode]: https://en.wikipedia.org/wiki/Unicode
[formats]: https://docs.oracle.com/javase/8/docs/api/java/util/Formatter.html#summary
[printf]: https://en.wikipedia.org/wiki/Printf
[stringbuilder]: https://kotlinlang.org/api/core/kotlin-stdlib/kotlin.text/-string-builder/
