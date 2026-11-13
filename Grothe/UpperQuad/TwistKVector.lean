import Grothe.UpperQuad.TwistFiniteVector
import Grothe.UpperQuad.CanonicalShellBound
import Mathlib.Algebra.BigOperators.NatAntidiagonal

/-!
# Coarse K bounds for the finite twisted coefficient vector

The factorization's common-triangle and Euclidean column inequality are supplied by
`TwistFiniteVector`. This module replaces the column energies by scalar bounds, groups the
canonical coefficients into total-degree shells, and applies the existing coarse shell bound.
The final squared bound is `4 * E * theta * polynomial^2` when `E` bounds squared phase growth;
the phase factor and the polynomial are each squared exactly once.

Agent-ID: codex-1a87. Refs #334, #342, #343.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistKVector

open PolynomialHermite Explicit TwistFactorization CanonicalShellBound

noncomputable section

/-- Regroup a finite degree triangle into its complete total-degree shells. -/
theorem sum_indices_eq_shells (N : ℕ) (f : ℕ × ℕ → ℝ) :
    ∑ gh ∈ indices N, f gh =
      ∑ m ∈ Finset.range (N + 1), ∑ g ∈ Finset.range (m + 1), f (g, m - g) := by
  have hmap : ∀ gh ∈ indices N, gh.1 + gh.2 ∈ Finset.range (N + 1) := by
    rintro ⟨g, h⟩ hgh
    simp only [mem_indices, Finset.mem_range] at hgh ⊢
    omega
  rw [← Finset.sum_fiberwise_of_maps_to hmap f]
  apply Finset.sum_congr rfl
  intro m hm
  have hmN : m ≤ N := Nat.lt_succ_iff.mp (Finset.mem_range.mp hm)
  have hf : (indices N).filter (fun gh ↦ gh.1 + gh.2 = m) =
      Finset.HasAntidiagonal.antidiagonal m := by
    ext ⟨g, h⟩
    simp only [Finset.mem_filter, mem_indices, Finset.HasAntidiagonal.mem_antidiagonal]
    omega
  rw [hf, Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]

/-- Scalar upper bounds on the squared column norms control the whole output vector. -/
theorem sqrt_sum_norm_Jext_sq_le_of_column_bound (S : Finset (ℕ × ℕ)) (D : ℕ)
    (hS : ∀ cd ∈ S, cd.1 + cd.2 ≤ D) (j : ℕ) (r A : ℂ) (B : ℕ → ℝ)
    (hB : ∀ gh ∈ indices (D + 35 * j),
      ∑ cd ∈ S, ‖matrixCoefficient j r cd.1 cd.2 gh.1 gh.2‖ ^ 2 ≤ B (gh.1 + gh.2)) :
    Real.sqrt (∑ cd ∈ S, ‖Jext j r A cd.1 cd.2‖ ^ 2) ≤
      ∑ gh ∈ indices (D + 35 * j), Real.sqrt (B (gh.1 + gh.2)) *
        ‖Uext gh.1 gh.2 ((Real.sqrt (rate j) : ℂ) * A)‖ :=
  (sqrt_sum_norm_Jext_sq_le S D hS j r A).trans <| Finset.sum_le_sum fun gh hgh ↦
    mul_le_mul_of_nonneg_right (Real.sqrt_le_sqrt (hB gh hgh)) (norm_nonneg _)

/-- Squaring the column-norm estimate introduces no extra output-dimension factor. -/
theorem sum_norm_Jext_sq_le_of_column_bound (S : Finset (ℕ × ℕ)) (D : ℕ)
    (hS : ∀ cd ∈ S, cd.1 + cd.2 ≤ D) (j : ℕ) (r A : ℂ) (B : ℕ → ℝ)
    (hB : ∀ gh ∈ indices (D + 35 * j),
      ∑ cd ∈ S, ‖matrixCoefficient j r cd.1 cd.2 gh.1 gh.2‖ ^ 2 ≤ B (gh.1 + gh.2)) :
    (∑ cd ∈ S, ‖Jext j r A cd.1 cd.2‖ ^ 2) ≤
      (∑ gh ∈ indices (D + 35 * j), Real.sqrt (B (gh.1 + gh.2)) *
        ‖Uext gh.1 gh.2 ((Real.sqrt (rate j) : ℂ) * A)‖) ^ 2 := by
  have h := pow_le_pow_left₀ (Real.sqrt_nonneg _)
    (sqrt_sum_norm_Jext_sq_le_of_column_bound S D hS j r A B hB) 2
  rwa [Real.sq_sqrt (Finset.sum_nonneg fun _ _ ↦ sq_nonneg _)] at h

