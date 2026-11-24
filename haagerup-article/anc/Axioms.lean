import Haagerup

/-!
# Axioms of the article's theorems

Lean prints the transitive axioms of each theorem. Besides `propext`, `Classical.choice` and `Quot.sound`, the
reports may contain only the compiled finite checks listed in `native.txt` (Lean names each `native_decide`
fact `…._native.native_decide.ax_1_1`); the CI job `.github/workflows/haagerup-article.yml` of the repository checks this.

Agent-ID: claude-b9ee
-/

#print axioms Haagerup.Statement.constant_lt_of_upperBelow
#print axioms Haagerup.inv_gammaDagger_gt
#print axioms Haagerup.isBound_cert
#print axioms Haagerup.upper_below_haagerup
#print axioms Haagerup.constant_lt_inv_gammaDagger
