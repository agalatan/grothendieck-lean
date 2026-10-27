import Mathlib.Analysis.Complex.Basic
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Tactic.Convert
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Finite-amplitude coupled-image majorizers

The complex Young majorizer below is valid for every update, with an arbitrary
strictly positive price. In particular, its explicit allowance remains valid
when the current complex image vanishes. The finite-sum lemma can be applied
to quadrature or a finite probability space without discarding the common
image and update. The diagonal descent lemma supplies a concrete update once
a quadratic majorizer has been established.

These are analytic ingredients for the coupled-image research program. They
do not certify Gaussian moments, a global outer cover, or a new endpoint.
-/

open scoped ComplexConjugate

namespace Grothe.Research.CoupledMajorizer

private theorem complex_norm_add_sq (z w : ℂ) :
    ‖z + w‖ ^ 2 = ‖z‖ ^ 2 + ‖w‖ ^ 2 + 2 * (conj z * w).re := by
  rw [← Complex.normSq_eq_norm_sq, ← Complex.normSq_eq_norm_sq,
    ← Complex.normSq_eq_norm_sq, Complex.normSq_add]
  simp [Complex.mul_re]

/-- Young's modulus majorizer with an explicit allowance at the current image.
There is no smallness condition on the complex update `w`. -/
theorem complex_norm_majorizer (z w : ℂ) {s : ℝ} (hs : 0 < s) :
    ‖z + w‖ ≤ ‖z‖ + (conj z * w).re / s + ‖w‖ ^ 2 / (2 * s)
      + (s - ‖z‖) ^ 2 / (2 * s) := by
  have htwo : 0 < 2 * s := by positivity
  have hbase : ‖z + w‖ ≤ (‖z + w‖ ^ 2 + s ^ 2) / (2 * s) := by
    apply (le_div_iff₀ htwo).2
    nlinarith [sq_nonneg (‖z + w‖ - s)]
  rw [complex_norm_add_sq] at hbase
  convert hbase using 1
  field_simp [ne_of_gt hs]
  ring

/-- The allowance disappears at the exact positive modulus price. -/
theorem complex_norm_majorizer_exact (z w : ℂ) (hz : z ≠ 0) :
    ‖z + w‖ ≤ ‖z‖ + (conj z * w).re / ‖z‖ + ‖w‖ ^ 2 / (2 * ‖z‖) := by
  simpa using complex_norm_majorizer z w (norm_pos_iff.mpr hz)

/-- The pointwise finite-amplitude estimate for the two coupled images.
Both norm updates use the same `d,e`, with their required opposite signs.
The two quadratic penalties are expanded exactly. Gaussian integration and
projection identities are separate obligations for its intended use. -/
theorem coupled_update_bound (rPlus rMinus a b d e : ℂ)
    (eps : ℝ) {sPlus sMinus : ℝ} (hp : 0 < sPlus) (hm : 0 < sMinus) :
    eps * ‖a + d‖ ^ 2 + ‖b + e‖ ^ 2
      + ‖rPlus - ((eps : ℂ) * d + e)‖ + ‖rMinus - ((eps : ℂ) * d - e)‖ ≤
    (eps * ‖a‖ ^ 2 + ‖b‖ ^ 2 + ‖rPlus‖ + ‖rMinus‖)
      + (2 * eps * (conj a * d).re + 2 * (conj b * e).re
        - (conj rPlus * ((eps : ℂ) * d + e)).re / sPlus
        - (conj rMinus * ((eps : ℂ) * d - e)).re / sMinus)
      + (eps * ‖d‖ ^ 2 + ‖e‖ ^ 2
        + ‖(eps : ℂ) * d + e‖ ^ 2 / (2 * sPlus)
        + ‖(eps : ℂ) * d - e‖ ^ 2 / (2 * sMinus))
      + ((sPlus - ‖rPlus‖) ^ 2 / (2 * sPlus)
        + (sMinus - ‖rMinus‖) ^ 2 / (2 * sMinus)) := by
  have hplus := complex_norm_majorizer rPlus (-((eps : ℂ) * d + e)) hp
  have hminus := complex_norm_majorizer rMinus (-((eps : ℂ) * d - e)) hm
  simp only [← sub_eq_add_neg, mul_neg, Complex.neg_re, norm_neg, neg_div] at hplus hminus
  rw [complex_norm_add_sq a d, complex_norm_add_sq b e]
  linarith

