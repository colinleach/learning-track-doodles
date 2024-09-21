# Concept tree for Julia learning mode

This is a very fluid plan and will doubtless continue to change frequently!

Boxes in solid red will almost certainly need a new concept exercise created. 
Others marked `??` with red borders can probably fork something suitable from other tracks (TODO).

Boxes with green borders have the exercise + concept PRs submitted.
Solid green means both are merged.

```mermaid
graph TD
    
start(("Start")) --basics--> basics["lasagna"]
style basics stroke:#0f0

basics --booleans--> booleans["annalyns-infiltration"]
style booleans stroke:#0f0

basics --numbers--> numbers["cars-assemble?<br/>currency-exchange?"]
%% style numbers fill:#0f0

booleans -.types.-> types["???"]
%% style types fill:#0f0

types -.type-unions.-> type-unions["???"]
%% style type-unions fill:#0f0

booleans --conditionals--> conditionals["vehicle-purchase?<br/>meltdown-mitigation?"]
%% style conditionals fill:#0f0

numbers --conditionals--> conditionals["vehicle-purchase?<br/>meltdown-mitigation?"]
%% style conditionals fill:#0f0

conditionals --arrays-ranges--> arrays-ranges["elyses-enchantments"]
%% style arrays stroke:#0f0

conditionals -.loops.-> loops["mixed-juices"]
%% style loops stroke:#0f0

loops -.comprehensions.-> comprehensions["boutique-<br/>suggestions?"]
%% style comprehensions stroke:#0f0

arrays-ranges -.vector-filtering.-> vector-filtering["elyses-analytic-enchantments?<br/>bird-watcher?"]
%% style vector-filtering stroke:#0f0

arrays-ranges -.tuples.-> tuples["tisbury-<br/>treasure-<br/>hunt?"]
%% style tuples stroke:#0f0

arrays-ranges -.iterators.-> iterators["plane-<br/>tickets?"]
%% style iterators stroke:#0f0

arrays-ranges -.dicts.-> dicts["inventory-<br/>management?"]
%% style dicts stroke:#0f0

arrays-ranges -.sets.-> sets["ozans-<br/>playlist?"]
%% style sets stroke:#0f0

vector-filtering -.vector-functions.-> vector-functions["??"]
%% style vector-functions stroke:#f00

vector-filtering -.nothingness.-> nothingness["name-badges"]
%% style vector-filtering stroke:#0f0

arrays-ranges -.strings.-> strings["log-levels?<br/>tech-palace?"]
%% style strings stroke:#0f0

arrays-ranges -.chars.-> chars["log-levels?<br/>tech-palace?"]
%% style chars stroke:#0f0

strings -.docstrings.-> docstrings["name-badges"]
%% style docstrings stroke:#0f0

strings -.nothingness.-> nothingness["name-badges"]
%% style nothingness stroke:#0f0

strings -.randomness.-> randomness["captains-log"]
%% style randomness stroke:#0f0

strings -.regular-expressions.-> regular-expressions["regular-<br/>chatbot"]

numbers -.rational-numbers.-> rational-numbers["??"]
%% style rational-numbers fill:#0f0

rational-numbers -.complex-numbers.-> complex-numbers["??"]
%% style complex-numbers fill:#0f0

vector-functions -.matrices-arrays.-> matrices-arrays["??"]
%% style matrices-arrays fill:#f00,color:#fff

matrices-arrays -.dataframes.-> dataframes["??"]

vector-functions -.functions.-> functions["??"]
nothingness -.functions.-> functions["??"]
%% style functions fill:#f00,color:#fff

nothingness -.errors.-> errors["factory-<br/>sensors "]

```
