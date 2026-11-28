import Grothe.Lower.Cert.FirstChaos
import Grothe.LowerAnalytic.SparseSteinBound
import Grothe.LowerAnalytic.CubicVisibleTangent
import Mathlib.Analysis.Real.Pi.Bounds

set_option warningAsError true

/-! # First-chaos retuning of the identity-tail witness

The first-chaos payoff on the same pair is bounded by its visible amplitude squared.
The sparse row schedule controls this amplitude and the identity-tail payoff jointly.

Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic.FirstChaosProfile

open Grothe.Lower

private abbrev a : ℚ := 12205485451783827/12500000000000000
private abbrev b : ℚ := 391473741/6250000000000
private abbrev c : ℚ := 293731600734173/12500000000000000

private theorem lowCheck : SparseEnvelope.riceMixedCheck a b c FirstChaos.cap = true := by
  decide +kernel

/-- Convex mixing with the first-chaos projector scales the original cubic and tail coefficients. -/
theorem payoff_split (n : ℕ) (w : ℝ) (f g : L2G n) :
    VOf n ((1-w)*(191/250)) ((1-w)*(47/2000)) f g =
      (1-w)*VOf n (191/250) (47/2000) f g + w*(tOf n f g ^ 2 - ‖PkOf n f g‖^2) := by
  rw [VOf_eq, VOf_eq]
  ring

namespace High

open Real

def epsilon : ℚ := 25/31
def price : ℚ := epsilon - 2*(47/1953)
def muLo : ℚ := 886226925/10^9
def piHi : ℚ := 3141592654/10^9
abbrev switch := SparseEnvelope.splitAmplitude

/-- The signed estimate from the visible-cubic tangent has negative slope to the
right of the rational switch; the first-chaos mixing weight may be arbitrary. -/
theorem high_bound {a b c cap : ℚ} {V t : ℝ}
    (hV : V ≤ t^2-(epsilon:ℝ)*(π/32-(√π/2)*(√π/2-t))+
      (price:ℝ)*2*(π/4-t^2)) (ht : (switch:ℝ) ≤ t)
    (ha : 0 ≤ a) (hq : a*(1-2*price)+b ≤ 0)
    (hcheck : (a*(1-2*price)+b)*switch^2 +
      a*(7*epsilon/32+price/2)*piHi - a*epsilon*muLo*switch+c ≤ cap) :
    (a:ℝ)*V+(b:ℝ)*t^2+(c:ℝ) ≤ (cap:ℝ) := by
  have hMu : (muLo:ℝ) ≤ √π/2 := by
    have hm : 2*(muLo:ℝ) ≤ √π := by
      apply (Real.le_sqrt (by norm_num [muLo]) Real.pi_nonneg).2
      norm_num [muLo]
      linarith [Real.pi_gt_d20]
    linarith
  have hPi : π ≤ (piHi:ℝ) := by
    norm_num [piHi]
    linarith [Real.pi_lt_d20]
  have hs : (0:ℝ) ≤ switch := by norm_num [switch,SparseEnvelope.splitAmplitude]
  have he : (0:ℝ) ≤ epsilon := by norm_num [epsilon]
  have hcat : 0 ≤ (7*(epsilon:ℝ)/32+price/2) := by norm_num [epsilon, price]
  have hcatPi := mul_le_mul_of_nonneg_left hPi hcat
  have htMu := mul_le_mul hMu ht hs (by positivity)
  have hMuTerm := mul_le_mul_of_nonneg_left htMu he
  have hx : V ≤ (1-2*(price:ℝ))*t^2+(7*(epsilon:ℝ)/32+price/2)*piHi-
      (epsilon:ℝ)*muLo*switch := by
    nlinarith only [hV,hcatPi,hMuTerm,congrArg (fun x : ℝ => (epsilon:ℝ)*x) (Real.sq_sqrt Real.pi_nonneg)]
  have hA : (0 : ℝ) ≤ a := Rat.cast_nonneg.mpr ha
  have hQ : (a:ℝ)*(1-2*price)+b ≤ 0 := by exact_mod_cast hq
  have hsq := (sq_le_sq₀ hs (hs.trans ht)).mpr ht
  have hquadratic := mul_le_mul_of_nonpos_left hsq hQ
  have hmax : ((a:ℝ)*(1-2*price)+b)*(switch:ℝ)^2+
      a*(7*(epsilon:ℝ)/32+price/2)*piHi-a*epsilon*muLo*switch+c ≤ (cap:ℝ) := by
    exact_mod_cast hcheck
  nlinarith only [mul_le_mul_of_nonneg_left hx hA,hquadratic,hmax]

end High

/-- The original physical row schedule bounds the retuned payoff on every unimodular pair. -/
theorem phase_budget (hcaps : TailNodeCaps (nuHat (47/2000))) {n : ℕ} (hn : 2 ≤ n)
    {f g : L2G n} (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n))) :
    let w : ℝ := FirstChaos.weight
    VOf n ((1-w)*(191/250)) ((1-w)*(47/2000)) f g ≤ (FirstChaos.cap : ℝ) := by
  obtain ⟨m, rfl⟩ : ∃ m, n=m+1 := ⟨n-1,by omega⟩
  have he : epsHat (191/250) (47/2000) = ε := by norm_num [epsHat, ε]
  have hν : 2*nuHat (47/2000)+1/2 = (massC : ℝ) := by norm_num [nuHat,massC]
  obtain ⟨v,hv,hred⟩ := circularReductionHyp_of_nodeCaps_rice he hcaps (n := m) (by omega) f g hf hg
  have hm := massRow_frame (m+1) (by omega) he hν hf hg
  have hold : CircularSharedReduction rowData _ _ _ _ := hred.weaken fun _ h ↦ h.1
  have bound : (a:ℝ)*VhatOf (m+1) (191/250) (47/2000) f g+
      (b:ℝ)*(tOf (m+1) f g)^2+(c:ℝ) ≤ (FirstChaos.cap:ℝ) := by
    by_cases ht : tOf (m+1) f g < (SparseEnvelope.splitAmplitude:ℝ)
    · exact SparseEnvelope.rice_mixed_profile_below a b c FirstChaos.cap (by decide +kernel)
        lowCheck hv (norm_nonneg _) (tOf_le (m+1) hf hg) ht hold (tight_scalar_rows _ _ _ v hm hold)
        (fun l hl hc ↦ SparseStein.actual_deductions_band (SparseEnvelope.riceBand l) hred
          (fun _ h0 h93 hp ↦ SparseEnvelope.scale_le_of_checked hc hl h0 h93 hp))
    · apply High.high_bound (ht := le_of_not_gt ht) _ (by decide +kernel) (by decide +kernel) (by decide +kernel)
      have hi := VhatOf_le_visible_cubic_profile (n := m+1) (e := 191/250) (ν := 47/2000)
        (by omega) hf hg (by norm_num [nuHat]) (by norm_num [nuHat,epsHat])
      norm_num [High.price,High.epsilon,epsHat,nuHat] at hi ⊢
      exact hi
  dsimp only
  rw [payoff_split,VOf_eq_hat (m+1) _ (by norm_num) hf hg]
  norm_num [a,b,c,FirstChaos.weight] at bound ⊢
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
  have hh := phase_budget hcaps hn hf hg'
  dsimp only at hh
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
