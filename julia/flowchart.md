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

functions -.types.-> types["??"]
style types stroke:#00f 

types -.composite-types.-> composite-types["land-grab-in-space"]
style composite-types  stroke:#0f0

types -.type-unions.-> type-unions["role-playing-game"]
%% style type-unions fill:#0f0

nothingness -.type-unions.-> type-unions["role-playing-game"]
%% style type-unions fill:#0f0

composite-types -.parametric-types.-> parametric-types["treasure-chest?"]
%% style parametric-types  color:#f00

booleans --conditionals--> conditionals["cars-assemble"]
style conditionals fill:#0f0

numbers --conditionals--> conditionals["cars-assemble"]
style conditionals fill:#0f0

conditionals --vectors--> vectors["elyses-enchantments"]
style vectors fill:#0f0

vectors -.ranges.-> ranges["chessboard"]
style ranges fill:#0f0

ranges -.loops.-> loops["mixed-juices"]
style loops fill:#0f0

ranges -.strings.-> strings["log-levels"]
style strings fill:#0F0

ranges -.vector-operations.-> vector-operations["bird-watcher"]
style vector-operations fill:#0f0

matrices-arrays -.comprehensions.-> comprehensions["boutique-suggestions?<br/>plane-tickets?"]
style comprehensions color:#f00

functions -.nothingness.-> nothingness["name-badges"]
style nothingness fill:#0f0

functions -.randomness.-> randomness["captains-log"]
style randomness fill:#0f0

randomness -.statistics.-> statistics["(none planned)"]
style statistics stroke:#0f0

strings -.tuples.-> tuples["tisbury-<br/>treasure-<br/>hunt?"]
style tuples fill:#0f0

loops -.pairs-and-dicts.-> pairs-and-dicts["inventory-<br/>management"]
style pairs-and-dicts fill:#0f0

loops -.sets.-> sets["cater-waiter"]
style sets fill:#0f0

strings -.chars.-> chars["squeaky-clean"]
style chars fill:#0f0

loops -.iterators.-> iterators["plane-tickets?<br/>fibonacci-iterator?"]
style iterators color:#f00

strings -.regular-expressions.-> regular-expressions["regular-chatbot?<br/>stage-heralding?"]
style regular-expressions color:#f00

strings -.dates-times.-> dates-times["?"]
style dates-times stroke:#00f

numbers -.bitwise-operations.-> bitwise-operations["secrets?"]
%% style bitwise-operations fill:#0f0

vector-operations -.matrices-arrays.-> matrices-arrays["??"]
%% style matrices-arrays fill:#f00,color:#fff

matrices-arrays -.dataframes.-> dataframes["??"]

matrices-arrays -.linear-algebra.-> linear-algebra["??"]

pairs-and-dicts -.dict-functions.-> dict-functions["mecha-munch-management"]
%% style dict-functions stroke:#00f

pairs-and-dicts -.functions.-> functions["locomotive-engineer"]
style functions fill:#0f0

vector-operations -.functions.-> functions["locomotive-engineer"]
style functions fill:#0f0

tuples -.functions.-> functions["locomotive-engineer"]
style functions fill:#0f0

functions -.higher-order-functions.-> higher-order-functions["secret-agent?"]
%% style higher-order-functions fill:#f00,color:#fff

type-unions -.multiple-dispatch.-> multiple-dispatch["encounters"]
%% style multiple-dispatch color:#f00

parametric-types -.multiple-dispatch.-> multiple-dispatch["encounters"]
%% style multiple-dispatch color:#f00

functions -.complex-numbers.-> complex-numbers["tracking-turntable"]
style complex-numbers fill:#0f0

functions -.function-composition.-> function-composition["high-school-sweetheart"]
style function-composition fill:#0f0

strings -.function-composition.-> function-composition["high-school-sweetheart"]
style function-composition fill:#0f0

nothingness -.errors.-> errors["factory-<br/>sensors "]

numbers -.rational-numbers.-> rational-numbers["??"]
style rational-numbers stroke:#0f0

```

## Other concepts to add

- macros
- modules
- and more??