/-- The canonical coefficient norm sum with total-degree weights is bounded shell by shell. -/
theorem weighted_canonical_sum_le_shells (N : ℕ) (B : ℕ → ℝ) {A : ℂ}
    (hr : 0 < (A ^ 2).re) :
    (∑ gh ∈ indices N, Real.sqrt (B (gh.1 + gh.2)) * ‖Uext gh.1 gh.2 A‖) ≤
      2 * Real.sqrt (‖A‖ ^ 2 / (A ^ 2).re) *
        ∑ m ∈ Finset.range (N + 1), ((m : ℝ) + 1) *
          Real.sqrt ((m.factorial : ℝ) * B m) *
            (Real.sqrt 8 * (‖A‖ ^ 2 / (A ^ 2).re) / ‖A‖) ^ m := by
  rw [sum_indices_eq_shells, Finset.mul_sum]
  apply Finset.sum_le_sum
  intro m _
  calc
    _ = Real.sqrt (B m) * ∑ g ∈ Finset.range (m + 1), ‖Uext g (m - g) A‖ := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro g hg
      have hdeg : g + (m - g) = m :=
        Nat.add_sub_of_le (Nat.lt_succ_iff.mp (Finset.mem_range.mp hg))
      simp only [hdeg]
    _ ≤ Real.sqrt (B m) *
        (2 * Real.sqrt (‖A‖ ^ 2 / (A ^ 2).re) * ((m : ℝ) + 1) *
          Real.sqrt (m.factorial : ℝ) *
            (Real.sqrt 8 * (‖A‖ ^ 2 / (A ^ 2).re) / ‖A‖) ^ m) :=
      mul_le_mul_of_nonneg_left (sum_norm_Uext_shell_le m hr) (Real.sqrt_nonneg _)
    _ = _ := by
      rw [Real.sqrt_mul (Nat.cast_nonneg m.factorial)]
      ring

/-- The norm of the twisted output vector satisfies the coarse finite shell estimate. -/
theorem sqrt_sum_norm_Jext_sq_le_shells (S : Finset (ℕ × ℕ)) (D : ℕ)
    (hS : ∀ cd ∈ S, cd.1 + cd.2 ≤ D) (j : ℕ) (r A : ℂ) (B : ℕ → ℝ)
    (hB : ∀ gh ∈ indices (D + 35 * j),
      ∑ cd ∈ S, ‖matrixCoefficient j r cd.1 cd.2 gh.1 gh.2‖ ^ 2 ≤ B (gh.1 + gh.2))
    (hr : 0 < (((Real.sqrt (rate j) : ℂ) * A) ^ 2).re) :
    Real.sqrt (∑ cd ∈ S, ‖Jext j r A cd.1 cd.2‖ ^ 2) ≤
      2 * Real.sqrt (‖(Real.sqrt (rate j) : ℂ) * A‖ ^ 2 /
        (((Real.sqrt (rate j) : ℂ) * A) ^ 2).re) *
        ∑ m ∈ Finset.range (D + 35 * j + 1), ((m : ℝ) + 1) *
          Real.sqrt ((m.factorial : ℝ) * B m) *
            (Real.sqrt 8 * (‖(Real.sqrt (rate j) : ℂ) * A‖ ^ 2 /
              (((Real.sqrt (rate j) : ℂ) * A) ^ 2).re) /
                ‖(Real.sqrt (rate j) : ℂ) * A‖) ^ m :=
  (sqrt_sum_norm_Jext_sq_le_of_column_bound S D hS j r A B hB).trans
    (weighted_canonical_sum_le_shells (D + 35 * j) B hr)

