import Grothe.UpperChaos.ConditionalSeedNormalization
import Grothe.UpperChaos.F0ConditionalReality
import Mathlib.Tactic.Positivity
import Lean.Elab.Tactic.Omega

/-!
# Actual real normalized coefficients on a finite triangle

Certificate infrastructure for the actual row227 selected-vector check.
The common normalization is the proved positive Gaussian seed.

The values below are the real parts of the actual Gaussian integrals divided
by their common positive zero-zero seed. Reality transfers the existing
complex identities to real identities: U_00 = 1, the signed zero-row step,
and the forward charge step. Its charge is real subtraction d + 1 - c.

Induction covers exactly c <= d + 1 and c + d < M. Every forward step uses
U(c,d) and U(c,d+1), both in row c; the boundary c = d + 1 needs no separate
diagonal formula. A generic predicate theorem separates this mathematics
from any rational or dyadic representation. The enclosure corollary leaves
only the base endpoint and finitely indexed local arithmetic guards.

No numerical transcript, selected-mode coverage, source address, physical
shift transport, or final endpoint is certified here. Numerical checkpoints are supplied by the concrete certificate.

Agent-ID: codex-aa04. Refs #293, #21.
-/

namespace Grothe.UpperChaos.ConditionalNormalizedTriangle

noncomputable section

open F0ConditionalEvaluator ConditionalSeedNormalization

/-- The real normalized actual integral, rather than a recursively defined
surrogate. `canonicalCoefficient` is the Gaussian phase/Hermite integral. -/
def normalizedReal (A : ℝ) (c d : ℕ) : ℝ :=
  (canonicalCoefficient A (c, d)).re / seedScalar A

/-- Reality holds even before imposing the positive-shift division condition. -/
theorem normalizedCoefficient_eq_ofReal (A : ℝ) (c d : ℕ) :
    normalizedCoefficient A (c, d) = (normalizedReal A c d : ℂ) := by
  unfold normalizedCoefficient normalizedReal
  rw [Complex.ofReal_div]
  exact congrArg (fun z : ℂ => z / (seedScalar A : ℂ))
    (canonicalCoefficient_eq_ofReal_re A (c, d))

theorem normalizedReal_zero_zero {A : ℝ} (hA : 0 < A) :
    normalizedReal A 0 0 = 1 := by
  apply Complex.ofReal_injective
  rw [Complex.ofReal_one, ← normalizedCoefficient_eq_ofReal A 0 0]
  exact normalizedCoefficient_zero_zero hA

/-- In particular, the zero-row multiplier has its original negative sign. -/
def zeroFactor (A : ℝ) (d : ℕ) : ℝ :=
  (-A) * OriginalPositiveMoment.ratio d (A ^ 2) /
    Real.sqrt ((d + 1 : ℕ) : ℝ)

theorem normalizedReal_zero_row_step (A : ℝ) (d : ℕ) :
    normalizedReal A 0 (d + 1) = zeroFactor A d * normalizedReal A 0 d := by
  have h : normalizedCoefficient A (0, d + 1) =
      (zeroFactor A d : ℂ) * normalizedCoefficient A (0, d) :=
    normalizedCoefficient_zero_row_step A d
  apply Complex.ofReal_injective
  simpa only [Complex.ofReal_mul, ← normalizedCoefficient_eq_ofReal] using h

theorem zeroFactor_neg {A : ℝ} (hA : 0 < A) (d : ℕ) :
    zeroFactor A d < 0 := by
  exact div_neg_of_neg_of_pos
    (mul_neg_of_neg_of_pos (neg_neg_of_pos hA)
      (OriginalPositiveMoment.ratio_mem_unit d (A ^ 2)).1)
    (Real.sqrt_pos.2 (by positivity))

/-- The exact real charge is never interpreted as natural subtraction. -/
theorem normalizedReal_charge (A : ℝ) (c d : ℕ) :
    A * (Real.sqrt ((c + 1 : ℕ) : ℝ) * normalizedReal A (c + 1) d -
      Real.sqrt ((d + 1 : ℕ) : ℝ) * normalizedReal A c (d + 1)) =
      ((d : ℝ) + 1 - (c : ℝ)) * normalizedReal A c d := by
  apply Complex.ofReal_injective
  simpa only [Complex.ofReal_mul, Complex.ofReal_sub, Complex.ofReal_add,
    Complex.ofReal_one, Complex.ofReal_natCast,
    ← normalizedCoefficient_eq_ofReal] using normalizedCoefficient_charge A c d

