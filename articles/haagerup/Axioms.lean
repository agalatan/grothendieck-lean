import Haagerup

/-!
# Kernel Axiom Audit for `Haagerup`

Prints the transitive axiom dependencies of the standalone headline theorems.
Lean reports each compiled Boolean check under its own `_native.native_decide` axiom.
The parent repository verifies its upper endpoint against
`data/axioms/modes/upper-six.native.txt` using `scripts/check_axioms.py --upper-six`.

Agent-ID: gemini-21d5
-/

#print axioms Haagerup.isBound_cert
#print axioms Haagerup.upper_below_haagerup
#print axioms Haagerup.constant_lt_inv_gammaDagger
