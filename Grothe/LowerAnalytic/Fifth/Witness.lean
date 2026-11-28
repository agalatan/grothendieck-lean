import Grothe.LowerAnalytic.WitnessCap

/-! # The fifth Hermite projection and its signed matrix witness

Agent-ID: codex-a7c4
-/

set_option warningAsError true

namespace Grothe.LowerAnalytic

open MeasureTheory MvPolynomial Grothe.Lower
open scoped ComplexConjugate

noncomputable section

variable (n : ℕ)

/-- A charge-one quintic monomial, allowing repeated coordinate indices. -/
def quinticMonomial (p : Fin 5 → Fin n) (x : Fin (n + n) → ℝ) : ℂ :=
  zc n (p 0) x * zc n (p 1) x * zc n (p 2) x * conj (zc n (p 3) x) * conj (zc n (p 4) x)

private lemma continuous_quinticMonomial (p : Fin 5 → Fin n) : Continuous (quinticMonomial n p) :=
  ((((continuous_zc n (p 0)).mul (continuous_zc n (p 1))).mul (continuous_zc n (p 2))).mul
    (Complex.continuous_conj.comp (continuous_zc n (p 3)))).mul
    (Complex.continuous_conj.comp (continuous_zc n (p 4)))

lemma memLp_quinticMonomial (p : Fin 5 → Fin n) :
    MemLp (quinticMonomial n p) 2 (stdGaussian (n + n)) := by
  rw [memLp_two_iff_integrable_sq_norm (continuous_quinticMonomial n p).aestronglyMeasurable]
  refine integrable_of_abs_le_eval ((continuous_quinticMonomial n p).norm.pow 2).aestronglyMeasurable
    ((∑ i : Fin (n + n), X i ^ 2) ^ 5) fun x => ?_
  simp only [map_pow, map_sum, eval_X]
  rw [← rad_sq, abs_of_nonneg (sq_nonneg _)]
  simp only [quinticMonomial, norm_mul, Complex.norm_conj, mul_pow]
  calc _ ≤ rad n x ^ 2 * rad n x ^ 2 * rad n x ^ 2 * rad n x ^ 2 * rad n x ^ 2 := by
            gcongr <;> exact norm_zc_le n _ x
       _ = (rad n x ^ 2) ^ 5 := by ring

/-- The quintic monomial in Gaussian L². -/
def quinticMonomialL (p : Fin 5 → Fin n) : L2G n := (memLp_quinticMonomial n p).toLp _

/-- All charge-one polynomials through degree five in Gaussian L². -/
def chargeOne5 : Submodule ℂ (L2G n) :=
  chargeOne3 n ⊔ Submodule.span ℂ (Set.range (quinticMonomialL n))

instance : FiniteDimensional ℂ (chargeOne5 n) := by
  unfold chargeOne5
  let : FiniteDimensional ℂ (Submodule.span ℂ (Set.range (quinticMonomialL n))) :=
    FiniteDimensional.span_of_finite ℂ (Set.finite_range _)
  infer_instance

/-- The fifth chaos in the charge-one sector, orthogonal to all lower-degree terms. -/
def H32 : Submodule ℂ (L2G n) := chargeOne5 n ⊓ (chargeOne3 n)ᗮ

instance : FiniteDimensional ℂ (H32 n) := Submodule.finiteDimensional_inf_left _ _

instance : (H32 n).HasOrthogonalProjection := by
  have := Submodule.complete_of_finiteDimensional (H32 n)
  infer_instance

theorem H32_le_orthogonal : H32 n ≤ (H10 n)ᗮ :=
  (inf_le_right : H32 n ≤ (chargeOne3 n)ᗮ).trans
    (Submodule.orthogonal_le (Submodule.span_mono Set.subset_union_left))

theorem H32_le_H21_orthogonal : H32 n ≤ (H21 n)ᗮ :=
  (inf_le_right : H32 n ≤ (chargeOne3 n)ᗮ).trans
    (Submodule.orthogonal_le (inf_le_left : H21 n ≤ chargeOne3 n))

