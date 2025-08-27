# About types

Kotlin is a statically typed language, with a complex type system that supports full Java interop but also adds Kotlin-specific extensions.

Extensive use of type inference means that types are relatively inconspicuous in most Kotlin code.

Sometimes we need to check the type of a value at runtime.

This is a particular issue if our code receives a value of type [`Any`][any], which is the root of Kotlin's type system.

`Any` maps to Java's `object` class, but adds some Kotlin-specific extension functions.

In contrast to several other languages, Kotlin has not defined `typeof` (the keyword is ["reserved for future use"][reserved]).

We can run simple checks with the [`is`][is] operator:

```kotlin
val a: Any = 5
a is Int  // => true (is an Int)
a !is String // => true (not a String)
```

For more detail, we can use reflection:

```kotlin
a::class.simpleName     // => Int
a::class.qualifiedName  // => kotlin.Int

val b = listOf('a', 'f', 'r')
b::class.qualifiedName  // => java.util.Arrays.ArrayList
```

## Parametric types

TODO

## Parametric functions

TODO

## Reified types

TODO

[reserved]: https://kotlinlang.org/docs/keyword-reference.html#hard-keywords
[is]: https://kotlinlang.org/docs/typecasts.html#is-and-is-operators
[any]: https://kotlinlang.org/api/core/kotlin-stdlib/kotlin/-any/
