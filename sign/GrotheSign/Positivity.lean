import GrotheSign.Algebra
import GrotheSign.IntegrandIdentity
import GrotheSign.MomentIntegral

/-!
# The beta-preservation positivity identity

For any finite set of positive integer labels and any positive real parameter, the alternating
falling-factorial resolvent coefficient is exactly a factorial times a strictly positive integral.
This is the all-orders coefficient identity from issue #363. It is independent of the inverse
kernel sign theorem, the beta-preservation theorem, and the Grothendieck bound certificates.
-/

set_option warningAsError true

namespace GrotheSign

open Finset MeasureTheory

variable {ι : Type*} [DecidableEq ι]

/-- The finite numerator identity integrates to the exact resolvent identity. -/
theorem resolventSum_eq_positiveIntegral (t : Finset ι) (j : ι → ℕ) {s : ℝ} (r : ℕ)
    (hs : 0 < s) (hr : r < t.card) (he : Even (t.card + r)) :
    resolventSum t j s r =
      (r.factorial : ℝ) * ∫ z in (0 : ℝ)..1, positiveIntegrand t j s r z := by
  rw [resolventSum_eq_shiftedSum t j hs hr, shiftedSum_eq_integral t j r hs,
    ← intervalIntegral.integral_const_mul]
  apply intervalIntegral.integral_congr
  intro z _
  dsimp only
  rw [numerator_identity t j s z r he]
  unfold positiveIntegrand
  ring

/-- Strict positivity at every admissible order, with no bound on the number of labels. -/
theorem resolventSum_pos (t : Finset ι) (j : ι → ℕ) {s : ℝ} (r : ℕ)
    (hs : 0 < s) (hr : r < t.card) (he : Even (t.card + r))
    (hj : ∀ a ∈ t, 0 < j a) : 0 < resolventSum t j s r := by
  rw [resolventSum_eq_positiveIntegral t j r hs hr he]
  exact mul_pos (Nat.cast_pos.mpr (Nat.factorial_pos r))
    (integral_positiveIntegrand_pos t j r hs hj)

/-- The labeled nonlinear coefficient for the Euler-resolvent generator `k / (s + k)`. -/
noncomputable def resolventCoefficient (t : Finset ι) (j : ι → ℕ) (s : ℝ) : ℝ :=
  2 * s * ((labelSum j t : ℝ) + 1) * resolventSum t j s (t.card - 2)

private lemma critical_parity (m : ℕ) (hm : 2 ≤ m) : Even (m + (m - 2)) := by
  exact ⟨m - 1, by omega⟩

/-- Exact positive-integral formula for every nonlinear labeled coefficient. -/
theorem resolventCoefficient_eq_positiveIntegral (t : Finset ι) (j : ι → ℕ) {s : ℝ}
    (hs : 0 < s) (ht : 2 ≤ t.card) :
    resolventCoefficient t j s =
      2 * s * ((labelSum j t : ℝ) + 1) * ((t.card - 2).factorial : ℝ) *
        ∫ z in (0 : ℝ)..1, positiveIntegrand t j s (t.card - 2) z := by
  unfold resolventCoefficient
  rw [resolventSum_eq_positiveIntegral t j (t.card - 2) hs (by omega)
    (critical_parity t.card ht)]
  ring

/-- Every nonlinear labeled Euler-resolvent coefficient is strictly positive. -/
theorem resolventCoefficient_pos (t : Finset ι) (j : ι → ℕ) {s : ℝ}
    (hs : 0 < s) (ht : 2 ≤ t.card) (hj : ∀ a ∈ t, 0 < j a) :
    0 < resolventCoefficient t j s := by
  unfold resolventCoefficient
  refine mul_pos ?_ (resolventSum_pos t j (t.card - 2) hs (by omega)
    (critical_parity t.card ht) hj)
  exact mul_pos (mul_pos (by norm_num) hs) (by positivity)

end GrotheSign
