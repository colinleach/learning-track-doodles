# About Bits

Binary digits ultimately map directly to the transistors in your CPU or RAM, and whether each is "on" or "off".

Low-level manipulation, informally called "bit-twiddling", is particularly important in system languages.

Higher-level languages like Kotlin usually abstract away most of this detail.
However, a basic range of bit-level operations are [available][bitwise].

***Note:*** To see human-readable binary output, nearly all the examples below need to be wrapped in an [`Integer.toBinaryString()`][binstring] function, or converted with `toString(radix = 2)`.
This is visually distracting, so most occurrences of this function have been edited out, and the results are represented with `0b` notation.

## Bit-shift operations

`Int` or `Long` types, signed or unsigned, can be represented as a string of 1's and 0's and manipulated as a sequence of bits.

Perhaps surprisingly, `Byte` or `Short` types are not compatible with bitwise operations in Kotlin.
All the examples below use 32-bit integers (`Int` or `UInt`).

```kotlin
val ns = 0b111  // 7 decimal
Integer.toBinaryString(ns)  // => "111"
```

Bit-shifts just move everything to the left or right by a specified number of positions.
Some bits drop off one end, and the other end is padded with zeros or ones.

- Left shift with `shl`: zero-padding.
- Right shift with `shr` or `ushr`: zero padding for positive numbers.
- See below for more on negative signed numbers.

```kotlin
val ns = 0b111  // 7 decimal
ns shl 1  // => 0b1110, decimal 14
ns shr 1  // => 0b11, decimal 3
ns ushr 1  // => 0b11

val nu: UInt = 0b111u  // 7 unsigned
nu shr 1  //  => 0b11
```

Each left-shift doubles the value, and each right-shift halves it (subject to truncation).
This is more obvious in decimal representation:

```kotlin
3 shl 2  // => 12
24 shr 3 // => 3
```

Such bit-shifting is much faster than "proper" arithmetic, making the technique very popular in low-level coding.

With _negative integers_, we need to be a bit more careful.

Negative values are stored in [two's complement][2complement] form, which means that the left-most bit is 1.
No problem for a left-shift, but when right-shifting how do we pad the left-most bits?

```kotlin
val ns = -0b111  // => 0b11111111111111111111111111111001

// shift left: simple
ns shl 1  // => 0b11111111111111111111111111110010, decimal -14

// shift right: preserves sign bit
ns shr 1  // => 0b11111111111111111111111111111100, decimal -4

// unsigned shift right: left-pads with zeros
ns ushr 1 // => 0b01111111111111111111111111111100, decimal 2147483644
```

The `shr` operator performs [arithmetic shift][arithmetic], preserving the sign bit.

The `ushr` operator performs [logical shift][logical], padding with zeros as if the number was unsigned.

## Bitwise logic

We saw in a previous Concept that the operators `&&` (and), `||` (or) and `!` (not) are used with boolean values.

There are equivalent operators `and`, `or`, `xor` ([exclusive-or][xor]) and `inv` (inversion) to compare the bits in two integers.

```kotlin
0b1011 and 0b0010 //  bit is 1 in both numbers
// => 0b0010

0b1011 or 0b0010 // bit is 1 in at least one number
// => 0b1011

0b1011 xor 0b0010 // bit is 1 in exactly one number, not both
// => 0b1001

0b1011.inv() // flip all bits
// => 0b11111111111111111111111111110100
```


[bitwise]: https://kotlinlang.org/docs/numbers.html#bitwise-operations
[xor]: https://en.wikipedia.org/wiki/Exclusive_or
[2complement]: https://en.wikipedia.org/wiki/Two%27s_complement
[arithmetic]: https://en.wikipedia.org/wiki/Arithmetic_shift
[logical]: https://en.wikipedia.org/wiki/Logical_shift
[binstring]: https://www.baeldung.com/kotlin/int-binary-representation
