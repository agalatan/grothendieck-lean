import Mathlib.Algebra.Order.BigOperators.Ring.Finset
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.Normed.Group.InfiniteSum
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Polarized Gram bounds without a tuning parameter

Rectifying the real part of a complex number preserves its norm. Applying the triangle
inequality to these rectified numbers, followed by Cauchy–Schwarz, retains the square of
the total imaginary correlation in the energy bound. This gives a weighted tail estimate
with no polarization parameter and no division by either input energy.

Agent-ID: codex-c8a4. Refs #377.
-/

namespace Grothe.PolarizedGram

open Finset
open scoped ComplexConjugate

variable {ι : Type*}

/-- Rectifying real parts retains the imaginary correlation in Cauchy–Schwarz. -/
theorem sum_abs_re_sq_add_sq_sum_im_le (s : Finset ι) (c : ι → ℂ) (f g : ι → ℝ)
    (hf : ∀ i ∈ s, 0 ≤ f i) (hg : ∀ i ∈ s, 0 ≤ g i)
    (hc : ∀ i ∈ s, ‖c i‖ ^ 2 ≤ f i * g i) :
    (∑ i ∈ s, |(c i).re|) ^ 2 + (∑ i ∈ s, (c i).im) ^ 2 ≤
      (∑ i ∈ s, f i) * ∑ i ∈ s, g i := by
  let z (i : ι) : ℂ := ⟨|(c i).re|, (c i).im⟩
  have hz (i : ι) : ‖z i‖ = ‖c i‖ := by
    apply (sq_eq_sq₀ (norm_nonneg _) (norm_nonneg _)).mp
    simp [Complex.sq_norm, Complex.normSq_apply, z, ← sq]
  have htriangle : ‖∑ i ∈ s, z i‖ ≤ ∑ i ∈ s, ‖c i‖ := by
    simpa only [hz] using norm_sum_le s z
  have hsq := pow_le_pow_left₀ (norm_nonneg _) htriangle 2
  have hCS := sum_sq_le_sum_mul_sum_of_sq_le_mul s hf hg hc
  have hnorm : ‖∑ i ∈ s, z i‖ ^ 2 =
      (∑ i ∈ s, |(c i).re|) ^ 2 + (∑ i ∈ s, (c i).im) ^ 2 := by
    simp [Complex.sq_norm, Complex.normSq_apply, z, ← sq]
  rw [hnorm] at hsq
  exact hsq.trans hCS

/-- The Gram defect form of the polarized product bound, including zero energies. -/
theorem sum_gram_defect (s : Finset ι) (r t : ι → ℂ) :
    (∑ i ∈ s, |(r i * conj (t i)).re|) ^ 2 +
        (∑ i ∈ s, (r i * conj (t i)).im) ^ 2 ≤
      (∑ i ∈ s, ‖r i‖ ^ 2) * ∑ i ∈ s, ‖t i‖ ^ 2 := by
  apply sum_abs_re_sq_add_sq_sum_im_le s _ _ _
    (fun _ _ ↦ sq_nonneg _) (fun _ _ ↦ sq_nonneg _)
  intro i _
  simp [mul_pow]

