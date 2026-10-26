import Grothe
import Grothe.LowerAnalytic.CapNodes

/-!
# The node caps certified in Lean (separate build target)

`lake build GrotheCaps` builds the default development and `CapNodes`, including the 15 heavy row modules
(60 single-threaded native range facts) and `lower_bound_of_capsRest`. The default target `Grothe`
excludes those heavy modules and their final assembly. Ordinary CI checks the committed source stamp
(`scripts/caps_stamp.py --check`). A stale stamp on a `ready/` delivery dispatches the heavy CI job on
the droplet runner: it builds both targets and checks both axiom reports, then commits the verified
stamp and repeats the ready check (README "Node caps").
-/
