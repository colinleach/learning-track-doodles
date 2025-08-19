# About

A [`string`][string] in Kotlin is an immutable sequence of Unicode characters.

[`Immutable`][immutable] means that any operation on a string must return a new string: the original string can never change.

[`Unicode`][unicode] means that most of the world's writing systems can be represented, but (in contrast to older languages such as C) there is no 1:1 mapping between characters and bytes.

A string is usually surrounded by double-quotes `" "`.

Some characters need escaping: `\'`, `\\`, plus the usual non-printing characters such as `\t` (tab) and \n (newline).

```kotlin
val s = "Escape apostrophe \' and backslash \\."
// Escape apostrophe ' and backslash \.
```

Multiline strings use 3 double-quotes, and can contain newlines and arbitrary test (no need for escaping).

```kotlin
val multi = """I'm a
multi-line
string with special characters \ \t """

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




[string]: https://kotlinlang.org/docs/strings.html