/-- The rectified Gram bound passes to summable families. The energy hypotheses imply
absolute summability of both correlations, so no convergence premise is hidden. -/
theorem tsum_abs_re_sq_add_sq_tsum_im_le (c : ι → ℂ) (f g : ι → ℝ)
    (hf : ∀ i, 0 ≤ f i) (hg : ∀ i, 0 ≤ g i)
    (hc : ∀ i, ‖c i‖ ^ 2 ≤ f i * g i) (hsf : Summable f) (hsg : Summable g) :
    (∑' i, |(c i).re|) ^ 2 + (∑' i, (c i).im) ^ 2 ≤ (∑' i, f i) * ∑' i, g i := by
  have hnorm : Summable (fun i ↦ ‖c i‖) := by
    apply Summable.of_nonneg_of_le (fun _ ↦ norm_nonneg _) _ ((hsf.add hsg).div_const 2)
    intro i
    have := hc i
    have := hf i
    have := hg i
    nlinarith [sq_nonneg (f i - g i), norm_nonneg (c i)]
  have hre : Summable (fun i ↦ |(c i).re|) :=
    Summable.of_nonneg_of_le (fun _ ↦ abs_nonneg _) (fun i ↦ Complex.abs_re_le_norm _) hnorm
  have him : Summable (fun i ↦ (c i).im) :=
    (Summable.of_nonneg_of_le (fun _ ↦ abs_nonneg _)
      (fun i ↦ Complex.abs_im_le_norm _) hnorm).of_abs
  exact le_of_tendsto_of_tendsto
    ((hre.hasSum.pow 2).add (him.hasSum.pow 2)) (Filter.Tendsto.mul hsf.hasSum hsg.hasSum)
    (Filter.Eventually.of_forall fun s ↦ sum_abs_re_sq_add_sq_sum_im_le s c f g
      (fun i _ ↦ hf i) (fun i _ ↦ hg i) (fun i _ ↦ hc i))

/-- Weighted Gram defect for an absolutely summable energy family. -/
theorem tsum_weighted_gram_defect (w : ι → ℝ) (r t : ι → ℂ) (hw : ∀ i, 0 ≤ w i)
    (hr : Summable (fun i ↦ w i * ‖r i‖ ^ 2))
    (ht : Summable (fun i ↦ w i * ‖t i‖ ^ 2)) :
    (∑' i, w i * |(r i * conj (t i)).re|) ^ 2 +
        (∑' i, w i * (r i * conj (t i)).im) ^ 2 ≤
      (∑' i, w i * ‖r i‖ ^ 2) * ∑' i, w i * ‖t i‖ ^ 2 := by
  have h := tsum_abs_re_sq_add_sq_tsum_im_le
    (fun i ↦ (w i : ℂ) * (r i * conj (t i)))
    (fun i ↦ w i * ‖r i‖ ^ 2) (fun i ↦ w i * ‖t i‖ ^ 2)
    (fun i ↦ mul_nonneg (hw i) (sq_nonneg _))
    (fun i ↦ mul_nonneg (hw i) (sq_nonneg _))
    (by intro i; simp [mul_pow, abs_of_nonneg (hw i)]; ring_nf; rfl)
    hr ht
  simpa [Complex.mul_re, Complex.mul_im, abs_mul, abs_of_nonneg (hw _)] using h

/-- A positive lower spectral weight gives a tail bound retaining imaginary correlation.
The theorem applies directly to a tail subtype, with no finite truncation required. -/
theorem tsum_abs_re_le_sqrt_gram_defect (w : ι → ℝ) (r t : ι → ℂ) (L : ℝ)
    (hL : 0 < L) (hw : ∀ i, L ≤ w i)
    (hr : Summable (fun i ↦ w i * ‖r i‖ ^ 2))
    (ht : Summable (fun i ↦ w i * ‖t i‖ ^ 2)) :
    ∑' i, |(r i * conj (t i)).re| ≤
      Real.sqrt ((∑' i, w i * ‖r i‖ ^ 2) * (∑' i, w i * ‖t i‖ ^ 2) -
        (∑' i, w i * (r i * conj (t i)).im) ^ 2) / L := by
  have hw0 (i : ι) : 0 ≤ w i := hL.le.trans (hw i)
  have h := tsum_weighted_gram_defect w r t hw0 hr ht
  have hs : Summable (fun i ↦ w i * |(r i * conj (t i)).re|) := by
    apply Summable.of_nonneg_of_le
      (fun i ↦ mul_nonneg (hw0 i) (abs_nonneg _)) _ ((hr.add ht).div_const 2)
    intro i
    have hnorm := Complex.abs_re_le_norm (r i * conj (t i))
    rw [norm_mul, Complex.norm_conj] at hnorm
    have hprod := mul_le_mul_of_nonneg_left hnorm (hw0 i)
    nlinarith [mul_nonneg (hw0 i) (sq_nonneg (‖r i‖ - ‖t i‖))]
  have hsum : L * (∑' i, |(r i * conj (t i)).re|) ≤
      ∑' i, w i * |(r i * conj (t i)).re| := by
    rw [← tsum_mul_left]
    have hle (i : ι) : L * |(r i * conj (t i)).re| ≤
        w i * |(r i * conj (t i)).re| :=
      mul_le_mul_of_nonneg_right (hw i) (abs_nonneg _)
    exact (Summable.of_nonneg_of_le
      (fun i ↦ mul_nonneg hL.le (abs_nonneg _)) hle hs).tsum_le_tsum hle hs
  apply (le_div_iff₀ hL).2
  rw [mul_comm]
  apply hsum.trans
  apply Real.le_sqrt_of_sq_le
  linarith

end Grothe.PolarizedGram
