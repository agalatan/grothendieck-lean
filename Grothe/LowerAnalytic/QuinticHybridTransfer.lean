import Grothe.LowerAnalytic.QuinticWitness
import Grothe.LowerAnalytic.FirstChaosProfile

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

/-- In the tuned first-chaos mixture, an additional fifth-sector multiplier consumes
at most its coefficient times the energy outside the first chaos. -/
theorem quinticPerturbation_payoff (hcaps : TailNodeCaps (nuHat (47/2000))) {n : ℕ} (hn : 2 ≤ n)
    {η : ℝ} (hη : 0 ≤ η) (hmax : η ≤ 1/50000000)
    {f g : L2G n} (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n))) :
    let w : ℝ := FirstChaos.weight
    (1-w)*VOf n (191/250) (47/2000) f g + w*quinticPayoff n 0 η f g ≤ (FirstChaos.cap : ℝ) := by
  have h := FirstChaosProfile.phase_budget hcaps hn hf hg
  dsimp only at h ⊢
  rw [FirstChaosProfile.payoff_split] at h
  have hP := quintic_projection_energy_le n (hOf n f g)
  change tOf n f g^2+‖QhOf n f g‖^2+‖(H32 n).starProjection (hOf n f g)‖^2 ≤ _ at hP
  have hF : ‖(H32 n).starProjection (hOf n f g)‖^2 ≤ 1-tOf n f g^2 := by
    linarith only [hP,normSq_hOf_add_normSq_kOf n hf hg,sq_nonneg ‖QhOf n f g‖,sq_nonneg ‖kOf n f g‖]
  have hB : η*(‖(H32 n).starProjection (hOf n f g)‖^2-‖(H32 n).starProjection (kOf n f g)‖^2) ≤
      (1/50000000)*(1-tOf n f g^2) := by
    calc _ ≤ η*‖(H32 n).starProjection (hOf n f g)‖^2 := by
              exact mul_le_mul_of_nonneg_left (sub_le_self _ (sq_nonneg _)) hη
         _ ≤ (1/50000000)*(1-tOf n f g^2) :=
              mul_le_mul hmax hF (sq_nonneg _) (by norm_num)
  have hw : (0:ℝ) ≤ FirstChaos.weight := by norm_num [FirstChaos.weight]
  rw [quinticPayoff,VOf_zero]
  linarith only [h,mul_le_mul_of_nonneg_left hB hw]

/-- The whole interval of explicit fifth-chaos perturbations has the same certified
finite-matrix scalar cap as the first-chaos-only partner. -/
theorem quinticPerturbation_scalarCap (hcaps : TailNodeCaps (nuHat (47/2000))) {n : ℕ} (hn : 2 ≤ n)
    {η : ℝ} (hη : 0 ≤ η) (hmax : η ≤ 1/50000000) :
    ScalarCap (stdGaussian (n+n)) (quinticHybridWitness n FirstChaos.weight 0 η) FirstChaos.cap := by
  intro f hf g hg
  obtain ⟨θ,hθ,hθw⟩ := exists_phase (inner ℂ f (quinticHybridWitness n FirstChaos.weight 0 η g))
  have h := quinticPerturbation_payoff hcaps hn hη hmax hf (smul_mem_unimod n hθ hg)
  dsimp only at h
  rwa [← re_inner_quinticHybridWitness,map_smul,inner_smul_right,hθw,Complex.ofReal_re] at h

/-- Finite matrices obtained from any of these actual Gaussian operators reach the
same lower endpoint. The shared vector test has limit one. -/
theorem quinticPerturbation_transfer (hcaps : TailNodeCaps (nuHat (47/2000)))
    {η : ℝ} (hη : 0 ≤ η) (hmax : η ≤ 1/50000000) : TransferInputsL2 (FirstChaos.cap : ℝ) :=
  transferInputs_of_quinticHybrid (w := FirstChaos.weight) (e := 0) (η := η)
    (by norm_num) (by norm_num) hη (by norm_num [FirstChaos.weight]) (by norm_num [FirstChaos.weight]) 2
    (fun _ hn _ _ hf hg ↦ quinticPerturbation_payoff hcaps hn hη hmax hf hg)

end
end Grothe.LowerAnalytic
