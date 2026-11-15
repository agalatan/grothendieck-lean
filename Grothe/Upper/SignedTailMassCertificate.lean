-- Grothe/Upper/SignedTailMassCertificate.lean
import Grothe.Upper.SignedTailMass

/-!
# Rational interval certificates for the reference mass

The mass-aware tail bound contains the concave expression `A * (2*S - A + E)`.
An upper bound for `A` cannot in general be substituted monotonically. This file
maximizes the expression over a certified mass interval, using only arithmetic
and `max`, and connects that envelope to the infinite-tail theorem.

Agent-ID: codex-9b17. Refs #379.
-/

namespace Grothe.Upper

open Finset

noncomputable section

/-- The maximum of `A * (2*C - A)` on a nonempty interval `[lo, hi]`.
The subtracted square is the squared distance of `C` from the interval. -/
def referenceMassEnvelope (lo hi C : ℝ) : ℝ :=
  C ^ 2 - (max 0 (max (lo - C) (C - hi))) ^ 2

/-- Interval evaluation keeps the concavity of the mass-dependent certificate. -/
theorem mass_quadratic_le_envelope {A lo hi C : ℝ}
    (hlo : lo ≤ A) (hhi : A ≤ hi) :
    A * (2 * C - A) ≤ referenceMassEnvelope lo hi C := by
  have hd : max 0 (max (lo - C) (C - hi)) ≤ |A - C| := by
    apply max_le
    · exact abs_nonneg _
    · apply max_le
      · exact (sub_le_sub_right hlo C).trans (le_abs_self _)
      · have h := neg_le_abs (A - C)
        linarith
  have hd0 : 0 ≤ max 0 (max (lo - C) (C - hi)) := le_max_left _ _
  have hsq := mul_self_le_mul_self hd0 hd
  unfold referenceMassEnvelope
  nlinarith [sq_abs (A - C)]

/-- A signed-mass upper bound and a mass interval give a rational certificate. -/
theorem reference_mass_le_envelope {A S E lo hi s : ℝ}
    (hA : 0 ≤ A) (hlo : lo ≤ A) (hhi : A ≤ hi) (hS : S ≤ s) :
    A * (2 * S - A + E) ≤ referenceMassEnvelope lo hi (s + E / 2) := by
  calc
    _ ≤ A * (2 * (s + E / 2) - A) := by
      nlinarith [mul_nonneg hA (sub_nonneg.mpr hS)]
    _ ≤ _ := mass_quadratic_le_envelope hlo hhi

/-- The interval certificate is never larger than the square of the old budget. -/
theorem referenceMassEnvelope_le_square (lo hi C : ℝ) :
    referenceMassEnvelope lo hi C ≤ C ^ 2 := by
  unfold referenceMassEnvelope
  exact sub_le_self _ (sq_nonneg _)

/-- If the maximum lies to the left of the interval, the lower endpoint is sharp. -/
theorem referenceMassEnvelope_eq_left {lo hi C : ℝ}
    (hinterval : lo ≤ hi) (hC : C ≤ lo) :
    referenceMassEnvelope lo hi C = lo * (2 * C - lo) := by
  have hm : max 0 (max (lo - C) (C - hi)) = lo - C := by
    rw [max_eq_left (by linarith : C - hi ≤ lo - C),
      max_eq_right (sub_nonneg.mpr hC)]
  rw [referenceMassEnvelope, hm]
  ring

/-- If the maximum lies to the right, the upper endpoint is sharp. -/
theorem referenceMassEnvelope_eq_right {lo hi C : ℝ}
    (hinterval : lo ≤ hi) (hC : hi ≤ C) :
    referenceMassEnvelope lo hi C = hi * (2 * C - hi) := by
  have hm : max 0 (max (lo - C) (C - hi)) = C - hi := by
    rw [max_eq_right (by linarith : lo - C ≤ C - hi),
      max_eq_right (sub_nonneg.mpr hC)]
  rw [referenceMassEnvelope, hm]
  ring

/-- If the vertex lies inside the interval, its square is the sharp envelope. -/
theorem referenceMassEnvelope_eq_center {lo hi C : ℝ}
    (hlo : lo ≤ C) (hhi : C ≤ hi) :
    referenceMassEnvelope lo hi C = C ^ 2 := by
  have hm : max 0 (max (lo - C) (C - hi)) = 0 :=
    max_eq_left (max_le (sub_nonpos.mpr hlo) (sub_nonpos.mpr hhi))
  simp only [referenceMassEnvelope, hm, zero_pow (by decide : 2 ≠ 0), sub_zero]

/-- Certify the full infinite tail using an interval for the positive-reference mass.
All numerical inputs can be rational; no square-root evaluation is needed. -/
theorem signed_tail_le_of_mass_interval
    (a k : ℕ → ℝ) (N : ℕ) (E S T lo hi : ℝ)
    (ha : ∀ n, 0 < a (n + N)) (hs : Summable fun n => a (n + N))
    (hE : ∀ J, ∑ n ∈ range J,
      (k (n + N) - a (n + N)) ^ 2 / a (n + N) ≤ E)
    (hS : (∑' n, k (n + N)) ≤ S)
    (hlo : lo ≤ ∑' n, a (n + N)) (hhi : (∑' n, a (n + N)) ≤ hi)
    (hT : 0 ≤ T) (hcert : referenceMassEnvelope lo hi (S + E / 2) ≤ T ^ 2) :
    (∑' n, |k (n + N)|) ≤ T := by
  apply signed_tail_le_of_mass_quadratic_budget a k N E S T ha hs hE hS hT
  exact (reference_mass_le_envelope (tsum_nonneg fun n => (ha n).le)
    hlo hhi (le_refl S)).trans hcert

end

end Grothe.Upper
