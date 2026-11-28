import Grothe.LowerAnalytic.WitnessCap
import Grothe.StatementBridges

/-!
# The degree-five Gaussian witness

On complex Gaussian space the charge-one polynomials through degree five have monomials
of bidegrees (1,0), (2,1), and (3,2). Removing the lower-degree subspace gives the
orthogonal projection used by the multiplier `P₁₀ − e P₂₁ + η P₃₂`.
Its vector value tends to at least one for nonnegative weights. Thus a uniform upper
bound on the explicit scalar payoff for unimodular pairs suffices for the finite-matrix
lower bound.

Agent-ID: codex-a7c4
-/

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

/-- The lower chaoses and their orthogonal fifth-degree complement span all charge-one
polynomials of degree at most five. -/
theorem chargeOne5_decomposition : H10 n ⊔ H21 n ⊔ H32 n = chargeOne5 n := by
  have h3 : H10 n ≤ chargeOne3 n := Submodule.span_mono Set.subset_union_left
  have h5 : chargeOne3 n ≤ chargeOne5 n := le_sup_left
  have := Submodule.complete_of_finiteDimensional (chargeOne3 n)
  have h13 : H10 n ⊔ H21 n = chargeOne3 n := by
    simpa only [H21, inf_comm] using Submodule.sup_orthogonal_inf_of_hasOrthogonalProjection h3
  rw [h13]
  simpa only [H32, inf_comm] using Submodule.sup_orthogonal_inf_of_hasOrthogonalProjection h5

/-- Projecting the quintic monomials removes all lower-degree terms and spans exactly the
fifth-chaos subspace. This supplies concrete generators even when some indices coincide. -/
theorem H32_eq_span_projected_quintics :
    H32 n = Submodule.span ℂ (Set.range fun p => (H32 n).starProjection (quinticMonomialL n p)) := by
  let S := Submodule.span ℂ (Set.range fun p => (H32 n).starProjection (quinticMonomialL n p))
  have hkill : chargeOne3 n ≤ (H32 n)ᗮ :=
    (chargeOne3 n).le_orthogonal_orthogonal.trans
      (Submodule.orthogonal_le (inf_le_right : H32 n ≤ (chargeOne3 n)ᗮ))
  have hmap : chargeOne5 n ≤ S.comap (H32 n).starProjection.toLinearMap := by
    refine sup_le ?_ (Submodule.span_le.mpr ?_)
    · intro u hu
      change (H32 n).starProjection u ∈ S
      rw [(H32 n).starProjection_apply_eq_zero_iff.mpr (hkill hu)]
      exact S.zero_mem
    · rintro _ ⟨p, rfl⟩
      exact Submodule.subset_span ⟨p, rfl⟩
  apply le_antisymm
  · intro u hu
    have h := hmap (show u ∈ chargeOne5 n from hu.1)
    change (H32 n).starProjection u ∈ S at h
    rwa [Submodule.starProjection_eq_self_iff.mpr hu] at h
  · apply Submodule.span_le.mpr
    rintro _ ⟨p, rfl⟩
    exact (H32 n).starProjection_apply_mem _

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

/-- A bound on the real payoff suffices even when the scalar pairing has arbitrary phase. -/
theorem quinticScalarCap_of_payoff_le {e η B : ℝ}
    (h : ∀ f g : L2G n, f ∈ Unimod (stdGaussian (n + n)) →
      g ∈ Unimod (stdGaussian (n + n)) → quinticPayoff n e η f g ≤ B) :
    ScalarCap (stdGaussian (n + n)) (quinticWitness n e η) B := by
  intro f hf g hg
  obtain ⟨θ, hθ, hθw⟩ := exists_phase (inner ℂ f (quinticWitness n e η g))
  have hc := h f (θ • g) hf (smul_mem_unimod n hθ hg)
  rwa [← re_inner_quinticWitness, map_smul, inner_smul_right, hθw, Complex.ofReal_re] at hc

/-- Positivity of the added fifth-chaos projection preserves the radial vector value. -/
theorem norm_pairVal_quinticWitness {e η : ℝ} (he : 0 ≤ e) (hη : 0 ≤ η) (hn : 0 < n) :
    1 - (1 + e) / (n + 1) ≤ ‖pairVal (quinticWitness n e η) (uL n) (uL n)‖ := by
  apply le_trans _ (Complex.re_le_norm _)
  refine (re_pairVal_witnessOf n (H21 n) (H21_le_orthogonal n) he (le_refl 0) hn).trans ?_
  unfold pairVal
  rw [Complex.re_sum, Complex.re_sum]
  apply Finset.sum_le_sum
  intro i _
  change (inner ℂ (uL n i) (witness n e 0 (uL n i))).re ≤ _
  rw [quinticWitness_apply, inner_add_right, inner_smul_right, Complex.add_re,
    Complex.re_ofReal_mul, re_inner_starProjection]
  exact le_add_of_nonneg_right (mul_nonneg hη (sq_nonneg _))

/-- Scalar payoff bounds in all sufficiently large dimensions give the finite-matrix transfer
inputs for this actual Gaussian witness. -/
theorem transferInputs_of_quinticPayoff {e η B : ℝ} (he : 0 ≤ e) (hη : 0 ≤ η) (N : ℕ)
    (hcap : ∀ n, N ≤ n → ∀ f g : L2G n, f ∈ Unimod (stdGaussian (n + n)) →
      g ∈ Unimod (stdGaussian (n + n)) → quinticPayoff n e η f g ≤ B) : TransferInputsL2 B := by
  intro δ hδ
  obtain ⟨n, hn⟩ := exists_nat_gt (max (N : ℝ) ((1 + e) / δ))
  have hN : (N : ℝ) < n := (le_max_left _ _).trans_lt hn
  have hn' : N < n := by exact_mod_cast hN
  have hfrac := (le_max_right _ _).trans_lt hn
  rw [div_lt_iff₀ hδ] at hfrac
  have hδn : (1 + e) / (n + 1) ≤ δ := by
    rw [div_le_iff₀ (by positivity)]; nlinarith
  exact ⟨Fin (n + n) → ℝ, inferInstance, stdGaussian (n + n), inferInstance, quinticWitness n e η,
    Fin n, inferInstance, uL n, uL n, quinticScalarCap_of_payoff_le n (hcap n hn'.le),
    ae_sum_normSq_uL_le n, ae_sum_normSq_uL_le n,
    (by linarith : 1 - δ ≤ 1 - (1 + e) / (n + 1)).trans
      (norm_pairVal_quinticWitness n he hη (Nat.zero_le N |>.trans_lt hn'))⟩

end

end Grothe.LowerAnalytic

namespace Grothe.Statement

open Grothe.Lower Grothe.LowerAnalytic

/-- A uniform real scalar payoff bound implies its reciprocal lower bound on the complex
Grothendieck constant. The nonemptiness hypothesis is the usual upper-bound existence. -/
theorem lower_of_quinticPayoff {e η B : ℝ} (he : 0 ≤ e) (hη : 0 ≤ η) (N : ℕ)
    (hcap : ∀ n, N ≤ n → ∀ f g : L2G n, f ∈ Unimod (stdGaussian (n + n)) →
      g ∈ Unimod (stdGaussian (n + n)) → quinticPayoff n e η f g ≤ B)
    (hne : ∃ K, IsBound K) : 1 / B ≤ complexGrothendieckConstant :=
  le_csInf hne fun _ hK ↦ transfer_lower (transferInputs_of_quinticPayoff he hη N hcap)
    (isBound_iff.mp hK)

end Grothe.Statement
