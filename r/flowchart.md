# Concept tree for R learning mode

## Some that are already in progress or planned

This is a very fluid plan and will doubtless continue to change frequently!

Boxes with green borders have the exercise + concept PRs submitted.
Solid green means both are merged.

```mermaid
graph TD
    
start(("Start")) --basics--> basics["lasagna"]
style basics fill:#0f0

basics --booleans--> booleans["annalyns-infiltration"]
style booleans fill:#0f0

booleans --conditionals--> conditionals["cars-assemble"]
style conditionals fill:#0f0

conditionals --vectors--> vectors["elyses-enchantments"]
style vectors fill:#0f0

switch -.loops.-> loops["mixed-juices"]
style loops fill:#0f0

vectors --set-operations--> set-operations["ozans-playlist"]
style set-operations fill:#0f0

name-attribute --lists--> lists["need-for-speed"]
style lists fill:#0f0

vectors --vector-filtering--> vector-filtering["elyses-analytic-enchantments"]
style vector-filtering fill:#0f0

vector-filtering --name-attribute--> name-attribute["named-resistor-color"]
style name-attribute fill:#0f0

vector-filtering --vector-functions--> vector-functions["bird-watcher"]
style vector-functions fill:#0f0

vectors --strings--> strings["log-levels"]
style strings fill:#0f0

vector-filtering --nothingness--> nothingness["name-badges"]
strings --nothingness--> nothingness["name-badges"]
style nothingness fill:#0f0

strings --randomness--> randomness["captains-log"]
style randomness stroke:#f00

functional-programming --regular-expressions--> regular-expressions["regular-chatbot"]
style regular-expressions stroke:#0f0

strings --switch--> switch["blackjack"]
style switch fill:#0f0

lists --functional-programming--> functional-programming["cheese-club?"]
functions --functional-programming--> functional-programming["cheese-club?"]
loops --functional-programming--> functional-programming["cheese-club?"]
style functional-programming stroke:#f00

functional-programming --dataframes--> dataframes["??"]
style dataframes stroke:#f00

dataframes -.factors.-> factors["??"]

dataframes -.data-operations.-> data-operations["??"]

functional-programming --dates-times--> dates-times["booking-up-for-beauty"]
style dates-times stroke:#0f0

vector-functions --functions--> functions["??"]
nothingness --functions--> functions["??"]
style functions stroke:#f00

nothingness --errors--> errors["factory-sensors "]
style errors stroke:#f00

unattached(("docs")) --classes--> classes["N/A"]

unattached --matrices-arrays--> matrices-arrays["N/A"]
style matrices-arrays fill:#0f0

unattached --complex-numbers--> complex-numbers["N/A"]

```

This isn't quite as tangled as it may appear.

## Some future concepts to be slotted in

```mermaid
graph TD
    
todo(("TODO")) -->  macros
todo --> raw-type
todo --> environments
```
