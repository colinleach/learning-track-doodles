# Concept tree for C learning mode

## "All models are wrong, but some are useful"

Attributed to George Box, referring to statistical models, but also relevant to our current context.

This is a very fluid plan and will doubtless continue to change frequently!

Boxes with green borders have the exercise + concept PRs submitted.
Blue borders mean only the concept PR is submitted.
Solid green means both are merged.

Red text mean we need to decide between plausible exercises from another tracks.

```mermaid
graph TD
    
start(("Start")) --basics--> basics["lasagna"]
style basics stroke:#00f

basics --booleans--> booleans["pacman-rules"]
style booleans stroke:#00f

basics --numbers--> numbers["freelancer-rates?"]
style numbers stroke:#00f

basics --includes--> includes["??"]
%% style includes stroke:#00f

includes --headers--> headers["??"]
%% style headers stroke:#00f

booleans --conditionals--> conditionals["vehicle-purchase?"]
numbers --conditionals--> conditionals["vehicle-purchase?"]
style conditionals stroke:#00f

numbers --arrays--> arrays["??"]
%% style arrays stroke:#00f

arrays --strings--> strings["log-levels?"]
%% style strings stroke:#00f

conditionals --loops--> loops["interest-is-interesting?"]
style loops stroke:#00f
```

