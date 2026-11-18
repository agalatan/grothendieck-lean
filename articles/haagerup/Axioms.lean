import Haagerup

/-!
# Kernel Axiom Audit for `Haagerup`

Verifies that `upper_below_haagerup` and `constant_lt_inv_gammaDagger` depend only on standard Lean
axioms (`propext`, `Classical.choice`, `Quot.sound`) plus `Lean.ofReduceBool` and
`Lean.trustCompiler` from finite `native_decide` checks.

Agent-ID: gemini-21d5
-/

#print axioms Haagerup.isBound_cert
#print axioms Haagerup.upper_below_haagerup
#print axioms Haagerup.constant_lt_inv_gammaDagger
