# R Learning Track Drafts

This is currently (late 2025) the most up-to-date version of attempts to add a Learning Syllabus to Ecercism's [R track](https://exercism.org/tracks/r).

See also [Issue 252](https://github.com/exercism/r/issues/252) on GitHub.

There are [Google Sheets](https://docs.google.com/spreadsheets/d/1xW5WDL5Xp2yQ9ZFJY-oVj1c19kNkZLwCiSEjH1H2SGI) to track progress on implementation, though these are currently _very_ outdated.

The original drafts of these documents and exercises were limited to base R, as this was all the Exercism R test runner supported at the time.

The `tidyverse` packages were added to the test runner in [September 2023](https://github.com/exercism/r-test-runner/pull/71), including:

- `purrr` for improved functional programming.
- `stringr`for cleaner and more flexible string manipulation.
- `readr` for data I/O.
- `tibble` as a more modern DataFrame replacement.
- `dplyr` for data cleanup.
- `lubridate`, for date/time manipulation (though we failed to add this to the [CI tests](https://github.com/colinleach/r/blob/main/.github/workflows/ci.yml)).

None of these are mentioned in the original draft concepts, so this will be a major area needing improvement.
