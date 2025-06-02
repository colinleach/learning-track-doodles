# Concept tree for Kotlin learning mode

This is a very fluid plan and will doubtless continue to change frequently!

Boxes with green borders have the exercise + concept PRs submitted.
Blue borders mean only the concept PR is submitted.
Solid green means both are merged.

Red text means we need to decide between plausible exercises from other tracks.

```mermaid
graph TD
    
start(("Start")) -.basics.-> basics["lasagna"]
style basics fill:#0f0

basics -.booleans.-> booleans["annalyns-infiltration"]
style booleans fill:#0f0

basics -.strings.-> strings["log-levels"]
style strings stroke:#333

strings -.chars.-> chars["squeaky-clean"]
style chars stroke:#333

booleans -.conditionals.-> conditionals["cars-assemble?"]
style conditionals stroke:#333

booleans -.numbers.-> numbers["cars-assemble?"]
style numbers stroke:#333

    conditionals -.ranges.-> ranges["??"]
    style ranges stroke:#333

    ranges -.for-loops.-> for-loops["bird-watcher?"]
    style for-loops stroke:#333

    conditionals -.when.-> when["bird-watcher?"]
    style when stroke:#333

    conditionals -.nullability.-> nullability["tim-from-marketing?"]
    numbers -.nullability.-> nullability["tim-from-marketing?"]
    style nullability stroke:#333

    numbers -.lists.-> lists["bird-watcher?"]
    style lists stroke:#333

lists -.sets.-> sets["cars-assemble?"]
style sets stroke:#333

lists -.maps.-> maps["cars-assemble?"]
style maps stroke:#333


```


## Some special features of Kotlin

The Java syllabus is useful as a starting point for a Kotlin equivalent.
However, Kotlin is a big, modern, multi-paradigm language with many features still absent from Java.

This is a very preliminary list, which may need correction by someone with more experience of modern Java:

- Nullable types
  - non-nullable is the default 
  - the safe-call operator `?.`
  - the Elvis operator `?:`
- `when` for pattern matching
- Function call syntax
  - named arguments
  - default arguments
- Functional programming support
  - functions as arguments and return values
  - higher-order functions 
  - lambdas
- Data classes
- Objects as static classes
- Extension functions
- Coroutines, for asynchronous programming



