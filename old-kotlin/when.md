# About when

Long chains of `if ... else` clauses are possible, but become ugly and difficult to read as complexity grows.

Many languages have a more concise syntax, with names such as `switch` or `match`, followed by the various cases to match on.

In Kotlin, the keyword is [`when`][when.

```kotlin
val option = 2
val output = when (option) {
    1 -> "One"
    2 -> "Two"
    else -> "something"
}
// => output = "Two"
```

In the above example, `when` is used as an [`expression`][expression] evaluating to a result.
In this case, the options must be "exhaustive", covering all possible inputs.
The `else` is essenhtial in the above code.

Some other languages (such as C and Java) "drop through" the cases and need `break` to prevent further execution.

Kotlin, like various functional languages, stops at the first successful match, ignoring anything below.
The order is tests is therefore very important, and `else` must _always_ come last.

Less commonly, `when` can be used as a [`statement`][statement], mainly for its side effects (printing, database operations, etc).
Being exhaustive is then optional.

## Branch conditions

So far, we only tested for implicit equality: `option == 2` in the above example.

Anything which can evaluate to a Boolean is valid before the `->`, depending on the type of `when` value, and we will see examples in later Concepts.

These would all match for `option = 2`:

- Explicit comparison: `< 5`
- Multiple conditions: `2, 4, 6`
- Range testing: `in 1..5`
- Type testing: `is Int`

Other `option` types might use conditions such as these:

- String functions: `startsWith("str_")`
- Enumerations: `Color.RED`


[when]: https://kotlinlang.org/docs/control-flow.html#when-expressions-and-statements
[expression]: https://en.wikipedia.org/wiki/Expression_(computer_science)
[statement]: https://en.wikipedia.org/wiki/Statement_(computer_science)

