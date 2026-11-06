import Grothe.UpperChaos.HermiteBasis
import Mathlib.Analysis.Complex.Exponential
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Finite Gaussian Hermite lowering and real-coordinate translation

The real-coordinate derivative is the sum of the two normalized lowering
operators. On total degree at most `D`, its Gaussian `L²` norm is bounded by
`sqrt (2 * D)` times the norm of the original finite Hermite combination.

Complex continuation of translation in the real coordinate shifts both formal
variables `z` and `conj z` by the same complex number. This is different from
evaluating the physical Hermite function at `z + δ` when `δ` is not real.

Agent-ID: codex-2f3d. Refs #334.
-/

namespace Grothe.UpperChaos.HermiteTranslation

open MeasureTheory Finset MvPolynomial Grothe.LowerAnalytic
open scoped InnerProductSpace ComplexConjugate

noncomputable section

/-- A finite combination of the production normalized Gaussian Hermite vectors. -/
def combination (s : Finset (ℕ × ℕ)) (a : ℕ × ℕ → ℂ) : Lp ℂ 2 gaussC :=
  ∑ i ∈ s, a i • hvec i

/-- Lower the first formal Hermite index, with its normalization factor. -/
def lower0Basis (i : ℕ × ℕ) : Lp ℂ 2 gaussC :=
  (Real.sqrt (i.1 : ℝ) : ℂ) • hvec (i.1 - 1, i.2)

/-- Lower the second formal Hermite index, with its normalization factor. -/
def lower1Basis (i : ℕ × ℕ) : Lp ℂ 2 gaussC :=
  (Real.sqrt (i.2 : ℝ) : ℂ) • hvec (i.1, i.2 - 1)

/-- First-index lowering of a finite Hermite combination. -/
def lower0 (s : Finset (ℕ × ℕ)) (a : ℕ × ℕ → ℂ) : Lp ℂ 2 gaussC :=
  ∑ i ∈ s, a i • lower0Basis i

/-- Second-index lowering of a finite Hermite combination. -/
def lower1 (s : Finset (ℕ × ℕ)) (a : ℕ × ℕ → ℂ) : Lp ℂ 2 gaussC :=
  ∑ i ∈ s, a i • lower1Basis i

/-- The lowering sum corresponding to differentiation in the real coordinate. -/
def lowerX (s : Finset (ℕ × ℕ)) (a : ℕ × ℕ → ℂ) : Lp ℂ 2 gaussC :=
  lower0 s a + lower1 s a

theorem inner_lower0Basis (i j : ℕ × ℕ) :
    ⟪lower0Basis i, lower0Basis j⟫_ℂ = if i = j then (i.1 : ℂ) else 0 := by
  rcases i with ⟨c, d⟩
  rcases j with ⟨e, f⟩
  cases c with
  | zero => simp [lower0Basis]
  | succ c =>
    cases e with
    | zero => simp [lower0Basis, Prod.mk.injEq]
    | succ e =>
      by_cases h : (c, d) = (e, f)
      · cases h
        simp only [lower0Basis, Nat.succ_sub_one, inner_smul_left, inner_smul_right,
          inner_hvec, ↓reduceIte, mul_one, Complex.conj_ofReal]
        rw [← Complex.ofReal_mul, Real.mul_self_sqrt (by positivity)]
        norm_cast
      · have hn : (c + 1, d) ≠ (e + 1, f) := by
          intro he
          apply h
          apply Prod.ext
          · have hh := congrArg Prod.fst he
            dsimp only at hh
            omega
          · have hd : d = f := by
              simpa only using congrArg (fun p : ℕ × ℕ ↦ p.2) he
            exact hd
        rw [ite_eq_right hn]
        simp only [lower0Basis, Nat.succ_sub_one, inner_smul_left, inner_smul_right,
          inner_hvec, ite_eq_right h, mul_zero]

