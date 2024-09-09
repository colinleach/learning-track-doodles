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

booleans --numbers--> numbers["cars-assemble?"]
%% style numbers fill:#0f0

booleans --types--> types["???"]
%% style types fill:#0f0

numbers --conditionals--> conditionals["vehicle-purchase?"]
%% style conditionals fill:#0f0

conditionals --arrays-ranges--> arrays-ranges["elyses-enchantments"]
%% style arrays stroke:#0f0

conditionals -.loops.-> loops["mixed-juices"]
%% style loops stroke:#0f0

loops -.comprehensions.-> comprehensions["???"]
%% style comprehensions stroke:#0f0

%% name-attribute -.lists.-> lists["need-for-speed"]

arrays-ranges -.vector-filtering.-> vector-filtering["elyses-analytic-enchantments?<br/>bird-watcher?"]
%% style vector-filtering stroke:#0f0

%% vector-filtering -.name-attribute.-> name-attribute["??"]
%% style name-attribute fill:#f00,color:#fff

vector-filtering -.vector-functions.-> vector-functions["??"]
%% style vector-functions stroke:#f00

vector-filtering -.nothingness.-> nothingness["name-badges"]
%% style vector-filtering stroke:#0f0

arrays-ranges -.strings.-> strings["log-levels?<br/>tech-palace?"]
%% style strings stroke:#0f0

strings -.docstrings.-> docstrings["name-badges"]
%% style docstrings stroke:#0f0

strings -.nothingness.-> nothingness["name-badges"]
%% style nothingness stroke:#0f0

strings -.randomness.-> randomness["captains-log"]
%% style randomness stroke:#0f0

strings -.regular-expressions.-> regular-expressions["regular-chatbot"]

vector-functions -.matrices-arrays.-> matrices-arrays["??"]
%% style matrices-arrays fill:#f00,color:#fff

%% style apply-functions fill:#f00,color:#fff

%% vector-functions -.dataframes.-> dataframes["??"]
%% style dataframes fill:#f00,color:#fff

matrices-arrays -.dataframes.-> dataframes
%% dataframes -.factors.-> factors["??"]
%% style factors fill:#f00,color:#fff

%% dataframes -.apply-functions.-> apply-functions["??"]

vector-functions -.functions.-> functions["??"]
nothingness -.functions.-> functions["??"]
%% style functions fill:#f00,color:#fff

nothingness -.errors.-> errors["factory-sensors "]

```