/-- The three projected energies share one L² budget. -/
theorem quintic_projection_energy_le (u : L2G n) :
    ‖(H10 n).starProjection u‖ ^ 2 + ‖(H21 n).starProjection u‖ ^ 2 +
      ‖(H32 n).starProjection u‖ ^ 2 ≤ ‖u‖ ^ 2 := by
  have h := normSq_starProjection_add_le (H21 n) (H32 n) (H32_le_H21_orthogonal n)
    ((H10 n)ᗮ.starProjection u)
  have project (K : Submodule ℂ (L2G n)) [K.HasOrthogonalProjection] (hK : K ≤ (H10 n)ᗮ) :
      K.starProjection ((H10 n)ᗮ.starProjection u) = K.starProjection u := by
    rw [← ContinuousLinearMap.comp_apply, Submodule.starProjection_comp_starProjection_of_le hK]
  rw [project _ (H21_le_orthogonal n), project _ (H32_le_orthogonal n)] at h
  linarith [Submodule.norm_sq_eq_add_norm_sq_starProjection u (H10 n)]

/-- The spectral multiplier with coefficients (1, −e, η) on the three charge-one chaoses. -/
def quinticWitness (e η : ℝ) : L2G n →L[ℂ] L2G n :=
  witness n e 0 + (η : ℂ) • (H32 n).starProjection

private lemma quinticWitness_apply (e η : ℝ) (u : L2G n) :
    quinticWitness n e η u = witness n e 0 u + (η : ℂ) • (H32 n).starProjection u := rfl

/-- The exact real scalar payoff, including the signed fifth-chaos energy difference. -/
def quinticPayoff (e η : ℝ) (f g : L2G n) : ℝ :=
  VOf n e 0 f g + η * (‖(H32 n).starProjection (hOf n f g)‖ ^ 2 -
    ‖(H32 n).starProjection (kOf n f g)‖ ^ 2)

private lemma re_inner_projection_polar (h k : L2G n) :
    (inner ℂ (h + k) ((H32 n).starProjection (h - k))).re =
      ‖(H32 n).starProjection h‖ ^ 2 - ‖(H32 n).starProjection k‖ ^ 2 := by
  rw [map_sub, inner_add_left, inner_sub_right, inner_sub_right]
  have hs : inner ℂ k ((H32 n).starProjection h) = conj (inner ℂ h ((H32 n).starProjection k)) := by
    rw [← inner_conj_symm, Submodule.inner_starProjection_left_eq_right]
  simp only [hs, Complex.sub_re, Complex.add_re, Complex.conj_re, re_inner_starProjection]
  ring

theorem re_inner_quinticWitness (e η : ℝ) (f g : L2G n) :
    (inner ℂ f (quinticWitness n e η g)).re = quinticPayoff n e η f g := by
  have hp := re_inner_projection_polar n (hOf n f g) (kOf n f g)
  rw [hOf_add_kOf, hOf_sub_kOf] at hp
  change _ = (inner ℂ f (witness n e 0 g)).re + η * _
  rw [quinticWitness_apply, inner_add_right, inner_smul_right, Complex.add_re,
    Complex.re_ofReal_mul, hp]

end

end Grothe.LowerAnalytic

namespace Grothe.LowerAnalytic

open MeasureTheory Grothe.Lower

/-- Reduce the fifth eigenvalue of the identity-tail witness by a nonnegative amount. -/
noncomputable def signedFifthWitness (n : ℕ) (e ν debit : ℝ) : L2G n →L[ℂ] L2G n :=
  witness n e ν - (debit : ℂ) • (H32 n).starProjection

/-- The multiplier acts on the signed difference of fifth-sector energies. -/
theorem signedFifth_payoff (n : ℕ) (e ν debit : ℝ) (f g : L2G n) :
    (inner ℂ f (signedFifthWitness n e ν debit g)).re = VOf n e ν f g -
      debit * (‖(H32 n).starProjection (hOf n f g)‖^2 - ‖(H32 n).starProjection (kOf n f g)‖^2) := by
  have hp := re_inner_quinticWitness n 0 1 f g
  change (inner ℂ f (witness n 0 0 g + ((1:ℝ):ℂ) • (H32 n).starProjection g)).re = _ at hp
  simp only [Complex.ofReal_one,one_smul,inner_add_right,Complex.add_re,quinticPayoff,VOf,one_mul] at hp
  change (inner ℂ f (witness n e ν g - (debit:ℂ) • (H32 n).starProjection g)).re = _
  rw [inner_sub_right,inner_smul_right,Complex.sub_re,Complex.re_ofReal_mul]
  unfold VOf
  rw [add_left_cancel hp]

