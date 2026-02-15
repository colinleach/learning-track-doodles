# Concept tree for R learning mode

## Some that are already in progress or planned

This is a very fluid plan and will doubtless continue to change frequently!

Boxes in solid red will almost certainly need a new concept exercise created. 
Others marked `??` with red borders can probably fork something suitable from other tracks (TODO).

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

conditionals --switch--> switch["blackjack"]
style switch stroke:#0f0

vectors --set-operations--> set-operations["ozans-playlist"]
style set-operations fill:#0f0

name-attribute --lists--> lists["need-for-speed"]

vectors --vector-filtering--> vector-filtering["elyses-analytic-enchantments"]
style vector-filtering fill:#0f0

vector-filtering --name-attribute--> name-attribute["??"]
style name-attribute fill:#f00,color:#fff

vector-filtering --vector-functions--> vector-functions["bird-watcher?"]
style vector-functions stroke:#0f0

vector-filtering --nothingness--> nothingness["name-badges"]
style vector-filtering stroke:#0f0

vectors --strings--> strings["log-levels"]
style strings stroke:#0f0

strings --nothingness--> nothingness["name-badges"]
style nothingness stroke:#0f0

strings --randomness--> randomness["captains-log"]
style randomness stroke:#0f0

strings --regular-expressions--> regular-expressions["regular-chatbot"]

lists --lapply-sapply--> lapply-sapply["??"]
vector-functions --lapply-sapply--> lapply-sapply["??"]

lapply-sapply --functional-programming--> functional-programming["??"]

vector-functions --matrices-arrays--> matrices-arrays["??"]
style matrices-arrays fill:#f00,color:#fff

style apply-functions fill:#f00,color:#fff

lapply-sapply --dataframes--> dataframes["??"]
style dataframes fill:#f00,color:#fff

matrices-arrays --dataframes--> dataframes
dataframes -.factors.-> factors["??"]
style factors fill:#f00,color:#fff

dataframes -.apply-functions.-> apply-functions["??"]

vector-functions --functions--> functions["??"]
nothingness --functions--> functions["??"]
style functions fill:#f00,color:#fff

nothingness --errors--> errors["factory-sensors "]

```

This isn't quite as tangled as it may appear.

## Some future concepts to be slotted in

```mermaid
graph TD
    
todo(("TODO")) --> classes
todo --> dates-times
todo --> macros
todo --> raw-type
todo --> environments
```

