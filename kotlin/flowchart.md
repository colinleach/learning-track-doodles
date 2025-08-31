# Concept tree for Kotlin learning mode

This is a very fluid plan and will doubtless continue to change frequently!

Boxes with red borders have a draft `about.md` available.

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
style strings stroke:#00f

strings -.chars.-> chars["squeaky-clean"]
style chars stroke:#f00

booleans -.conditionals.-> conditionals["vehicle-purchase?"]
style conditionals stroke:#00f

booleans -.numbers.-> numbers["cars-assemble?"]
style numbers stroke:#00f

conditionals -.ranges.-> ranges["chessboard?"]
style ranges stroke:#f00

ranges -.loops.-> loops["bird-watcher?"]
style loops stroke:#333

conditionals -.when.-> when["guessing-game??"]
style when stroke:#f00

conditionals -.nullability.-> nullability["tim-from-marketing?"]
numbers -.nullability.-> nullability["tim-from-marketing?"]
style nullability stroke:#00f

numbers -.lists.-> lists["karls-languages?"]
style lists stroke:#f00

lists -.sets.-> sets["gotta-snatch-em-all?"]
style sets stroke:#333

lists -.maps.-> maps["international-<br/>calling-connoiseur?"]
style maps stroke:#333

lists -.randomness.-> randomness["captains-log?"]
style randomness stroke:#333

numbers -.bits.-> bits["secrets"]
style bits stroke:#f00

when -.enums.-> enums["logs-logs-logs?"]
style enums stroke:#333

lists -.arrays.-> arrays["bird-watcher"]
style arrays stroke:#333

lists -.pairs-and-triples.-> pairs-and-triples["??"]
style pairs-and-triples stroke:#333

loops -.recursion.-> recursion["pizza-pricing?"]
style recursion stroke:#333

nullability -.functions.-> functions["??"]
style functions stroke:#333

functions -.higher-order-functions.-> higher-order-functions["??"]
style higher-order-functions stroke:#333

functions -.exceptions.-> exceptions["calculator-conundrum?"]
classes -.exceptions.-> exceptions["calculator-conundrum?"]
style exceptions stroke:#333

nullability -.classes.-> classes["??"]
style classes stroke:#333

classes -.types.-> types["??"]
style types stroke:#333


```


## Some special features of Kotlin

The Java syllabus is useful as a starting point for a Kotlin equivalent.
However, Kotlin is a big, modern, multi-paradigm language with many features that are still absent from Java.

This is a very preliminary list, which ~~may~~ will certainly need correction by someone with more experience of modern Java:

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