/-- The fifth-chaos debit is paid by the original positive tail on that subspace. -/
theorem signedFifth_diagonal {n : ℕ} {e ν debit : ℝ} (hdebit : 0 ≤ debit) (hν : debit ≤ ν)
    (u : L2G n) :
    (inner ℂ u (witness n e 0 u)).re ≤ (inner ℂ u (signedFifthWitness n e ν debit u)).re := by
  change _ ≤ (inner ℂ u (witness n e ν u - (debit:ℂ) • (H32 n).starProjection u)).re
  rw [inner_sub_right,inner_smul_right,Complex.sub_re,Complex.re_ofReal_mul,re_inner_starProjection]
  simp only [witness,re_inner_witnessOf,zero_mul,add_zero]
  have h := quintic_projection_energy_le n u
  have htail : ‖(H32 n).starProjection u‖^2 ≤ ‖u‖^2-‖(H10 n).starProjection u‖^2-‖(H21 n).starProjection u‖^2 := by linarith
  linarith only [mul_le_mul_of_nonneg_left htail (hdebit.trans hν),
    mul_le_mul_of_nonneg_right hν (sq_nonneg ‖(H32 n).starProjection u‖)]

/-- A nonzero negative fifth adjustment preserves the vector asymptotic normalization. -/
theorem signedFifth_vector {n : ℕ} (hn : 0 < n) {e ν debit : ℝ} (he : 0 ≤ e) (hdebit : 0 ≤ debit) (hν : debit ≤ ν) :
    1-(1+e)/(n+1) ≤ (pairVal (signedFifthWitness n e ν debit) (uL n) (uL n)).re := by
  apply (re_pairVal_witnessOf n (H21 n) (H21_le_orthogonal n) (ν := 0) he (by norm_num) hn).trans
  simp only [pairVal,Complex.re_sum]
  exact Finset.sum_le_sum fun i _ => signedFifth_diagonal hdebit hν (uL n i)

/-- All remaining information needed for the finite-matrix bound is a scalar payoff
cap for the signed operator on physical pairs. -/
theorem signedFifth_transfer {e ν debit B : ℝ} (he : 0 ≤ e) (hdebit : 0 ≤ debit) (hν : debit ≤ ν)
    (N : ℕ) (hc : ∀ n, N ≤ n → ∀ f g : L2G n, f ∈ Unimod (stdGaussian (n+n)) →
      g ∈ Unimod (stdGaussian (n+n)) → (inner ℂ f (signedFifthWitness n e ν debit g)).re ≤ B) :
    TransferInputsL2 B := by
  intro δ hδ
  obtain ⟨n,hn⟩ := exists_nat_gt (max (N:ℝ) ((1+e)/δ))
  have hN : (N:ℝ) < n := (le_max_left _ _).trans_lt hn
  have hn' : N < n := by exact_mod_cast hN
  have hfrac := (le_max_right _ _).trans_lt hn
  rw [div_lt_iff₀ hδ] at hfrac
  have hδn : (1+e)/(n+1:ℝ) ≤ δ := by rw [div_le_iff₀ (by positivity)]; nlinarith
  refine ⟨Fin (n+n) → ℝ,inferInstance,stdGaussian (n+n),inferInstance,signedFifthWitness n e ν debit,
    Fin n,inferInstance,uL n,uL n,?_,ae_sum_normSq_uL_le n,ae_sum_normSq_uL_le n,
    ((by linarith : 1-δ ≤ 1-(1+e)/(n+1))).trans
      ((signedFifth_vector (Nat.zero_le N |>.trans_lt hn') he hdebit hν).trans (Complex.re_le_norm _))⟩
  intro f hf g hg
  obtain ⟨θ,hθ,hθw⟩ := exists_phase (inner ℂ f (signedFifthWitness n e ν debit g))
  have h := hc n hn'.le f (θ • g) hf (smul_mem_unimod n hθ hg)
  rwa [map_smul,inner_smul_right,hθw,Complex.ofReal_re] at h

end Grothe.LowerAnalytic