/-- The arguments are the current-row values U(c,d) and U(c,d+1), in that order. -/
def forwardValue (A : ℝ) (c d : ℕ) (uCur uNext : ℝ) : ℝ :=
  (A * Real.sqrt ((d + 1 : ℕ) : ℝ) * uNext +
    ((d : ℝ) + 1 - (c : ℝ)) * uCur) /
    (A * Real.sqrt ((c + 1 : ℕ) : ℝ))

theorem normalizedReal_forward {A : ℝ} (hA : 0 < A) (c d : ℕ) :
    normalizedReal A (c + 1) d =
      forwardValue A c d (normalizedReal A c d) (normalizedReal A c (d + 1)) := by
  apply Complex.ofReal_injective
  simpa only [forwardValue, Complex.ofReal_div, Complex.ofReal_add,
    Complex.ofReal_mul, Complex.ofReal_sub, Complex.ofReal_one,
    Complex.ofReal_natCast, ← normalizedCoefficient_eq_ofReal] using
    normalizedCoefficient_forward hA c d

/-- Split form used by an interval checker: uNext comes first in this formula.
The common A cancels only in the first summand. -/
theorem forwardValue_eq_split {A : ℝ} (hA : 0 < A) (c d : ℕ)
    (uCur uNext : ℝ) :
    forwardValue A c d uCur uNext =
      (Real.sqrt ((d + 1 : ℕ) : ℝ) / Real.sqrt ((c + 1 : ℕ) : ℝ)) * uNext +
        (((d : ℝ) + 1 - (c : ℝ)) /
          (A * Real.sqrt ((c + 1 : ℕ) : ℝ))) * uCur := by
  unfold forwardValue
  rw [add_div, mul_assoc, mul_div_mul_left _ _ hA.ne']
  simp only [div_mul_eq_mul_div₀]

theorem normalizedReal_forward_split {A : ℝ} (hA : 0 < A) (c d : ℕ) :
    normalizedReal A (c + 1) d =
      (Real.sqrt ((d + 1 : ℕ) : ℝ) / Real.sqrt ((c + 1 : ℕ) : ℝ)) *
          normalizedReal A c (d + 1) +
        (((d : ℝ) + 1 - (c : ℝ)) /
          (A * Real.sqrt ((c + 1 : ℕ) : ℝ))) * normalizedReal A c d := by
  rw [normalizedReal_forward hA c d, forwardValue_eq_split hA]

/-- Row induction on the complete finite triangle. In the step, both
predecessors satisfy the same triangle domain. In particular this covers
the edge c = d + 1, and the statement is vacuous when M = 0. -/
theorem triangle_induction (M : ℕ) (P : ℕ → ℕ → Prop)
    (hzero : ∀ d, d < M → P 0 d)
    (hstep : ∀ c d, c + 1 ≤ d + 1 → c + 1 + d < M →
      P c d → P c (d + 1) → P (c + 1) d) :
    ∀ c d, c ≤ d + 1 → c + d < M → P c d := by
  intro c
  induction c with
  | zero =>
      intro d _ hsum
      exact hzero d (by omega)
  | succ c ih =>
      intro d hcd hsum
      apply hstep c d hcd hsum
      · exact ih d (by omega) (by omega)
      · exact ih (d + 1) (by omega) (by omega)

/-- A representation-independent certificate principle for the actual
normalized integrals. The local predicates may describe rational intervals,
dyadic intervals, or any other invariant closed under the two exact steps. -/
theorem predicate_of_local {A : ℝ} (hA : 0 < A) (M : ℕ)
    (P : ℕ → ℕ → ℝ → Prop)
    (hbase : 0 < M → P 0 0 1)
    (hzero : ∀ d, d + 1 < M → ∀ u, P 0 d u →
      P 0 (d + 1) (zeroFactor A d * u))
    (hstep : ∀ c d, c + 1 ≤ d + 1 → c + 1 + d < M →
      ∀ uCur uNext, P c d uCur → P c (d + 1) uNext →
        P (c + 1) d (forwardValue A c d uCur uNext)) :
    ∀ c d, c ≤ d + 1 → c + d < M → P c d (normalizedReal A c d) := by
  apply triangle_induction M (fun c d => P c d (normalizedReal A c d))
  · intro d
    induction d with
    | zero =>
        intro hd
        rw [normalizedReal_zero_zero hA]
        exact hbase hd
    | succ d ih =>
        intro hd
        rw [normalizedReal_zero_row_step A d]
        exact hzero d hd _ (ih (by omega))
  · intro c d hcd hsum huCur huNext
    rw [normalizedReal_forward hA c d]
    exact hstep c d hcd hsum _ _ huCur huNext

/-- On the triangle, the charge and both forward weights are nonnegative.
No sign assumption is made on either current-row coefficient. -/
theorem forwardValue_mono {A : ℝ} (hA : 0 < A) (c d : ℕ)
    (hcd : c ≤ d + 1) {uCur uCur' uNext uNext' : ℝ}
    (hCur : uCur ≤ uCur') (hNext : uNext ≤ uNext') :
    forwardValue A c d uCur uNext ≤ forwardValue A c d uCur' uNext' := by
  have hcast : (c : ℝ) ≤ ((d + 1 : ℕ) : ℝ) := Nat.cast_le.mpr hcd
  have hcharge : 0 ≤ (d : ℝ) + 1 - (c : ℝ) := by
    simpa only [Nat.cast_add, Nat.cast_one] using sub_nonneg.mpr hcast
  unfold forwardValue
  apply div_le_div_of_nonneg_right _
    (mul_nonneg hA.le (Real.sqrt_nonneg _))
  exact add_le_add
    (mul_le_mul_of_nonneg_left hNext (mul_nonneg hA.le (Real.sqrt_nonneg _)))
    (mul_le_mul_of_nonneg_left hCur hcharge)

/-- Endpoint-only local guards enclose every actual normalized integral in
the triangle. The zero-row guard reverses the input endpoints because its
multiplier is negative. The forward guard uses lower/lower and upper/upper.

These are finite local arithmetic obligations; no premise assumes an
enclosure of an actual coefficient or an accuracy statement for a transcript. -/
theorem enclosure_of_local {A : ℝ} (hA : 0 < A) (M : ℕ)
    (lo hi : ℕ → ℕ → ℝ)
    (hbase : 0 < M → lo 0 0 ≤ 1 ∧ 1 ≤ hi 0 0)
    (hzero : ∀ d, d + 1 < M →
      lo 0 (d + 1) ≤ zeroFactor A d * hi 0 d ∧
        zeroFactor A d * lo 0 d ≤ hi 0 (d + 1))
    (hstep : ∀ c d, c + 1 ≤ d + 1 → c + 1 + d < M →
      lo (c + 1) d ≤ forwardValue A c d (lo c d) (lo c (d + 1)) ∧
        forwardValue A c d (hi c d) (hi c (d + 1)) ≤ hi (c + 1) d) :
    ∀ c d, c ≤ d + 1 → c + d < M →
      lo c d ≤ normalizedReal A c d ∧ normalizedReal A c d ≤ hi c d := by
  apply predicate_of_local hA M (fun c d u => lo c d ≤ u ∧ u ≤ hi c d)
  · exact hbase
  · intro d hd u hu
    obtain ⟨hlo, hhi⟩ := hzero d hd
    have hf : zeroFactor A d ≤ 0 := (zeroFactor_neg hA d).le
    exact ⟨hlo.trans (mul_le_mul_of_nonpos_left hu.2 hf),
      (mul_le_mul_of_nonpos_left hu.1 hf).trans hhi⟩
  · intro c d hcd hsum uCur uNext huCur huNext
    obtain ⟨hlo, hhi⟩ := hstep c d hcd hsum
    exact ⟨hlo.trans (forwardValue_mono hA c d (by omega) huCur.1 huNext.1),
      (forwardValue_mono hA c d (by omega) huCur.2 huNext.2).trans hhi⟩

end
end Grothe.UpperChaos.ConditionalNormalizedTriangle

/-- info: 'Grothe.UpperChaos.ConditionalNormalizedTriangle.normalizedCoefficient_eq_ofReal' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalNormalizedTriangle.normalizedCoefficient_eq_ofReal

/-- info: 'Grothe.UpperChaos.ConditionalNormalizedTriangle.normalizedReal_zero_zero' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalNormalizedTriangle.normalizedReal_zero_zero

/-- info: 'Grothe.UpperChaos.ConditionalNormalizedTriangle.normalizedReal_zero_row_step' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalNormalizedTriangle.normalizedReal_zero_row_step

/-- info: 'Grothe.UpperChaos.ConditionalNormalizedTriangle.normalizedReal_charge' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalNormalizedTriangle.normalizedReal_charge

/-- info: 'Grothe.UpperChaos.ConditionalNormalizedTriangle.normalizedReal_forward' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalNormalizedTriangle.normalizedReal_forward

/-- info: 'Grothe.UpperChaos.ConditionalNormalizedTriangle.normalizedReal_forward_split' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalNormalizedTriangle.normalizedReal_forward_split

/-- info: 'Grothe.UpperChaos.ConditionalNormalizedTriangle.predicate_of_local' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalNormalizedTriangle.predicate_of_local

/-- info: 'Grothe.UpperChaos.ConditionalNormalizedTriangle.enclosure_of_local' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalNormalizedTriangle.enclosure_of_local