theorem inner_lower1Basis (i j : ℕ × ℕ) :
    ⟪lower1Basis i, lower1Basis j⟫_ℂ = if i = j then (i.2 : ℂ) else 0 := by
  rcases i with ⟨c, d⟩
  rcases j with ⟨e, f⟩
  cases d with
  | zero => simp [lower1Basis]
  | succ d =>
    cases f with
    | zero => simp [lower1Basis, Prod.mk.injEq]
    | succ f =>
      by_cases h : (c, d) = (e, f)
      · cases h
        simp only [lower1Basis, Nat.succ_sub_one, inner_smul_left, inner_smul_right,
          inner_hvec, ↓reduceIte, mul_one, Complex.conj_ofReal]
        rw [← Complex.ofReal_mul, Real.mul_self_sqrt (by positivity)]
        norm_cast
      · have hn : (c, d + 1) ≠ (e, f + 1) := by
          intro he
          apply h
          apply Prod.ext
          · have hc : c = e := by
              simpa only using congrArg (fun p : ℕ × ℕ ↦ p.1) he
            exact hc
          · have hh := congrArg Prod.snd he
            dsimp only at hh
            omega
        rw [ite_eq_right hn]
        simp only [lower1Basis, Nat.succ_sub_one, inner_smul_left, inner_smul_right,
          inner_hvec, ite_eq_right h, mul_zero]

