import Grothe.UpperChaos.F0ConditionalEvaluator
import Grothe.UpperChaos.Q0GaussPhysical
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic

/-!
# The Gauss–Legendre remainders (part (Q) of `hQuad`): the pure mathematics

* `canonicalCoefficient_neg`: the parity of the canonical coefficients in the shift,
  `U_{c,d}(−A) = (−1)^{c+d+1} U_{c,d}(A)` (from `ph(−z) = −ph(z)` and `hfun_neg`); with
  `k + c + d + 1 = 2d + 2` even this makes the node integrand `ψ_{k,j}(s) U_{c,d}(A(s))` an even
  function of `√s`, i.e. analytic in `s` at `s = 0` (`docs/QUAD_CHECKER.md` §12.4).
* `gauss_remainder_of_poly_approx`: an `n`-point rule with nonnegative weights that is exact on the
  polynomials of degree `< 2n` integrates a function within `2 (h − l) ε` of the exact integral when
  the function is uniformly `ε`-close to such a polynomial on the panel: the elementary interface
  between the exactness certificates of master (`Q0GaussPolynomialCertificates`) and the analytic
  input per panel (a Taylor or Chebyshev truncation with a remainder bound).
* `integral_panel_eq_affine`: the affine transfer of an integral over the physical panel `[l, h]` to
  the reference interval `[−1, 1]` through `panelNode`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad.Quad

open Grothe.UpperChaos Grothe.UpperChaos.F0ConditionalEvaluator Grothe.LowerAnalytic
open Grothe.UpperChaos.Q0LegendreInteger MeasureTheory
open scoped ComplexConjugate

/-! ### Parity of the canonical coefficients in the shift -/

lemma ph_neg (a : ℂ) : Grothe.Haag.ph (-a) = -Grothe.Haag.ph a := by
  unfold Grothe.Haag.ph
  rw [norm_neg, neg_div]

/-- `U_{c,d}(−A) = (−1)^{c+d+1} U_{c,d}(A)`. -/
theorem canonicalCoefficient_neg (A : ℝ) (i : ℕ × ℕ) :
    canonicalCoefficient (-A) i = (-1 : ℂ) ^ (i.1 + i.2 + 1) * canonicalCoefficient A i := by
  unfold canonicalCoefficient
  rw [← integral_rot_gaussC (-1 : ℂ) (by simp)
      (fun w => conj (hfun i w) * Grothe.Haag.ph ((A : ℂ) + w)), ← integral_const_mul]
  apply integral_congr_ae
  filter_upwards with w
  simp only [neg_one_mul]
  have h : ((-A : ℝ) : ℂ) + w = -((A : ℂ) + -w) := by push_cast; ring
  have hsq : ((-1 : ℂ) ^ (i.1 + i.2)) ^ 2 = 1 := by
    rw [← pow_mul, mul_comm, pow_mul, neg_one_sq, one_pow]
  rw [hfun_neg i w, map_mul, map_pow, map_neg, map_one, h, ph_neg, pow_succ]
  linear_combination (conj (hfun i w) * Grothe.Haag.ph ((A : ℂ) + -w)) * hsq

/-! ### The elementary remainder lemma -/