/-- The squared shell bound has prefactor `4 theta`, with the polynomial squared once. -/
theorem sum_norm_Jext_sq_le_shells (S : Finset (ℕ × ℕ)) (D : ℕ)
    (hS : ∀ cd ∈ S, cd.1 + cd.2 ≤ D) (j : ℕ) (r A : ℂ) (B : ℕ → ℝ)
    (hB : ∀ gh ∈ indices (D + 35 * j),
      ∑ cd ∈ S, ‖matrixCoefficient j r cd.1 cd.2 gh.1 gh.2‖ ^ 2 ≤ B (gh.1 + gh.2))
    (hr : 0 < (((Real.sqrt (rate j) : ℂ) * A) ^ 2).re) :
    (∑ cd ∈ S, ‖Jext j r A cd.1 cd.2‖ ^ 2) ≤
      4 * (‖(Real.sqrt (rate j) : ℂ) * A‖ ^ 2 /
        (((Real.sqrt (rate j) : ℂ) * A) ^ 2).re) *
        (∑ m ∈ Finset.range (D + 35 * j + 1), ((m : ℝ) + 1) *
          Real.sqrt ((m.factorial : ℝ) * B m) *
            (Real.sqrt 8 * (‖(Real.sqrt (rate j) : ℂ) * A‖ ^ 2 /
              (((Real.sqrt (rate j) : ℂ) * A) ^ 2).re) /
                ‖(Real.sqrt (rate j) : ℂ) * A‖) ^ m) ^ 2 := by
  have hθ : 0 ≤ ‖(Real.sqrt (rate j) : ℂ) * A‖ ^ 2 /
      (((Real.sqrt (rate j) : ℂ) * A) ^ 2).re := div_nonneg (sq_nonneg _) hr.le
  have h := pow_le_pow_left₀ (Real.sqrt_nonneg _)
    (sqrt_sum_norm_Jext_sq_le_shells S D hS j r A B hB hr) 2
  rw [Real.sq_sqrt (Finset.sum_nonneg fun _ _ ↦ sq_nonneg _),
    mul_pow, mul_pow, Real.sq_sqrt hθ] at h
  norm_num only [show (2 : ℝ) ^ 2 = 4 by norm_num] at h
  exact h

/-- A common squared phase bound factors out once from the coarse squared K estimate. -/
theorem sum_norm_Jext_sq_le_phase_shells (S : Finset (ℕ × ℕ)) (D : ℕ)
    (hS : ∀ cd ∈ S, cd.1 + cd.2 ≤ D) (j : ℕ) (r A : ℂ)
    (E : ℝ) (hE : 0 ≤ E) (N2 : ℕ → ℝ)
    (hB : ∀ gh ∈ indices (D + 35 * j),
      ∑ cd ∈ S, ‖matrixCoefficient j r cd.1 cd.2 gh.1 gh.2‖ ^ 2 ≤
        E * N2 (gh.1 + gh.2))
    (hr : 0 < (((Real.sqrt (rate j) : ℂ) * A) ^ 2).re) :
    (∑ cd ∈ S, ‖Jext j r A cd.1 cd.2‖ ^ 2) ≤
      4 * E * (‖(Real.sqrt (rate j) : ℂ) * A‖ ^ 2 /
        (((Real.sqrt (rate j) : ℂ) * A) ^ 2).re) *
        (∑ m ∈ Finset.range (D + 35 * j + 1), ((m : ℝ) + 1) *
          Real.sqrt ((m.factorial : ℝ) * N2 m) *
            (Real.sqrt 8 * (‖(Real.sqrt (rate j) : ℂ) * A‖ ^ 2 /
              (((Real.sqrt (rate j) : ℂ) * A) ^ 2).re) /
                ‖(Real.sqrt (rate j) : ℂ) * A‖) ^ m) ^ 2 := by
  have h := sum_norm_Jext_sq_le_shells S D hS j r A (fun m ↦ E * N2 m) hB hr
  have hfactor (x : ℝ) :
      (∑ m ∈ Finset.range (D + 35 * j + 1), ((m : ℝ) + 1) *
        Real.sqrt ((m.factorial : ℝ) * (E * N2 m)) * x ^ m) =
      Real.sqrt E * ∑ m ∈ Finset.range (D + 35 * j + 1), ((m : ℝ) + 1) *
        Real.sqrt ((m.factorial : ℝ) * N2 m) * x ^ m := by
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro m _
    rw [show (m.factorial : ℝ) * (E * N2 m) = E * ((m.factorial : ℝ) * N2 m) by ring,
      Real.sqrt_mul hE]
    ring
  rw [hfactor, mul_pow (Real.sqrt E) _ 2, Real.sq_sqrt hE] at h
  convert h using 1
  ring

