import Grothe.Lower.Cert.FirstChaos
import Grothe.LowerAnalytic.SparseSteinBound

set_option warningAsError true

/-! # First-chaos retuning of the identity-tail witness

The extra allowance in the amplitude profile is proportional to the complement
of the first-chaos energy. Its sign lets the original witness use the same cap.

Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic.FirstChaosProfile

open Grothe.Lower

private theorem check : SparseEnvelope.mixedCheck
    (97642880918541/100000000000000) (182260146354797/2500000000000000000)
    (58745716890120203/2500000000000000000) FirstChaos.cap = true := by decide +kernel

/-- Convex mixing with the first-chaos projector scales the original cubic and tail coefficients. -/
theorem payoff_split (n : ℕ) (w : ℝ) (f g : L2G n) :
    VOf n ((1-w)*(191/250)) ((1-w)*(47/2000)) f g =
      (1-w)*VOf n (191/250) (47/2000) f g + w*(tOf n f g ^ 2 - ‖PkOf n f g‖^2) := by
  rw [VOf_eq, VOf_eq]
  ring

/-- The original physical row schedule bounds the retuned payoff and a positive multiple
of the unused first-chaos energy on the same pair. -/
theorem phase_budget (hcaps : TailNodeCaps (nuHat (47/2000))) {n : ℕ} (hn : 2 ≤ n)
    {f g : L2G n} (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n))) :
    let w : ℝ := FirstChaos.weight
    VOf n ((1-w)*(191/250)) ((1-w)*(47/2000)) f g +
      (w/50000000)*(1-tOf n f g ^ 2) ≤ (FirstChaos.cap : ℝ) := by
  obtain ⟨m, rfl⟩ : ∃ m, n=m+1 := ⟨n-1,by omega⟩
  have he : epsHat (191/250) (47/2000) = ε := by norm_num [epsHat, ε]
  have hν : 2*nuHat (47/2000)+1/2 = (massC : ℝ) := by norm_num [nuHat,massC]
  obtain ⟨v,hv,hred⟩ := circularReductionHyp_of_nodeCaps he hcaps (n := m) (by omega) f g hf hg
  have hm := massRow_frame (m+1) (by omega) he hν hf hg
  have bound := SparseEnvelope.mixed_profile_bound _ _ _ _ (by decide +kernel) check hv
    (norm_nonneg _) (tOf_le (m+1) hf hg) hred (tight_scalar_rows _ _ _ v hm hred) (SparseStein.actual_deductions hred)
  dsimp only
  rw [payoff_split,VOf_eq_hat (m+1) _ (by norm_num) hf hg]
  norm_num [FirstChaos.weight] at bound ⊢
  simp only [tOf] at bound ⊢
  linarith only [bound,sq_nonneg ‖PkOf (m+1) f g‖]

/-- A unimodular phase rotation converts the real payoff budget into the complex scalar cap. -/
theorem scalar_cap (hcaps : TailNodeCaps (nuHat (47/2000))) {n : ℕ} (hn : 2 ≤ n) :
    let w : ℝ := FirstChaos.weight
    WitnessCap n ((1-w)*(191/250)) ((1-w)*(47/2000)) FirstChaos.cap := by
  dsimp only
  intro f hf g hg
  obtain ⟨θ,hθ,hθw⟩ := exists_phase (inner ℂ f (witness n ((1-(FirstChaos.weight:ℝ))*(191/250)) ((1-(FirstChaos.weight:ℝ))*(47/2000)) g))
  have hg' := smul_mem_unimod n hθ hg
  have h := phase_budget hcaps hn hf hg'
  dsimp only at h
  have ht := tOf_le n hf hg'
  have hu : tOf n f (θ • g)^2 ≤ 1 := by
    exact (pow_le_pow_left₀ (norm_nonneg _) (ht.trans (by norm_num : (9/10:ℝ) ≤ 1)) 2).trans (by norm_num)
  have hw : (0:ℝ) ≤ (FirstChaos.weight:ℝ)/50000000 := by norm_num [FirstChaos.weight]
  have hh := (le_add_of_nonneg_right (mul_nonneg hw (sub_nonneg.mpr hu))).trans h
  rwa [VOf,map_smul,inner_smul_right,hθw,Complex.ofReal_re] at hh

end Grothe.LowerAnalytic.FirstChaosProfile

namespace Grothe.Statement

open Grothe.Lower Grothe.LowerAnalytic

/-- The retuned identity-tail witness gives its exact finite-matrix endpoint from the original node caps. -/
theorem firstChaosEndpoint_le_of_tailNodeCaps (hcaps : TailNodeCaps (nuHat (47/2000)))
    (hne : ∃ K, IsBound K) : (FirstChaos.endpoint : ℝ) ≤ complexGrothendieckConstant := by
  have hT := transferInputs_of_witnessCap (by norm_num [FirstChaos.weight]) (by norm_num [FirstChaos.weight]) 2
    (fun _ hn ↦ FirstChaosProfile.scalar_cap hcaps hn)
  rw [FirstChaos.endpoint,Rat.cast_div,Rat.cast_one]
  exact le_csInf hne fun _ hK ↦ transfer_lower hT (isBound_iff.mp hK)

end Grothe.Statement
