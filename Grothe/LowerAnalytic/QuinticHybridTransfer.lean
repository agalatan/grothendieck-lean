import Grothe.LowerAnalytic.QuinticWitness
import Grothe.StatementBridges
import Grothe.LowerAnalytic.LowerBoundTight

/-!
# A mixed degree-five and identity-tail witness

The two witnesses share the first-chaos vector. A binding-row argument can cap the
convex mixture on the original phase pair before the transfer to finite matrices.

Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic

open Grothe.Lower MeasureTheory

noncomputable section

def quinticHybridWitness (n : ℕ) (w e η : ℝ) : L2G n →L[ℂ] L2G n :=
  ((1-w : ℝ) : ℂ) • witness n (191/250) (47/2000) + (w : ℂ) • quinticWitness n e η

/-- Inside the mixture the separate multiplier on the fifth chaos is precisely
`w * η`, in addition to the remaining identity tail. -/
theorem quinticHybrid_eq_tail_add_quintic (n : ℕ) (w e η : ℝ) :
    quinticHybridWitness n w e η = witness n ((1-w)*(191/250)+w*e) ((1-w)*(47/2000)) +
      (↑(w*η : ℝ) : ℂ) • (H32 n).starProjection := by
  unfold quinticHybridWitness quinticWitness witness witnessOf
  push_cast
  module

theorem re_inner_quinticHybridWitness (n : ℕ) (w e η : ℝ) (f g : L2G n) :
    (inner ℂ f (quinticHybridWitness n w e η g)).re =
      (1-w)*VOf n (191/250) (47/2000) f g + w*quinticPayoff n e η f g := by
  change (inner ℂ f ((↑(1-w : ℝ) : ℂ) • witness n (191/250) (47/2000) g + (w : ℂ) • quinticWitness n e η g)).re = _
  rw [inner_add_right, inner_smul_right, inner_smul_right, Complex.add_re,Complex.re_ofReal_mul,
    Complex.re_ofReal_mul,re_inner_quinticWitness]; rfl

