import Grothe
import Grothe.LowerAnalytic.CapNodes

/-!
# The node caps certified in Lean (separate build target)

`lake build GrotheCaps` builds the default development and `CapNodes`, including the 15 heavy row modules
(60 single-threaded native range facts) and `lower_bound_of_capsRest`. The default target `Grothe`
excludes those heavy modules and their final assembly. For Lean-relevant checks, CI replays `GrotheCaps`
and checks its axiom report when the verified build-cache marker matches the current computation sources.
A missing or stale marker dispatches the runner's heavy build and both axiom audits before the cache is
marked and saved (`scripts/caps_stamp.py`, README "Node caps"). Later checks and the master warm run
reuse that build; no separate manual droplet verification is needed.
-/
