# About Lists

Any general-purpose language needs ways to handle collections of data, and the [`kotlin.collections`][collections] standard library covers an appropriate variety of types.

In particular, we need a way to store and manipulate _ordered sequences_ of data.

For this, Kotlin's preferred method is (_usually but not always_) to use the [`List`][list] type.

The [`listOf()`][listof] function creates a read-only (immutable) list.
Entries cannot be added, removed or modified.

```kotlin
val vi = listOf(1, 5, 7)

// get element by index, same as vi.get(1)
vi[1]  // => 5

// properties
vi.size  // => 3
vi.lastIndex  // => 2
vi.indices  // => 0..2

// immutable!
vi[1] = 9  // => Unresolved reference error
vi.add(11) // => Unresolved reference error
```

As with many aspects of Kotlin, immutability is the default but a similar mutable type is available.

The [`mutableListOf()`][mutablelistof] function creates a list with elements that can be added, deleted and modified.

```kotlin
val vm = mutableListOf(1, 3, 5)
vm[1] = 9   // => vm is [1, 9, 5]
vm.add(11)  // => vm is [1, 9, 5, 11]

// remove first matching element
vm.remove(5)  // => vm is [1, 9, 11] 

// drop first n elements
vm.drop(2)  // => [11]
```

Both [`List`][list-api] and [`MutableList`][mutablelist] have dozens of functions available for a wide variety of manipulations: far too many to demonstrate here.

It can be important to understand _what_ each function returns.
For example, when we want a reversed list:

- `asReversed()` returns a reversed _view_ of the original list, with no copying.
- `reversed()` returns a reversed _copy_ of the original list.
- for mutable lists, `reverse()` modifies the original list in-place.

## Appending lists

Any number of lists can be combined with the `+` operator, with everything being copied to a new read-only `List`.

```kotlin
val v = listOf(1, 2) + listOf(3, 4) + listOf(5, 6) + listOf(7, 8) + listOf(9, 10)
// => v is [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

A MutableList can be extended with `+=`, equivalent to the [`addAll()`][addall] function.

```kotlin
val vm = mutableListOf(11, 9, 1)
vm += listOf(5, 4, 3)
// => vm is [11, 9, 1, 5, 4, 3]
```

Something apparently similar can be done with a `List`, but only if it is defined as a `var'.

```kotlin
var vi2 = listOf(1, 5, 7)
vi2 += listOf(5, 4, 3)
// => vi2 is [1, 5, 7, 5, 4, 3]
```

Internally, this copies _both_ lists to a new, temporary list, then assigns this to `vi2`, overwriting the original value.

[collections]: https://kotlinlang.org/docs/collections-overview.html
[list]: https://kotlinlang.org/docs/collections-overview.html#list
[list-api]: https://kotlinlang.org/api/core/kotlin-stdlib/kotlin.collections/-list/
[listof]: https://kotlinlang.org/api/core/kotlin-stdlib/kotlin.collections/list-of.html
[mutablelist]: https://kotlinlang.org/api/core/kotlin-stdlib/kotlin.collections/-mutable-list/
[mutablelistof]: https://kotlinlang.org/api/core/kotlin-stdlib/kotlin.collections/mutable-list-of.html
[addall]: https://kotlinlang.org/api/core/kotlin-stdlib/kotlin.collections/-mutable-list/add-all.html