/-- A shared vector field sees both witnesses at their first-chaos normalization. -/
theorem re_pairVal_quinticHybridWitness (n : ℕ) (hn : 0 < n) {w e η : ℝ} (he₀ : 0 ≤ e) (he₁ : e ≤ 1) (hη : 0 ≤ η) (hw₀ : 0 ≤ w) (hw₁ : w ≤ 1) :
    1-2/(n+1) ≤ (pairVal (quinticHybridWitness n w e η) (uL n) (uL n)).re := by
  have ho := re_pairVal_witnessOf n (H21 n) (H21_le_orthogonal n) (e := 191/250) (ν := 47/2000) (by norm_num) (by norm_num) hn
  have he : 1-2/(n+1) ≤ 1-(1+(191/250:ℝ))/(n+1) := sub_le_sub_left (div_le_div_of_nonneg_right (by norm_num) (by positivity)) 1
  have hq : 1-(1+e)/(n+1) ≤ (pairVal (quinticWitness n e η) (uL n) (uL n)).re := by
    refine (re_pairVal_witnessOf n (H21 n) (H21_le_orthogonal n) (e := e) he₀ (le_refl 0) hn).trans ?_
    unfold pairVal
    rw [Complex.re_sum,Complex.re_sum]
    apply Finset.sum_le_sum
    intro i _
    change (inner ℂ (uL n i) (witness n e 0 (uL n i))).re ≤ (inner ℂ (uL n i)
      (witness n e 0 (uL n i) + (η:ℂ) • (H32 n).starProjection (uL n i))).re
    rw [inner_add_right,inner_smul_right,Complex.add_re,Complex.re_ofReal_mul,re_inner_starProjection]
    exact le_add_of_nonneg_right (mul_nonneg hη (sq_nonneg _))
  have hm : (pairVal (quinticHybridWitness n w e η) (uL n) (uL n)).re =
      (1-w)*(pairVal (witness n (191/250) (47/2000)) (uL n) (uL n)).re + w*(pairVal (quinticWitness n e η) (uL n) (uL n)).re := by
    simp only [pairVal, Complex.re_sum]
    rw [Finset.mul_sum,Finset.mul_sum,← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro i _
    rw [re_inner_quinticHybridWitness, ← re_inner_quinticWitness]
    rfl
  have hqe : 1-2/(n+1:ℝ) ≤ 1-(1+e)/(n+1) := sub_le_sub_left (div_le_div_of_nonneg_right (by linarith) (by positivity)) 1
  rw [hm]
  have z := mul_le_mul_of_nonneg_left (he.trans ho) (sub_nonneg.mpr hw₁)
  change _ ≤ (1-w) * (pairVal (witness n (191/250) (47/2000)) (uL n) (uL n)).re at z
  linarith only [z,mul_le_mul_of_nonneg_left (hqe.trans hq) hw₀]

/-- A physical scalar cap on this specific mixture gives its finite-matrix lower bound. -/
theorem transferInputs_of_quinticHybrid {w e η B : ℝ} (he₀ : 0 ≤ e) (he₁ : e ≤ 1) (hη : 0 ≤ η) (hw₀ : 0 ≤ w) (hw₁ : w ≤ 1) (N : ℕ)
    (hc : ∀ n, N ≤ n → ∀ f g : L2G n, f ∈ Unimod (stdGaussian (n+n)) → g ∈ Unimod (stdGaussian (n+n)) →
      (1-w)*VOf n (191/250) (47/2000) f g + w*quinticPayoff n e η f g ≤ B) : TransferInputsL2 B := by
  intro δ hδ
  obtain ⟨n, hn⟩ := exists_nat_gt (max (N : ℝ) (2/δ))
  have hN : (N : ℝ) < n := (le_max_left _ _).trans_lt hn
  have hn' : N < n := by exact_mod_cast hN
  have hfrac := (le_max_right _ _).trans_lt hn
  rw [div_lt_iff₀ hδ] at hfrac
  have hδn : 2/(n+1:ℝ) ≤ δ := by rw [div_le_iff₀ (by positivity)]; nlinarith
  refine ⟨Fin (n+n) → ℝ,inferInstance,stdGaussian (n+n),inferInstance,quinticHybridWitness n w e η,
    Fin n,inferInstance,uL n,uL n,?_,ae_sum_normSq_uL_le n, ae_sum_normSq_uL_le n,
    ((by linarith : 1-δ ≤ 1-2/(n+1))).trans ((re_pairVal_quinticHybridWitness n (Nat.zero_le N |>.trans_lt hn') he₀ he₁ hη hw₀ hw₁).trans (Complex.re_le_norm _))⟩
  intro f hf g hg
  obtain ⟨θ,hθ,hθw⟩ := exists_phase (inner ℂ f (quinticHybridWitness n w e η g))
  have h := hc n hn'.le f (θ • g) hf (smul_mem_unimod n hθ hg)
  rwa [← re_inner_quinticHybridWitness, map_smul, inner_smul_right, hθw, Complex.ofReal_re] at h


/-- Bessel's inequality absorbs every fifth coefficient through the stated budget.
The same right hand side holds for every coefficient in this interval. -/
theorem quinticPayoff_le_retuned_hat (n : ℕ) {a η : ℝ} (ha : a ≤ 1) (hη : 0 ≤ η)
    (hbudget : η ≤ 2*a*(47/1953)) {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n))) :
    quinticPayoff n ((25/31)*a) η f g ≤ a*VhatOf n (191/250) (47/2000) f g +
      (1-a-2*a*(47/1953))*tOf n f g^2 + 2*a*(47/1953) := by
  have eqn : quinticPayoff n ((25/31)*a) η f g = a*VhatOf n (191/250) (47/2000) f g +
      (1-a)*(tOf n f g^2 - ‖PkOf n f g‖^2) + 2*a*(47/1953)*‖kOf n f g‖^2 +
      η*(‖(H32 n).starProjection (hOf n f g)‖^2-‖(H32 n).starProjection (kOf n f g)‖^2) := by
    rw [quinticPayoff,VOf_zero,VhatOf]; norm_num [epsHat,nuHat]; ring
  have hP := quintic_projection_energy_le n (hOf n f g)
  change tOf n f g^2+‖QhOf n f g‖^2+‖(H32 n).starProjection (hOf n f g)‖^2 ≤ _ at hP
  have hbudget' : ‖kOf n f g‖^2+‖(H32 n).starProjection (hOf n f g)‖^2 ≤ 1-tOf n f g^2 := by
    linarith only [hP, normSq_hOf_add_normSq_kOf n hf hg, sq_nonneg ‖QhOf n f g‖]
  rw [eqn]
  linarith only [mul_le_mul_of_nonneg_left hbudget' (hη.trans hbudget),
    mul_le_mul_of_nonneg_right hbudget (sq_nonneg ‖(H32 n).starProjection (hOf n f g)‖),
    mul_nonneg hη (sq_nonneg ‖(H32 n).starProjection (kOf n f g)‖),
    mul_nonneg (sub_nonneg.mpr ha) (sq_nonneg ‖PkOf n f g‖)]

/-- The exact physical schedule for the original rows, before bounding any cell. -/
theorem quinticHybrid_le_retuned_profile {n : ℕ} {w a η : ℝ} (hw : 0 ≤ w) (ha : a ≤ 1)
    (hη : 0 ≤ η) (hbudget : η ≤ 2*a*(47/1953)) {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n))) :
    (1-w)*VOf n (191/250) (47/2000) f g + w*quinticPayoff n ((25/31)*a) η f g ≤
      ((1-w)*(1953/2000)+w*a)*VhatOf n (191/250) (47/2000) f g +
      (w*(1-a-2*a*(47/1953)))*tOf n f g^2 + ((1-w)*(47/2000)+w*2*a*(47/1953)) := by
  have h := mul_le_mul_of_nonneg_left (quinticPayoff_le_retuned_hat n ha hη hbudget hf hg) hw
  rw [VOf_eq_hat n _ (by norm_num) hf hg]
  linarith only [h]

