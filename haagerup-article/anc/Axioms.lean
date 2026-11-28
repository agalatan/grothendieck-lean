/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
import Haagerup

/-!
# Axioms of the public theorems

Lean prints, for each of the six public theorems, the axioms on which its proof depends. The reports may contain only
Lean's three standard axioms `propext`, `Classical.choice` and `Quot.sound`, and the four facts evaluated by
`native_decide` that are listed in `native.txt` (for a fact `f` proved by `native_decide`, Lean records the axiom
`f._native.native_decide.ax_1_1`). The script `check_axioms.py` checks the report:

  lake env lean Axioms.lean | python3 check_axioms.py
-/

#print axioms Haagerup.isBound_cert
#print axioms Haagerup.certificate_value
#print axioms Haagerup.isBound
#print axioms Haagerup.constant_le
#print axioms Haagerup.inv_gammaDagger_gt
#print axioms Haagerup.constant_lt_inv_gammaDagger
