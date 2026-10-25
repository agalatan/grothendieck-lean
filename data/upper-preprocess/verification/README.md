These records do not establish a successful Lean build of the current tree.

The frozen 17-upper-module and 10-lower-module targeted build used an owned temporary directory on the droplet. That directory and its completed logs were unavailable at recovery. No missing result is reported as PASS. Full branch CI must check the combined tree, including all affected importers.

BUILD_GAP.json pins the exact frozen sources and the missing proof scope. The upper scope precedes integration of the later weighted-comparison master changes. Any later source change requires its own CI coverage.
