import QuinticResearch.QuinticWitness
import Grothe.StatementBridges

/-! # The pure degree-five witness and its finite-matrix transfer -/

namespace Grothe.LowerAnalytic

open MeasureTheory MvPolynomial Grothe.Lower
open scoped ComplexConjugate

noncomputable section

variable (n : ℕ)

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
  rw [show quinticWitness n e η (uL n i) = witness n e 0 (uL n i) + (η : ℂ) • (H32 n).starProjection (uL n i) from rfl, inner_add_right, inner_smul_right, Complex.add_re,
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