private theorem norm_sum_sq_of_inner {ι : Type*} [DecidableEq ι]
    (v : ι → Lp ℂ 2 gaussC) (w : ι → ℝ)
    (hv : ∀ i j, ⟪v i, v j⟫_ℂ = if i = j then (w i : ℂ) else 0)
    (s : Finset ι) (a : ι → ℂ) :
    ‖∑ i ∈ s, a i • v i‖ ^ 2 = ∑ i ∈ s, w i * ‖a i‖ ^ 2 := by
  have he : ⟪∑ i ∈ s, a i • v i, ∑ i ∈ s, a i • v i⟫_ℂ =
      ∑ i ∈ s, conj (a i) * a i * (w i : ℂ) := by
    simp_rw [sum_inner, inner_smul_left]
    apply Finset.sum_congr rfl
    intro i hi
    simp [inner_sum, inner_smul_right, hv, hi, mul_assoc]
  rw [@norm_sq_eq_re_inner ℂ, he, RCLike.re_to_complex, Complex.re_sum]
  apply Finset.sum_congr rfl
  intro i _
  rw [Complex.conj_mul', ← Complex.ofReal_pow, ← Complex.ofReal_mul, Complex.ofReal_re]
  ring

/-- The squared norm of a finite normalized Hermite combination. -/
theorem norm_combination_sq (s : Finset (ℕ × ℕ)) (a : ℕ × ℕ → ℂ) :
    ‖combination s a‖ ^ 2 = ∑ i ∈ s, ‖a i‖ ^ 2 := by
  simpa only [combination, one_mul, Complex.ofReal_one] using
    norm_sum_sq_of_inner hvec (fun _ ↦ 1) inner_hvec s a

/-- The first lowering energy is the coefficient energy weighted by the first index. -/
theorem norm_lower0_sq (s : Finset (ℕ × ℕ)) (a : ℕ × ℕ → ℂ) :
    ‖lower0 s a‖ ^ 2 = ∑ i ∈ s, (i.1 : ℝ) * ‖a i‖ ^ 2 :=
  norm_sum_sq_of_inner lower0Basis (fun i ↦ i.1) inner_lower0Basis s a

/-- The second lowering energy is the coefficient energy weighted by the second index. -/
theorem norm_lower1_sq (s : Finset (ℕ × ℕ)) (a : ℕ × ℕ → ℂ) :
    ‖lower1 s a‖ ^ 2 = ∑ i ∈ s, (i.2 : ℝ) * ‖a i‖ ^ 2 :=
  norm_sum_sq_of_inner lower1Basis (fun i ↦ i.2) inner_lower1Basis s a

/-- Total degree controls the sum of the two lowering energies exactly. -/
theorem lowering_energy_le (D : ℕ) (s : Finset (ℕ × ℕ)) (a : ℕ × ℕ → ℂ)
    (hD : ∀ i ∈ s, i.1 + i.2 ≤ D) :
    ‖lower0 s a‖ ^ 2 + ‖lower1 s a‖ ^ 2 ≤ (D : ℝ) * ‖combination s a‖ ^ 2 := by
  rw [norm_lower0_sq, norm_lower1_sq, norm_combination_sq, ← Finset.sum_add_distrib,
    Finset.mul_sum]
  apply Finset.sum_le_sum
  intro i hi
  have h : (i.1 : ℝ) + (i.2 : ℝ) ≤ (D : ℝ) := by exact_mod_cast hD i hi
  calc
    _ = ((i.1 : ℝ) + (i.2 : ℝ)) * ‖a i‖ ^ 2 := by ring
    _ ≤ _ := mul_le_mul_of_nonneg_right h (sq_nonneg _)

/-- The real-coordinate lowering sum has squared operator bound `2 * D`. -/
theorem norm_lowerX_sq_le (D : ℕ) (s : Finset (ℕ × ℕ)) (a : ℕ × ℕ → ℂ)
    (hD : ∀ i ∈ s, i.1 + i.2 ≤ D) :
    ‖lowerX s a‖ ^ 2 ≤ (2 * D : ℝ) * ‖combination s a‖ ^ 2 := by
  have hsum := norm_add_le (lower0 s a) (lower1 s a)
  have hnonneg := norm_nonneg (lower0 s a + lower1 s a)
  have hsq := pow_le_pow_left₀ hnonneg hsum 2
  have henergy := lowering_energy_le D s a hD
  dsimp only [lowerX]
  nlinarith [sq_nonneg (‖lower0 s a‖ - ‖lower1 s a‖), norm_nonneg (lower0 s a),
    norm_nonneg (lower1 s a)]

/-- The exact `sqrt (2 * D)` bound for a finite Gaussian Hermite lowering sum. -/
theorem norm_lowerX_le (D : ℕ) (s : Finset (ℕ × ℕ)) (a : ℕ × ℕ → ℂ)
    (hD : ∀ i ∈ s, i.1 + i.2 ≤ D) :
    ‖lowerX s a‖ ≤ Real.sqrt (2 * D) * ‖combination s a‖ := by
  have h := norm_lowerX_sq_le D s a hD
  have hs : (Real.sqrt (2 * D) * ‖combination s a‖) ^ 2 =
      (2 * D : ℝ) * ‖combination s a‖ ^ 2 := by
    rw [mul_pow, Real.sq_sqrt (by positivity)]
  exact (pow_le_pow_iff_left₀ (norm_nonneg _) (by positivity) (by norm_num : 2 ≠ 0)).mp
    (h.trans_eq hs.symm)

/-- The production normalized Hermite polynomial before evaluation on the Gaussian plane. -/
def normalizedPolynomial (i : ℕ × ℕ) : CPoly := (nrm i.1 i.2 : ℂ) • H i.1 i.2

/-- The finite polynomial represented by a normalized Hermite coefficient vector. -/
def polynomialCombination (s : Finset (ℕ × ℕ)) (a : ℕ × ℕ → ℂ) : CPoly :=
  ∑ i ∈ s, a i • normalizedPolynomial i

/-- Formal differentiation along the real coordinate, so both formal variables vary. -/
def derivativeX (P : CPoly) : CPoly := pderiv 0 P + pderiv 1 P

/-- Polynomial evaluation as a linear map into the actual Gaussian `L²` space. -/
def evalL2 : CPoly →ₗ[ℂ] Lp ℂ 2 gaussC where
  toFun P := (memLp_ev P).toLp (fun z ↦ ev z P)
  map_add' P Q := by
    rw [← MemLp.toLp_add]
    apply MemLp.toLp_congr
    exact Filter.Eventually.of_forall (fun z ↦ by simp [ev])
  map_smul' c P := by
    rw [← MemLp.toLp_const_smul]
    apply MemLp.toLp_congr
    exact Filter.Eventually.of_forall (fun z ↦ by simp [ev])

theorem evalL2_normalizedPolynomial (i : ℕ × ℕ) :
    evalL2 (normalizedPolynomial i) = hvec i := by
  change (memLp_ev _).toLp _ = (memLp_hfun i).toLp _
  apply MemLp.toLp_congr
  exact Filter.Eventually.of_forall (fun z ↦ by
    simp only [normalizedPolynomial, hfun, ev, ← C_mul', map_mul, eval_C])

theorem evalL2_polynomialCombination (s : Finset (ℕ × ℕ)) (a : ℕ × ℕ → ℂ) :
    evalL2 (polynomialCombination s a) = combination s a := by
  simp only [polynomialCombination, map_sum, map_smul, evalL2_normalizedPolynomial, combination]

private theorem nrm_square (c d : ℕ) :
    nrm c d ^ 2 = (((c.factorial * d.factorial : ℕ) : ℝ))⁻¹ := by
  rw [nrm, inv_pow, Real.sq_sqrt (by positivity)]

private theorem sqrt_mul_nrm_succ_left (c d : ℕ) :
    Real.sqrt ((c + 1 : ℕ) : ℝ) * nrm (c + 1) d = nrm c d := by
  apply (sq_eq_sq₀
    (mul_nonneg (Real.sqrt_nonneg _) (nrm_pos _ _).le) (nrm_pos _ _).le).mp
  rw [mul_pow, Real.sq_sqrt (by positivity), nrm_square, nrm_square]
  have hc : (c.factorial : ℝ) ≠ 0 := by positivity
  have hd : (d.factorial : ℝ) ≠ 0 := by positivity
  have hc1 : (c : ℝ) + 1 ≠ 0 := by positivity
  simp only [Nat.factorial_succ, Nat.cast_mul, Nat.cast_add, Nat.cast_one]
  field_simp [hc, hd, hc1]

private theorem nrm_swap (c d : ℕ) : nrm c d = nrm d c := by
  simp only [nrm, Nat.mul_comm]

private theorem nrm_succ_factor_left (c d : ℕ) :
    nrm (c + 1) d * ((c + 1 : ℕ) : ℝ) = Real.sqrt ((c + 1 : ℕ) : ℝ) * nrm c d := by
  rw [← sqrt_mul_nrm_succ_left c d, ← mul_assoc,
    Real.mul_self_sqrt (by positivity)]
  ring

private theorem nrm_succ_factor_right (c d : ℕ) :
    nrm c (d + 1) * ((d + 1 : ℕ) : ℝ) = Real.sqrt ((d + 1 : ℕ) : ℝ) * nrm c d := by
  rw [nrm_swap c (d + 1), nrm_succ_factor_left, nrm_swap d c]

/-- First formal differentiation is exactly normalized first-index lowering. -/
theorem pderiv0_normalizedPolynomial (i : ℕ × ℕ) :
    pderiv 0 (normalizedPolynomial i) =
      (Real.sqrt (i.1 : ℝ) : ℂ) • normalizedPolynomial (i.1 - 1, i.2) := by
  rcases i with ⟨c, d⟩
  cases c with
  | zero => simp [normalizedPolynomial, pderiv0_H_zero]
  | succ c =>
    simp only [normalizedPolynomial, Derivation.map_smul, pderiv0_H_succ, Nat.succ_sub_one]
    rw [← Nat.cast_smul_eq_nsmul ℂ, smul_smul, smul_smul]
    congr 1
    exact_mod_cast nrm_succ_factor_left c d

/-- Second formal differentiation is exactly normalized second-index lowering. -/
theorem pderiv1_normalizedPolynomial (i : ℕ × ℕ) :
    pderiv 1 (normalizedPolynomial i) =
      (Real.sqrt (i.2 : ℝ) : ℂ) • normalizedPolynomial (i.1, i.2 - 1) := by
  rcases i with ⟨c, d⟩
  cases d with
  | zero => simp [normalizedPolynomial, pderiv1_H_zero]
  | succ d =>
    simp only [normalizedPolynomial, Derivation.map_smul, pderiv1_H_succ, Nat.succ_sub_one]
    rw [← Nat.cast_smul_eq_nsmul ℂ, smul_smul, smul_smul]
    congr 1
    exact_mod_cast nrm_succ_factor_right c d

/-- The lowering sum is the Gaussian vector of the actual formal derivative. -/
theorem evalL2_derivativeX_polynomialCombination (s : Finset (ℕ × ℕ))
    (a : ℕ × ℕ → ℂ) :
    evalL2 (derivativeX (polynomialCombination s a)) = lowerX s a := by
  simp only [derivativeX, polynomialCombination, map_add, map_sum, Derivation.map_smul, map_smul,
    pderiv0_normalizedPolynomial, pderiv1_normalizedPolynomial,
    evalL2_normalizedPolynomial, lowerX, lower0, lower1, lower0Basis, lower1Basis]

/-- The Gaussian norm of the actual polynomial real-coordinate derivative. -/
theorem norm_derivativeX_le (D : ℕ) (s : Finset (ℕ × ℕ)) (a : ℕ × ℕ → ℂ)
    (hD : ∀ i ∈ s, i.1 + i.2 ≤ D) :
    ‖evalL2 (derivativeX (polynomialCombination s a))‖ ≤
      Real.sqrt (2 * D) * ‖evalL2 (polynomialCombination s a)‖ := by
  rw [evalL2_derivativeX_polynomialCombination, evalL2_polynomialCombination]
  exact norm_lowerX_le D s a hD

/-- All conditional modes with total degree at most `D`. -/
def modes (D : ℕ) : Finset (ℕ × ℕ) :=
  ((range (D + 1)) ×ˢ (range (D + 1))).filter fun i ↦ i.1 + i.2 ≤ D

theorem mem_modes (D : ℕ) (i : ℕ × ℕ) : i ∈ modes D ↔ i.1 + i.2 ≤ D := by
  simp only [modes, mem_filter, mem_product, mem_range]
  omega

/-- The actual finite-dimensional polynomial space of Hermite degree at most `D`. -/
def polynomialSpace (D : ℕ) : Submodule ℂ CPoly :=
  Submodule.span ℂ (normalizedPolynomial '' (modes D : Set (ℕ × ℕ)))

theorem normalizedPolynomial_mem (D : ℕ) (i : ℕ × ℕ) (hi : i.1 + i.2 ≤ D) :
    normalizedPolynomial i ∈ polynomialSpace D :=
  Submodule.subset_span ⟨i, (mem_modes D i).2 hi, rfl⟩

theorem derivativeX_mem (D : ℕ) (P : CPoly) (hP : P ∈ polynomialSpace D) :
    derivativeX P ∈ polynomialSpace D := by
  obtain ⟨a, ha⟩ := (Submodule.mem_span_image_finset_iff_exists_fun' ℂ).mp hP
  rw [← ha, derivativeX, map_sum, map_sum]
  apply Submodule.add_mem
  · apply Submodule.sum_mem
    intro i hi
    rw [Derivation.map_smul, pderiv0_normalizedPolynomial]
    apply Submodule.smul_mem
    apply Submodule.smul_mem
    apply normalizedPolynomial_mem
    have h := (mem_modes D i).1 hi
    omega
  · apply Submodule.sum_mem
    intro i hi
    rw [Derivation.map_smul, pderiv1_normalizedPolynomial]
    apply Submodule.smul_mem
    apply Submodule.smul_mem
    apply normalizedPolynomial_mem
    have h := (mem_modes D i).1 hi
    omega

/-- The derivative bound on the entire finite Hermite polynomial space. -/
theorem norm_derivativeX_le_of_mem (D : ℕ) (P : CPoly) (hP : P ∈ polynomialSpace D) :
    ‖evalL2 (derivativeX P)‖ ≤ Real.sqrt (2 * D) * ‖evalL2 P‖ := by
  obtain ⟨a, ha⟩ := (Submodule.mem_span_image_finset_iff_exists_fun' ℂ).mp hP
  change polynomialCombination (modes D) a = P at ha
  rw [← ha]
  exact norm_derivativeX_le D (modes D) a (fun i hi ↦ (mem_modes D i).1 hi)

theorem derivativeX_iterate_mem (D : ℕ) (P : CPoly) (hP : P ∈ polynomialSpace D) (k : ℕ) :
    (derivativeX^[k]) P ∈ polynomialSpace D := by
  induction k with
  | zero => exact hP
  | succ k ih =>
    rw [Function.iterate_succ_apply']
    exact derivativeX_mem D _ ih

/-- Every iterated derivative has the corresponding power of the same operator bound. -/
theorem norm_derivativeX_iterate_le (D : ℕ) (P : CPoly) (hP : P ∈ polynomialSpace D)
    (k : ℕ) :
    ‖evalL2 ((derivativeX^[k]) P)‖ ≤ Real.sqrt (2 * D) ^ k * ‖evalL2 P‖ := by
  induction k with
  | zero => simp
  | succ k ih =>
    rw [Function.iterate_succ_apply']
    calc
      _ ≤ Real.sqrt (2 * D) * ‖evalL2 ((derivativeX^[k]) P)‖ :=
        norm_derivativeX_le_of_mem D _ (derivativeX_iterate_mem D P hP k)
      _ ≤ Real.sqrt (2 * D) * (Real.sqrt (2 * D) ^ k * ‖evalL2 P‖) :=
        mul_le_mul_of_nonneg_left ih (Real.sqrt_nonneg _)
      _ = Real.sqrt (2 * D) ^ (k + 1) * ‖evalL2 P‖ := by rw [pow_succ]; ring

/-- The explicit finite Taylor series for common translation of the two formal variables. -/
def finiteTaylor (D : ℕ) (δ : ℂ) (P : CPoly) : CPoly :=
  ∑ k ∈ range (D + 1), (δ ^ k / (k.factorial : ℂ)) • (derivativeX^[k]) P

/-- The finite Taylor series has the Gaussian exponential norm bound.
Identification with formal substitution is a separate algebraic statement. -/
theorem norm_finiteTaylor_le (D : ℕ) (δ : ℂ) (P : CPoly) (hP : P ∈ polynomialSpace D) :
    ‖evalL2 (finiteTaylor D δ P)‖ ≤
      Real.exp (‖δ‖ * Real.sqrt (2 * D)) * ‖evalL2 P‖ := by
  rw [finiteTaylor, map_sum]
  calc
    _ ≤ ∑ k ∈ range (D + 1),
        ‖evalL2 ((δ ^ k / (k.factorial : ℂ)) • (derivativeX^[k]) P)‖ := norm_sum_le _ _
    _ ≤ ∑ k ∈ range (D + 1),
        ((‖δ‖ * Real.sqrt (2 * D)) ^ k / (k.factorial : ℝ)) * ‖evalL2 P‖ := by
      apply Finset.sum_le_sum
      intro k _
      rw [map_smul, norm_smul, norm_div, norm_pow]
      have hfac : ‖(k.factorial : ℂ)‖ = (k.factorial : ℝ) := by simp
      rw [hfac]
      calc
        _ ≤ (‖δ‖ ^ k / (k.factorial : ℝ)) *
            (Real.sqrt (2 * D) ^ k * ‖evalL2 P‖) :=
          mul_le_mul_of_nonneg_left (norm_derivativeX_iterate_le D P hP k) (by positivity)
        _ = _ := by rw [mul_pow]; ring
    _ = (∑ k ∈ range (D + 1),
        (‖δ‖ * Real.sqrt (2 * D)) ^ k / (k.factorial : ℝ)) * ‖evalL2 P‖ :=
      (Finset.sum_mul ..).symm
    _ ≤ _ := mul_le_mul_of_nonneg_right
      (Real.sum_le_exp_of_nonneg (by positivity) (D + 1)) (norm_nonneg _)

end

end Grothe.UpperChaos.HermiteTranslation

open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.HermiteTranslation.norm_lower0_sq,
      ``Grothe.UpperChaos.HermiteTranslation.norm_lower1_sq,
      ``Grothe.UpperChaos.HermiteTranslation.norm_lowerX_le,
      ``Grothe.UpperChaos.HermiteTranslation.norm_derivativeX_le,
      ``Grothe.UpperChaos.HermiteTranslation.norm_finiteTaylor_le] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[`propext, `Classical.choice, `Quot.sound].contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