private lemma norm_sqrt_mul (L : ℝ) (A : ℂ) :
    ‖(Real.sqrt L : ℂ) * A‖ = Real.sqrt L * ‖A‖ := by
  rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg L)]

private lemma sqrt_mul_sq_re {L : ℝ} (hL : 0 ≤ L) (A : ℂ) :
    (((Real.sqrt L : ℂ) * A) ^ 2).re = L * (A ^ 2).re := by
  rw [mul_pow, ← Complex.ofReal_pow, Real.sq_sqrt hL]
  simp only [Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im, zero_mul, sub_zero]

private lemma theta_sqrt_mul {L : ℝ} (hL : 0 < L) (A : ℂ) :
    ‖(Real.sqrt L : ℂ) * A‖ ^ 2 / (((Real.sqrt L : ℂ) * A) ^ 2).re =
      ‖A‖ ^ 2 / (A ^ 2).re := by
  rw [norm_sqrt_mul, mul_pow, Real.sq_sqrt hL.le, sqrt_mul_sq_re hL.le,
    mul_div_mul_left _ _ hL.ne']

/-- The coarse squared K envelope at the original shift, with the Gaussian scale explicit.
Here `E` is the squared phase envelope and `N2 m` is the squared dilation bound for degree `m`.
There is no additional inverse-rate prefactor. -/
theorem sum_norm_Jext_sq_le_coarse (S : Finset (ℕ × ℕ)) (D : ℕ)
    (hS : ∀ cd ∈ S, cd.1 + cd.2 ≤ D) (j : ℕ) (r A : ℂ)
    (E : ℝ) (hE : 0 ≤ E) (N2 : ℕ → ℝ)
    (hB : ∀ gh ∈ indices (D + 35 * j),
      ∑ cd ∈ S, ‖matrixCoefficient j r cd.1 cd.2 gh.1 gh.2‖ ^ 2 ≤
        E * N2 (gh.1 + gh.2))
    (hr : 0 < (A ^ 2).re) :
    (∑ cd ∈ S, ‖Jext j r A cd.1 cd.2‖ ^ 2) ≤
      4 * E * (‖A‖ ^ 2 / (A ^ 2).re) *
        (∑ m ∈ Finset.range (D + 35 * j + 1), ((m : ℝ) + 1) *
          Real.sqrt ((m.factorial : ℝ) * N2 m) *
            (Real.sqrt 8 * (‖A‖ ^ 2 / (A ^ 2).re) /
              (Real.sqrt (rate j) * ‖A‖)) ^ m) ^ 2 := by
  have hr' : 0 < (((Real.sqrt (rate j) : ℂ) * A) ^ 2).re :=
    (mul_pos (rate_pos j) hr).trans_eq (sqrt_mul_sq_re (rate_pos j).le A).symm
  have h := sum_norm_Jext_sq_le_phase_shells S D hS j r A E hE N2 hB hr'
  simp only [theta_sqrt_mul (rate_pos j)] at h
  simpa only [norm_sqrt_mul] using h

end

end Grothe.UpperQuad.TwistKVector