/-- A bound for the weighted amplitude profile of the existing 38-cell schedule
transfers the retuned mixed witness, with fifth coefficient `3693/100000000000`. -/
theorem retunedHybrid_transferInputs_of_profile
    (hcaps : TailNodeCaps (nuHat (47/2000)))
    (hp : ∀ {F : Type} [NormedAddCommGroup F] [InnerProductSpace ℝ F] (V t : ℝ) (Qh v : F),
      ‖v‖^2 = 2 → 0 ≤ t → t ≤ 9/10 →
      V ≤ (1-1/2)*t^2+1/2+(massS : ℝ)-(ε : ℝ)*‖Qh‖^2 →
      CircularSharedReduction rowData V t Qh v →
      (488214395787/500000000000)*V + (191362643/2625000000000)*t^2 +
        246732237901/10500000000000 ≤ 713254705661/1000000000000) :
    TransferInputsL2 (713254705661/1000000000000) := by
  apply transferInputs_of_quinticHybrid (e := 1/100) (η := 1/2000) (w := 3693/50000000)
    (by norm_num) (by norm_num) (by norm_num) (by norm_num) (by norm_num) 2
  intro n hn f g hf hg
  obtain ⟨m, rfl⟩ : ∃ m, n = m+1 := ⟨n-1,by omega⟩
  have he : epsHat (191/250) (47/2000) = ε := by norm_num [epsHat,ε]
  have hν : 2*nuHat (47/2000)+1/2 = (massC:ℝ) := by norm_num [nuHat,massC]
  obtain ⟨v,hv,hred⟩ := circularReductionHyp_of_nodeCaps he hcaps (n := m) (by omega) f g hf hg
  have hcap := hp _ _ _ v hv (norm_nonneg _) (tOf_le (m+1) hf hg)
    (massRow_frame (m+1) (by omega) he hν hf hg) hred
  have hb := quinticHybrid_le_retuned_profile (w := 3693/50000000) (a := 31/2500) (η := 1/2000)
    (by norm_num) (by norm_num) (by norm_num) (by norm_num) hf hg
  norm_num at hb hcap ⊢
  exact hb.trans hcap

end
end Grothe.LowerAnalytic
