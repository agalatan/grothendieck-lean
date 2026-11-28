import QuinticResearch.SignedFifth

set_option warningAsError true

/-! Signed fifth-chaos perturbations. Agent-ID: codex-a7c4 -/
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

/-- An actual improvement in the scalar payoff of each upper-arm physical pair. -/
theorem signedFifth_payoff_high {n : ℕ} {e ν debit : ℝ} (hd : 0 ≤ debit)
    {f g : L2G (n+1)} (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (ht : (886176:ℝ)/1000000 ≤ tOf (n+1) f g) :
    (inner ℂ f (signedFifthWitness (n+1) e ν debit g)).re ≤ VOf (n+1) e ν f g - debit*(154/10000) := by
  rw [signedFifth_payoff]
  exact sub_le_sub_left (mul_le_mul_of_nonneg_left (signed_fifth_at_least_154 hf hg ht) hd) _

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
