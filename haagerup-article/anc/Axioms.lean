import Haagerup

/-!
# Axioms of the public theorems

Lean prints, for each theorem, the axioms on which its proof depends. The reports may contain only Lean's three standard
axioms `propext`, `Classical.choice` and `Quot.sound`, and the compiled finite checks listed in `native.txt` (Lean
names what a `native_decide` fact adds `<fact>._native.native_decide.ax_1_1`).

  lake env lean Axioms.lean | python3 check_axioms.py
-/

#print axioms Haagerup.isBound_cert
#print axioms Haagerup.certificate_value
#print axioms Haagerup.isBound
#print axioms Haagerup.constant_le
#print axioms Haagerup.inv_gammaDagger_gt
#print axioms Haagerup.constant_lt_inv_gammaDagger
