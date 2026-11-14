import Mathlib.RingTheory.Polynomial.Pochhammer
import Mathlib.Algebra.BigOperators.Group.Finset.Powerset
import Mathlib.Basic.Real.Basic

/-!
# Finite coefficients in the beta-preservation sign argument

This independent target studies the positivity identity from issue #363. Its declarations do not
depend on the numerical Grothendieck bounds or on a sign theorem for inverse kernels.
-/

namespace GrotheSign

open Finset

variable {ι : Type*} [DecidableEq ι]

/-- Sum of the positive integer labels in a subset. -/
def labelSum (j : ι → ℕ) (t : Finset ι) : ℕ := ∑ a ∈ t, j a

/-- Alternating subset coefficient before the numerator-shift identity. -/
noncomputable def resolventSum (t : Finset ι) (j : ι → ℕ) (s : ℝ) (r : ℕ) : ℝ :=
  ∑ u ∈ t.powerset, (-1 : ℝ) ^ (t.card - u.card) *
    (descPochhammer ℝ r).eval (2 * (labelSum j u : ℝ) + u.card) /
      (s + labelSum j u)

/-- The same subset expression with the label sum removed from the numerator. -/
noncomputable def shiftedSum (t : Finset ι) (j : ι → ℕ) (s : ℝ) (r : ℕ) : ℝ :=
  ∑ u ∈ t.powerset, (-1 : ℝ) ^ (t.card - u.card) *
    (descPochhammer ℝ r).eval ((u.card : ℝ) - 2 * s) /
      (s + labelSum j u)

end GrotheSign