/-- The same image-dependent majorizer on a finite weighted probability
space. Nonnegative weights need not be normalized. -/
theorem finite_weighted_majorizer {ι : Type*} (I : Finset ι)
    (weight s : ι → ℝ) (z w : ι → ℂ)
    (hw : ∀ i ∈ I, 0 ≤ weight i) (hs : ∀ i ∈ I, 0 < s i) :
    (∑ i ∈ I, weight i * ‖z i + w i‖) ≤
      (∑ i ∈ I, weight i * ‖z i‖)
      + (∑ i ∈ I, weight i * (conj (z i) * w i).re / s i)
      + (∑ i ∈ I, weight i * ‖w i‖ ^ 2 / (2 * s i))
      + (∑ i ∈ I, weight i * (s i - ‖z i‖) ^ 2 / (2 * s i)) := by
  calc
    _ ≤ ∑ i ∈ I, weight i * (‖z i‖ + (conj (z i) * w i).re / s i
        + ‖w i‖ ^ 2 / (2 * s i) + (s i - ‖z i‖) ^ 2 / (2 * s i)) := by
      exact Finset.sum_le_sum fun i hi =>
        mul_le_mul_of_nonneg_left (complex_norm_majorizer (z i) (w i) (hs i hi)) (hw i hi)
    _ = _ := by simp only [mul_add, Finset.sum_add_distrib, mul_div_assoc]

/-- Exact scalar completion of the square, including arbitrary signed
gradients. Positivity belongs to the curvature, not the gradient. -/
theorem diagonal_step_identity (g : ℝ) {c : ℝ} (hc : 0 < c) :
    2 * g * (-g / c) + c * (-g / c) ^ 2 = -(g ^ 2 / c) := by
  field_simp [ne_of_gt hc]
  ring

/-- A certified finite diagonal quadratic majorizer gives a concrete finite
update and its decrement. All moment and image-consistency premises remain
in `hmajor`; they are not inferred from a numerical gradient. -/
theorem finite_diagonal_descent {ι : Type*} [Fintype ι]
    (F : (ι → ℝ) → ℝ) (base allowance : ℝ) (g c : ι → ℝ)
    (hc : ∀ i, 0 < c i)
    (hmajor : ∀ x, F x ≤ base + allowance
      + ∑ i, (2 * g i * x i + c i * (x i) ^ 2)) :
    F (fun i => -g i / c i) ≤ base + allowance - ∑ i, g i ^ 2 / c i := by
  have h := hmajor (fun i => -g i / c i)
  simp_rw [diagonal_step_identity _ (hc _)] at h
  simpa only [Finset.sum_neg_distrib, sub_eq_add_neg] using h

/-- A positive certified decrement yields strict improvement of the current
dual value. This is a fixed-image implication, with no assertion about an
outer global maximization. -/
theorem finite_diagonal_strict_descent {ι : Type*} [Fintype ι]
    (F : (ι → ℝ) → ℝ) (base allowance : ℝ) (g c : ι → ℝ)
    (hc : ∀ i, 0 < c i)
    (hmajor : ∀ x, F x ≤ base + allowance
      + ∑ i, (2 * g i * x i + c i * (x i) ^ 2))
    (hgain : allowance < ∑ i, g i ^ 2 / c i) :
    F (fun i => -g i / c i) < base := by
  have h := finite_diagonal_descent F base allowance g c hc hmajor
  linarith

end Grothe.Research.CoupledMajorizer
