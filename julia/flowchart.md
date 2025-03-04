# Concept tree for Julia learning mode

This is a very fluid plan and will doubtless continue to change frequently!

<!-- Boxes in solid red will almost certainly need a new concept exercise created. 
Others marked `??` with red borders can probably fork something suitable from other tracks (TODO). -->

Boxes with green borders have the exercise + concept PRs submitted.
Blue borders mean only the concept PR is submitted.
Solid green means both are merged.

Red text mean we need to decide between an existing Julia draft, or a different exercise from another track.

```mermaid
graph TD
    
start(("Start")) --basics--> basics["lasagna"]
style basics fill:#0f0

basics --booleans--> booleans["annalyns-infiltration"]
style booleans fill:#0f0

basics --numbers--> numbers["currency-exchange"]
style numbers fill:#0f0

booleans -.types.-> types["valentines-day?"]
%% style types stroke:#0f0 

types -.type-unions.-> type-unions["password-lock?"]
%% style type-unions fill:#0f0

types -.structs.-> structs["land-grab-in-space?<br/>need-for-speed?"]
style structs  color:#f00

booleans --conditionals--> conditionals["cars-assemble"]
style conditionals fill:#0f0

numbers --conditionals--> conditionals["cars-assemble"]
style conditionals fill:#0f0

conditionals --vectors--> vectors["elyses-enchantments"]
style vectors fill:#0f0

strings -.loops.-> loops["making-the-grade"]
style loops stroke:#00f

ranges -.strings.-> strings["log-levels"]
%% style strings 

ranges -.vector-operations.-> vector-operations["bird-watcher"]
style vector-operations stroke:#00f

vectors -.ranges.-> ranges["chessboard"]
style ranges fill:#0f0

strings -.comprehensions.-> comprehensions["boutique-<br/>suggestions?"]
%% style comprehensions stroke:#0f0

vectors -.tuples.-> tuples["tisbury-<br/>treasure-<br/>hunt?"]
style tuples stroke:#00f

%% ranges -.iterators.-> iterators["plane-<br/>tickets?"]
%% %% style iterators stroke:#0f0

vectors -.dicts-and-pairs.-> dicts-and-pairs["inventory-<br/>management?"]
style dicts-and-pairs stroke:#00f

vectors -.sets.-> sets["cater-waiter"]
style sets stroke:#0f0

%% vector-operations -.vector-functions.-> vector-functions["??"]
%% %% style vector-functions color:#f00

vector-operations -.nothingness.-> nothingness["name-badge"]
style nothingness stroke:#00f

comprehensions -.chars.-> chars["squeaky-clean"]

loops -.iterators.-> iterators["plane-tickets?<br/>fibonacci-iterator?"]
style iterators color:#f00

strings -.docstrings.-> docstrings["name-badges"]
%% style docstrings stroke:#0f0

strings -.nothingness.-> nothingness["name-badges"]
style nothingness stroke:#00f

strings -.randomness.-> randomness["captains-log"]
style randomness stroke:#00f

randomness -.statistics.-> statistics["??"]
style statistics stroke:#00f

strings -.regular-expressions.-> regular-expressions["regular-chatbot?<br/>stage-heralding?"]
style regular-expressions color:#f00

numbers -.bitwise-operations.-> bitwise-operations["secrets?"]
%% style bitwise-operations fill:#0f0

vector-operations -.matrices-arrays.-> matrices-arrays["??"]
%% style matrices-arrays fill:#f00,color:#fff

matrices-arrays -.dataframes.-> dataframes["??"]

%% vector-functions -.functions.-> functions["??"]

vector-operations -.functions.-> functions["??"]
style functions stroke:#00f

%% vectors -.broadcasting.-> broadcasting["??"]
%% %% style broadcasting fill:#f00,color:#fff

functions -.function-composition.-> function-composition["high-school-sweetheart"]
style function-composition fill:#0f0

functions -.higher-order-functions.-> higher-order-functions["secret-agent?"]
%% style higher-order-functions fill:#f00,color:#fff

functions -.multiple-dispatch.-> multiple-dispatch["encounters?"]
%% style multiple-dispatch fill:#f00,color:#fff

nothingness -.errors.-> errors["factory-<br/>sensors "]

numbers -.rational-numbers.-> rational-numbers["??"]
style rational-numbers stroke:#00f

rational-numbers -.complex-numbers.-> complex-numbers["??"]
style complex-numbers stroke:#00f

```
