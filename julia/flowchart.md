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
style basics stroke:#0f0

basics --booleans--> booleans["annalyns-infiltration"]
style booleans stroke:#0f0

basics --numbers--> numbers["currency-exchange"]
style numbers stroke:#0f0

booleans -.types.-> types["valentines-day?"]
%% style types stroke:#0f0 

types -.type-unions.-> type-unions["password-lock?"]
%% style type-unions fill:#0f0

types -.structs.-> structs["land-grab-in-space?<br/>need-for-speed?"]
%% style structs fill:#0f0

booleans --conditionals--> conditionals["vehicle-purchase?<br/>meltdown-mitigation?"]
style conditionals color:#f00

numbers --conditionals--> conditionals["vehicle-purchase?<br/>meltdown-mitigation?"]
style conditionals color:#f00

conditionals --arrays--> arrays["elyses-enchantments"]
style arrays stroke:#00f

strings -.loops.-> loops["making-the-grade"]
style loops stroke:#00f

ranges -.loops.-> loops["making-the-grade"]
style loops stroke:#00f

arrays -.strings.-> strings["log-levels?<br/>tech-palace?"]
style strings color:#f00

%% ranges -.loops.-> loops["mixed-juices?<br/>making-the-grade?"]
%% style loops stroke:#0f0

arrays -.array-operations.-> array-operations["elyses-analytic-enchantments?<br/>bird-watcher?"]
style array-operations color:#f00

arrays -.ranges.-> ranges["chessboard?"]
style ranges stroke:#00f

strings -.comprehensions.-> comprehensions["boutique-<br/>suggestions?"]
%% style comprehensions stroke:#0f0

arrays -.tuples.-> tuples["tisbury-<br/>treasure-<br/>hunt?"]
style tuples stroke:#00f

%% ranges -.iterators.-> iterators["plane-<br/>tickets?"]
%% %% style iterators stroke:#0f0

arrays -.dicts-and-pairs.-> dicts-and-pairs["inventory-<br/>management?"]
style dicts-and-pairs stroke:#00f

arrays -.sets.-> sets["cater-waiter"]
style sets stroke:#0f0

%% array-operations -.vector-functions.-> vector-functions["??"]
%% %% style vector-functions color:#f00

array-operations -.nothingness.-> nothingness["name-badge"]
style nothingness stroke:#00f

strings -.chars.-> chars["squeaky-clean"]
style chars stroke:#0f0

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

array-operations -.matrices-arrays.-> matrices-arrays["??"]
%% style matrices-arrays fill:#f00,color:#fff

matrices-arrays -.dataframes.-> dataframes["??"]

%% vector-functions -.functions.-> functions["??"]

array-operations -.functions.-> functions["??"]
style functions stroke:#00f

%% arrays -.broadcasting.-> broadcasting["??"]
%% %% style broadcasting fill:#f00,color:#fff

functions -.function-composition.-> function-composition["secret-agent?"]
%% style function-composition fill:#f00,color:#fff

functions -.higher-order-functions.-> higher-order-functions["secret-agent?"]
%% style higher-order-functions fill:#f00,color:#fff

nothingness -.errors.-> errors["factory-<br/>sensors "]

numbers -.rational-numbers.-> rational-numbers["??"]
style rational-numbers stroke:#00f

rational-numbers -.complex-numbers.-> complex-numbers["??"]
style complex-numbers stroke:#00f

```
