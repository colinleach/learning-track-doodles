# About Numbers

## Numerical types

Numbers can be integer, unsigned integer, or floating point types.
Each comes in various "sizes", meaning how many bits it needs in memory.

- Integers can be `Byte`, `Short`, `Int` or `Long`, respectively 8, 16, 32 and 64 bits.
- Unsigned integers have a `U` prefix: `UByte`, `UShort`, `UInt` or `ULong`.
- Floating point types are `Float` (32-bit) or `Double` (64-bit).

Integer variables relying on type inference default to `Int`, even on 64-bit machines, but floating point variables default to `Double`.



Other types can, of course, be specified, but there are a few syntactic shortcuts, and big integer literals become `Long` if they would overflow `Int`.

```Kotlin
val one = 1 // defaults to Int
val threeBillion = 3_000_000_000 // Long, with optional underscores for clarity
val oneLong = 1L // Long
val oneByte: Byte = 1
val oneDouble = 1.0 // defaults to Double
val oneFloat = 1.0f //Float
val lightSpeed = 3.0e8 // scientific notation (units of m/s)
```

Hexadecimal and binary literals are conventional: `0x7F` and `0b100101` respectively.
Octal literals are not supported in Kotlin.

## Arithmetic

The basic arithmetic operators are the same as in many languages:

```Kotlin
4 + 3 // => 7
4 - 3 // => 1
4 * 3 // => 12
4 / 3 // => 1  Int / Int always gives an nt
-8 / 3 // => -2  Truncated towards zero
-8.0 / 3 // => -2.6666666666666665
```

To get a floating point result from division, at least one of the numerator / denominator must be floating point.

Division by zero is more interesting.

```Kotlin
1 / 0 // => java.lang.ArithmeticException: / by zero
3.0 / 0.0 // => Infinity
0.0 / 0.0 // => NaN (Not a Number)
```

Integer division by zero is an error, but [IEEE floating point standards][IEEE] can apply in other cases.

The modulo operator `%` gives the remainder from integer division:

```Kotlin
8 % 3 // => 2
```

Kotlin, like other JVM languages, has no exponentiation operator (_this annoys scientists and engineers_).

## Type conversions

Kotlin will quietly do implicit conversions in a few cases, for example `Int` to `Double` in a mixed arithmetic expression:

```Kotlin
3 + 4.0 // => 7.0
```

Internally, the `+` operator is overloaded to handle this.

More generally, explicit conversions are required:

```Kotlin
val x = 7.3
x.toInt() // => 7

val n = 42
n.toDouble() // => 42.0
```

See the [manual][conversions] for the full list of methods.

[IEEE]: https://en.wikipedia.org/wiki/IEEE_754
[conversions]: https://kotlinlang.org/docs/numbers.html#explicit-number-conversions
