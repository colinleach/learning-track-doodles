# Concept tree for Julia learning mode

This is a very fluid plan and will doubtless continue to change frequently!

Boxes with green borders have the exercise + concept PRs submitted.
Blue borders mean only the concept PR is submitted.
Solid green means both are merged.

Red text mean we need to decide between plausible exercises from another tracks.

```mermaid
graph TD
    
start(("Start")) --basics--> basics["lasagna"]
style basics fill:#0f0

basics --booleans--> booleans["annalyns-infiltration"]
style booleans fill:#0f0

basics --numbers--> numbers["currency-exchange"]
style numbers fill:#0f0

types --dates-times--> dates-times["booking-up-for-beauty"]
style dates-times fill:#0f0

functions --types--> types["grading-guru"]
style types fill:#0f0 

types --composite-types--> composite-types["land-grab-in-space"]
style composite-types  fill:#0f0

composite-types --parametric-types--> parametric-types["treasure-chest"]
nothingness --parametric-types--> parametric-types["treasure-chest"]
style parametric-types  fill:#0f0

parametric-types --type-unions--> type-unions["role-playing-game"]
style type-unions fill:#0f0


booleans --conditionals--> conditionals["cars-assemble"]
style conditionals fill:#0f0

numbers --conditionals--> conditionals["cars-assemble"]
style conditionals fill:#0f0

conditionals --vectors--> vectors["elyses-enchantments"]
style vectors fill:#0f0

vectors --ranges--> ranges["chessboard"]
style ranges fill:#0f0

ranges --loops--> loops["mixed-juices"]
style loops fill:#0f0

ranges --strings--> strings["log-levels"]
style strings fill:#0F0

ranges --vector-operations--> vector-operations["bird-watcher"]
style vector-operations fill:#0f0

functions --nothingness--> nothingness["name-badges"]
style nothingness fill:#0f0

functions --randomness--> randomness["captains-log"]
style randomness fill:#0f0

randomness --statistics--> statistics["(none planned)"]
style statistics stroke:#0f0

strings --tuples--> tuples["tisbury-<br/>treasure-<br/>hunt?"]
style tuples fill:#0f0

loops --pairs-and-dicts--> pairs-and-dicts["inventory-<br/>management"]
style pairs-and-dicts fill:#0f0

loops --sets--> sets["cater-waiter"]
style sets fill:#0f0

strings --chars--> chars["squeaky-clean"]
style chars fill:#0f0

loops --iterators--> iterators["plane-tickets?<br/>fibonacci-iterator?"]
style iterators color:#f00

conditionals --bitwise-operations--> bitwise-operations["secrets"]
style bitwise-operations fill:#0f0

function-composition --multi-dimensional-arrays--> multi-dimensional-arrays["??"]
style multi-dimensional-arrays stroke:#00f

multi-dimensional-arrays --linear-algebra--> linear-algebra["??"]
%%style linear-algebra stroke:#00f

pairs-and-dicts --dict-functions--> dict-functions["mecha-munch-management"]
%% style dict-functions stroke:#00f

pairs-and-dicts --functions--> functions["locomotive-engineer"]
style functions fill:#0f0

vector-operations --functions--> functions["locomotive-engineer"]
style functions fill:#0f0

tuples --functions--> functions["locomotive-engineer"]
style functions fill:#0f0

multi-dimensional-arrays --higher-order-functions--> higher-order-functions["??"]
style higher-order-functions stroke:#00f

parametric-types --multiple-dispatch--> multiple-dispatch["encounters"]
style multiple-dispatch fill:#0f0

functions --complex-numbers--> complex-numbers["tracking-turntable"]
style complex-numbers fill:#0f0

functions --function-composition--> function-composition["high-school-sweetheart"]
strings --function-composition--> function-composition["high-school-sweetheart"]
style function-composition fill:#0f0

nothingness --errors--> errors["factory-<br/>sensors "]
composite-types --errors--> errors["factory-<br/>sensors "]
style errors fill:#0f0

nothingness --regular-expressions--> regular-expressions["regular-chatbot"]
style regular-expressions fill:#0f0

loops --rational-numbers--> rational-numbers["problematic-probabilities"]
style rational-numbers fill:#0f0

multi-dimensional-arrays --comprehensions--> comprehensions["boutique-suggestions?<br/>plane-tickets?"]
style comprehensions stroke:#00f

```

## Other concepts to add

- macros
- modules
- and more??
