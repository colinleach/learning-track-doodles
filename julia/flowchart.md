# Concept tree for Julia learning mode

This is a very fluid plan and will doubtless continue to change frequently!

<!-- Boxes in solid red will almost certainly need a new concept exercise created. 
Others marked `??` with red borders can probably fork something suitable from other tracks (TODO). -->

Boxes with green borders have the exercise + concept PRs submitted.
Solid green means both are merged.

```mermaid
graph TD
    
start(("Start")) --basics--> basics["lasagna"]
style basics stroke:#0f0

basics --booleans--> booleans["annalyns-infiltration"]
style booleans stroke:#0f0

basics --numbers--> numbers["currency-exchange"]
%% style numbers fill:#0f0

booleans -.types.-> types["???"]
%% style types fill:#0f0

types -.type-unions.-> type-unions["???"]
%% style type-unions fill:#0f0

booleans --conditionals--> conditionals["vehicle-purchase?<br/>meltdown-mitigation?"]
%% style conditionals fill:#0f0

numbers --conditionals--> conditionals["vehicle-purchase?<br/>meltdown-mitigation?"]
%% style conditionals fill:#0f0

conditionals --arrays--> arrays["elyses-enchantments"]
%% style arrays stroke:#0f0

strings -.loops.-> loops["making-the-grade"]
%% style loops stroke:#0f0

ranges -.loops.-> loops["making-the-grade"]
%% style loops stroke:#0f0

arrays -.strings.-> strings["log-levels?<br/>tech-palace?"]
%% style strings stroke:#0f0

%% ranges -.loops.-> loops["mixed-juices?<br/>making-the-grade?"]
%% style loops stroke:#0f0

loops -.comprehensions.-> comprehensions["boutique-<br/>suggestions?"]
%% style comprehensions stroke:#0f0

arrays -.vector-filtering.-> vector-filtering["elyses-analytic-enchantments?<br/>bird-watcher?"]
%% style vector-filtering stroke:#0f0

arrays -.ranges.-> ranges["chessboard?"]
%% style ranges stroke:#0f0

arrays -.tuples.-> tuples["tisbury-<br/>treasure-<br/>hunt?"]
%% style tuples stroke:#0f0

%% ranges -.iterators.-> iterators["plane-<br/>tickets?"]
%% %% style iterators stroke:#0f0

loops -.iterators.-> iterators["plane-<br/>tickets?"]
%% style iterators stroke:#0f0

arrays -.dicts-and-pairs.-> dicts-and-pairs["inventory-<br/>management?"]
%% style dicts-and-pairs stroke:#0f0

arrays -.sets.-> sets["ozans playlist?<br/>cater-waiter?"]
%% style sets stroke:#0f0

vector-filtering -.vector-functions.-> vector-functions["??"]
%% style vector-functions stroke:#f00

vector-filtering -.nothingness.-> nothingness["name-badge"]
%% style vector-filtering stroke:#0f0

strings -.chars.-> chars["squeaky-clean"]
style chars stroke:#0f0

comprehensions -.chars.-> chars["squeaky-clean"]

strings -.docstrings.-> docstrings["name-badges"]
%% style docstrings stroke:#0f0

strings -.nothingness.-> nothingness["name-badges?<br/>restaurant-rozalynn?"]
%% style nothingness stroke:#0f0

strings -.randomness.-> randomness["captains-log"]
%% style randomness stroke:#0f0

strings -.regular-expressions.-> regular-expressions["regular-<br/>chatbot"]

numbers -.bitwise-operations.-> bitwise-operations["secrets?"]
%% style bitwise-operations fill:#0f0

vector-functions -.matrices-arrays.-> matrices-arrays["??"]
%% style matrices-arrays fill:#f00,color:#fff

matrices-arrays -.dataframes.-> dataframes["??"]

vector-functions -.functions.-> functions["??"]
nothingness -.functions.-> functions["??"]
%% style functions fill:#f00,color:#fff

functions -.broadcasting.-> broadcasting["??"]
%% style broadcasting fill:#f00,color:#fff

functions -.higher-order-functions.-> higher-order-functions["??"]
%% style higher-order-functions fill:#f00,color:#fff

nothingness -.functions.-> functions["??"]

nothingness -.errors.-> errors["factory-<br/>sensors "]

numbers -.rational-numbers.-> rational-numbers["??"]
%% style rational-numbers fill:#0f0

rational-numbers -.complex-numbers.-> complex-numbers["??"]
%% style complex-numbers fill:#0f0

```
