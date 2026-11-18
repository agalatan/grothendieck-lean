import HaagerupRefutation.CertData
import HaagerupRefutation.ConvexTransfer
import HaagerupRefutation.HaagerupConstant
import HaagerupRefutation.HeadData
import HaagerupRefutation.Assembly
import HaagerupRefutation.UpperBound

/-!
# HaagerupRefutation

```lean
theorem HaagerupRefutation.upper_bound (facts : ChannelFacts) :
    complexGrothendieckConstant ≤ 140456109 / 100000000 ∧
    complexGrothendieckConstant < 1 / haagerupDagger
```

Start here: `HaagerupRefutation.upper_bound` in `HaagerupRefutation/UpperBound.lean`. Its module docstring states the
definitions the theorem uses and leads from the statement down to the proofs. The theorem is conditional on
`facts : ChannelFacts`, three facts per channel that the article establishes outside Lean.

This package is an isolated, independent check of the upper bound `K_G^ℂ ≤ 1.40456109 < 1/γ†` only. It imports only
Mathlib, never the repository's `Grothe` development.
-/
