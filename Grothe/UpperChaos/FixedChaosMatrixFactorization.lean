import Grothe.UpperChaos.FixedChaosMatrix

/-!
# Holomorphic factorization of the production smoothing recurrence

The four-index moment is the product of two two-index moments, one for each
complex degree. This separates the two factors before numerical evaluation.
Agent-ID: codex-7c2e
-/

namespace Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

/-- The unnormalized moment between two holomorphic two-variable monomials.
The first pair gives the tested row degrees; the second gives the input column degrees. -/
def matrixMoment2 {R : Type*} [Semiring R] (u v w : R) :
    (ℕ × ℕ) → (ℕ × ℕ) → R
  | (p + 1, r), (a, c) =>
      u * a * matrixMoment2 u v w (p, r) (a - 1, c) +
      v * c * matrixMoment2 u v w (p, r) (a, c - 1)
  | (0, r + 1), (a, c) =>
      v * a * matrixMoment2 u v w (0, r) (a - 1, c) +
      w * c * matrixMoment2 u v w (0, r) (a, c - 1)
  | (0, 0), i => if i = (0, 0) then 1 else 0
termination_by j _ => j.1 + j.2
decreasing_by
  all_goals omega

/-- The complete recurrence separates into its holomorphic and
antiholomorphic degree pairs. Commutativity is used only to collect the two
independent scalar factors. -/
theorem matrixRecurrence_eq_matrixMoment2 {R : Type*} [CommSemiring R]
    (u v w : R) (j i : Idx2) :
    matrixRecurrence u v w j i =
      matrixMoment2 u v w (j.1.1, j.2.1) (i.1.1, i.2.1) *
        matrixMoment2 u v w (j.1.2, j.2.2) (i.1.2, i.2.2) := by
  rcases j with ⟨⟨p, q⟩, r, s⟩
  rcases i with ⟨⟨a, b⟩, c, d⟩
  cases p with
  | succ p =>
    simp only [matrixRecurrence, matrixMoment2]
    rw [matrixRecurrence_eq_matrixMoment2 u v w ((p, q), (r, s))
        ((a - 1, b), (c, d)),
      matrixRecurrence_eq_matrixMoment2 u v w ((p, q), (r, s))
        ((a, b), (c - 1, d))]
    ring
  | zero =>
    cases q with
    | succ q =>
      simp only [matrixRecurrence, matrixMoment2]
      rw [matrixRecurrence_eq_matrixMoment2 u v w ((0, q), (r, s))
          ((a, b - 1), (c, d)),
        matrixRecurrence_eq_matrixMoment2 u v w ((0, q), (r, s))
          ((a, b), (c, d - 1))]
      ring
    | zero =>
      cases r with
      | succ r =>
        simp only [matrixRecurrence, matrixMoment2]
        rw [matrixRecurrence_eq_matrixMoment2 u v w ((0, 0), (r, s))
            ((a - 1, b), (c, d)),
          matrixRecurrence_eq_matrixMoment2 u v w ((0, 0), (r, s))
            ((a, b), (c - 1, d))]
        ring
      | zero =>
        cases s with
        | succ s =>
          simp only [matrixRecurrence, matrixMoment2]
          rw [matrixRecurrence_eq_matrixMoment2 u v w ((0, 0), (0, s))
              ((a, b - 1), (c, d)),
            matrixRecurrence_eq_matrixMoment2 u v w ((0, 0), (0, s))
              ((a, b), (c, d - 1))]
          simp only [matrixMoment2]
          ring
        | zero =>
          by_cases ha : a = 0 <;> by_cases hb : b = 0 <;>
            by_cases hc : c = 0 <;> by_cases hd : d = 0 <;>
            simp [matrixRecurrence, matrixMoment2, ha, hb, hc, hd]
termination_by tdeg j
decreasing_by
  all_goals simp only [tdeg]
  all_goals omega

/-- The actual normalized smoothing entry uses the two independent moments
with the original four-factor Hermite normalization. -/
theorem actualEntry_eq_matrixMoment2 (j i : Idx2) :
    actualEntry j i = (nrm2 j : ℂ) * (nrm2 i : ℂ) *
      (matrixMoment2 (m00 : ℂ) (m01 : ℂ) (m11 : ℂ)
        (j.1.1, j.2.1) (i.1.1, i.2.1) *
      matrixMoment2 (m00 : ℂ) (m01 : ℂ) (m11 : ℂ)
        (j.1.2, j.2.2) (i.1.2, i.2.2)) := by
  rw [actualEntry_eq_matrixRecurrence, matrixRecurrence_eq_matrixMoment2]

end Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

/-- info: 'Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.actualEntry_eq_matrixMoment2' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.actualEntry_eq_matrixMoment2
