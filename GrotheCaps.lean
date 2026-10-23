import Grothe
import Grothe.LowerAnalytic.CapNodes

/-!
# The node caps certified in Lean (separate build target)

`lake build GrotheCaps` builds the 15 row modules `Grothe/LowerAnalytic/CapRowKK.lean` (60 `native_decide`
range facts, single-threaded, about 15–30 CPU-hours in total) and `lower_bound_of_capsRest`. They are not part of
the default target `Grothe` (CI), because they exceed the CI runner's time and memory. They are verified on a
larger machine; `scripts/caps_stamp.py` records the hash of their sources at that verification, and CI fails if
those sources change without a new verification (see README, "Node caps").
-/