/-- An `n`-point rule with nonnegative weights, exact on the polynomials of degree `< 2n` over
`[l, h]`, integrates a function that is uniformly `ε`-close to such a polynomial within
`2 (h − l) ε`. -/
theorem gauss_remainder_of_poly_approx {n : ℕ} (l h : ℝ) (hlh : l ≤ h) (node weight : Fin n → ℝ)
    (hnode : ∀ i, node i ∈ Set.Icc l h) (hweight : ∀ i, 0 ≤ weight i)
    (hexact : ∀ p : Polynomial ℝ, p.natDegree < 2 * n →
      ∫ s in l..h, p.eval s = ∑ i, weight i * p.eval (node i))
    (f : ℝ → ℝ) (hf : IntervalIntegrable f volume l h) (p : Polynomial ℝ) (hp : p.natDegree < 2 * n)
    {ε : ℝ} (hε : ∀ s ∈ Set.Icc l h, |f s - p.eval s| ≤ ε) :
    |(∫ s in l..h, f s) - ∑ i, weight i * f (node i)| ≤ 2 * (h - l) * ε := by
  have hε0 : 0 ≤ ε := (abs_nonneg _).trans (hε l (Set.left_mem_Icc.mpr hlh))
  have hsum : ∑ i, weight i = h - l := by
    have h1 := hexact (Polynomial.C 1) (by simp; omega)
    simp only [Polynomial.eval_C, mul_one] at h1
    rw [intervalIntegral.integral_const, smul_eq_mul, mul_one] at h1
    linarith
  have hpint : IntervalIntegrable (fun s => p.eval s) volume l h :=
    (Polynomial.continuous p).intervalIntegrable l h
  have hdiff : (∫ s in l..h, f s) - ∑ i, weight i * f (node i) =
      (∫ s in l..h, (f s - p.eval s)) + ∑ i, weight i * (p.eval (node i) - f (node i)) := by
    rw [intervalIntegral.integral_sub hf hpint, hexact p hp]
    simp only [mul_sub, Finset.sum_sub_distrib]
    ring
  rw [hdiff]
  have hI : |∫ s in l..h, (f s - p.eval s)| ≤ ε * (h - l) := by
    have := intervalIntegral.norm_integral_le_of_norm_le_const (a := l) (b := h) (C := ε)
      (f := fun s => f s - p.eval s) (fun s hs => by
        rw [Real.norm_eq_abs]
        have hs' : s ∈ Set.Icc l h := by
          rw [← Set.uIcc_of_le hlh]; exact Set.uIoc_subset_uIcc hs
        exact hε s hs')
    rwa [Real.norm_eq_abs, abs_of_nonneg (sub_nonneg.mpr hlh)] at this
  have hS : |∑ i, weight i * (p.eval (node i) - f (node i))| ≤ ε * (h - l) := by
    calc |∑ i, weight i * (p.eval (node i) - f (node i))|
        ≤ ∑ i, |weight i * (p.eval (node i) - f (node i))| := Finset.abs_sum_le_sum_abs _ _
      _ ≤ ∑ i, weight i * ε := by
          apply Finset.sum_le_sum
          intro i _
          rw [abs_mul, abs_of_nonneg (hweight i), abs_sub_comm]
          exact mul_le_mul_of_nonneg_left (hε (node i) (hnode i)) (hweight i)
      _ = ε * (h - l) := by rw [← Finset.sum_mul, hsum, mul_comm]
  exact (abs_add_le _ _).trans ((add_le_add hI hS).trans_eq (by ring))

/-! ### The affine transfer to the reference interval -/

/-- `∫_l^h g = ((h − l)/2) ∫_{−1}^{1} g(panelNode l h x) dx`. -/
theorem integral_panel_eq_affine (l h : ℝ) (hlh : l < h) (g : ℝ → ℝ) :
    ∫ s in l..h, g s = ((h - l) / 2) * ∫ x in (-1 : ℝ)..1, g (panelNode l h x) := by
  have hc : (h - l) / 2 ≠ 0 := div_ne_zero (sub_ne_zero.mpr hlh.ne') two_ne_zero
  have hg : ∀ x, g (panelNode l h x) = g (((h - l) / 2) * x + (l + (h - l) / 2)) := by
    intro x; unfold panelNode; ring_nf
  simp_rw [hg]
  rw [intervalIntegral.integral_comp_mul_add g hc (l + (h - l) / 2), smul_eq_mul]
  have e1 : (h - l) / 2 * (-1) + (l + (h - l) / 2) = l := by ring
  have e2 : (h - l) / 2 * 1 + (l + (h - l) / 2) = h := by ring
  rw [e1, e2, ← mul_assoc, mul_inv_cancel₀ hc, one_mul]

/-- The physical rule of a panel is exact on the polynomials of degree `< 2n` when the reference
rule is: nodes `panelNode l h (x_i)`, weights `panelWeight l h (n−1) (x_i)`. -/
theorem panel_exactness {n : ℕ} (l h : ℝ) (hlh : l < h) (x : Fin n → ℝ)
    (href : ∀ f : Polynomial ℝ, f.natDegree < 2 * n →
      ∫ t in (-1 : ℝ)..1, f.eval t = ∑ i, weight (n - 1) (x i) * f.eval (x i))
    (p : Polynomial ℝ) (hp : p.natDegree < 2 * n) :
    ∫ s in l..h, p.eval s = ∑ i, panelWeight l h (n - 1) (x i) * p.eval (panelNode l h (x i)) := by
  rw [integral_panel_eq_affine l h hlh]
  -- the composite with the affine map is a polynomial of the same degree
  have hcomp : ∀ t, p.eval (panelNode l h t) =
      (p.comp (Polynomial.C ((h - l) / 2) * Polynomial.X + Polynomial.C (l + (h - l) / 2))).eval t := by
    intro t
    rw [Polynomial.eval_comp]
    unfold panelNode
    simp only [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_C, Polynomial.eval_X]
    ring_nf
  have hdeg : (p.comp (Polynomial.C ((h - l) / 2) * Polynomial.X + Polynomial.C (l + (h - l) / 2))).natDegree
      < 2 * n := by
    have hlin : (Polynomial.C ((h - l) / 2) * Polynomial.X + Polynomial.C (l + (h - l) / 2) :
        Polynomial ℝ).natDegree ≤ 1 := by
      apply Polynomial.natDegree_add_le_of_degree_le
      · exact (Polynomial.natDegree_C_mul_le _ _).trans Polynomial.natDegree_X_le
      · simp
    calc _ ≤ p.natDegree * (Polynomial.C ((h - l) / 2) * Polynomial.X +
          Polynomial.C (l + (h - l) / 2) : Polynomial ℝ).natDegree := Polynomial.natDegree_comp_le
      _ ≤ p.natDegree * 1 := Nat.mul_le_mul_left _ hlin
      _ < 2 * n := by omega
  simp_rw [hcomp]
  rw [href _ hdeg, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i _
  unfold panelWeight
  ring

end Grothe.UpperQuad.Quad
