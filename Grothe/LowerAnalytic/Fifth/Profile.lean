import Grothe.LowerAnalytic.Fifth.Energy
import Grothe.Lower.SignedFifthBudget
import Grothe.LowerAnalytic.FirstChaosProfile

/-! # End-to-end complex matrix bound for a nonzero signed fifth witness

Agent-ID: codex-a7c4
-/
set_option warningAsError true
namespace Grothe.LowerAnalytic
open Grothe.Lower SignedFifth MeasureTheory

/-- Removing the fifth debit at the same first-chaos weight makes the certified
high-amplitude price exceed the signed cap at the rational switch. -/
theorem signedFifth_sameWeight_high_price :
    let t := FirstChaosProfile.High.switch
    let ε := FirstChaosProfile.High.epsilon
    let p := FirstChaosProfile.High.price
    cap + 249/10^12 < (a*(1-2*p)+w)*t^2
      + a*(7*ε/32+p/2)*FirstChaosProfile.High.piHi
      - a*ε*FirstChaosProfile.High.muLo*t+c := by
  decide +kernel

theorem signedFifth_phase_budget (hcaps : TailNodeCaps (nuHat (47/2000))) {n : ℕ} (hn : 1 ≤ n)
    {f g : L2G (n+1)} (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1)))) :
    (inner ℂ f (signedFifthWitness (n+1) ((1-(w:ℝ))*(191/250))
      ((1-(w:ℝ))*(47/2000)) (debit:ℝ) g)).re ≤ (cap:ℝ) := by
  have he : epsHat (191/250) (47/2000) = ε := by norm_num [epsHat, ε]
  have hν : 2*nuHat (47/2000)+1/2 = (massC : ℝ) := by norm_num [nuHat,massC]
  obtain ⟨v,hv,hred⟩ := circularReductionHyp_of_nodeCaps_rice he hcaps hn f g hf hg
  have hm := massRow_frame (n+1) (by omega) he hν hf hg
  have hold : CircularSharedReduction rowData _ _ _ _ := hred.weaken fun _ h ↦ h.1
  let t := tOf (n+1) f g
  let V := VhatOf (n+1) (191/250) (47/2000) f g
  have bound : (a:ℝ)*V+(lowSlope:ℝ)*t^2+(lowOffset:ℝ) ≤ (cap:ℝ) ∨
      ((cut:ℝ) ≤ t ∧ (a:ℝ)*V+(w:ℝ)*t^2+(highOffset:ℝ) ≤ (cap:ℝ)) := by
    by_cases ht : t < (SparseEnvelope.splitAmplitude:ℝ)
    · exact SparseEnvelope.rice_guarded_profile_below SparseEnvelope.splitAmplitude cut a lowSlope lowOffset w highOffset cap
        (by decide +kernel) SignedFifth.check hv (norm_nonneg _) (tOf_le (n+1) hf hg) ht hold
        (tight_scalar_rows _ _ _ v hm hold)
        (fun l hl hc ↦ SparseStein.actual_deductions_band (SparseEnvelope.riceBand l) hred
          (fun _ h0 h93 hp ↦ SparseEnvelope.scale_le_of_checked hc hl h0 h93 hp))
    · have hs : (cut:ℝ) ≤ (SparseEnvelope.splitAmplitude:ℝ) := by
        norm_num [cut,SparseEnvelope.splitAmplitude]
      refine Or.inr ⟨hs.trans (le_of_not_gt ht),?_⟩
      apply FirstChaosProfile.High.high_bound (ht := le_of_not_gt ht) _ (by decide +kernel)
        (by decide +kernel) (by decide +kernel)
      have hi := VhatOf_le_visible_cubic_profile (n := n+1) (e := 191/250) (ν := 47/2000)
        (by omega) hf hg (by norm_num [nuHat]) (by norm_num [nuHat,epsHat])
      dsimp only [V,t]
      norm_num [FirstChaosProfile.High.price,FirstChaosProfile.High.epsilon,epsHat,nuHat] at hi ⊢
      exact hi
  rw [signedFifth_payoff,FirstChaosProfile.payoff_split,VOf_eq_hat _ _ (by norm_num) hf hg]
  have hdebit : 0 ≤ (debit:ℝ) := by norm_num [debit]
  have hk := sq_nonneg ‖PkOf (n+1) f g‖
  rcases bound with hlow | ⟨ht,hhi⟩
  · have hfloor := mul_le_mul_of_nonneg_left (signedFifth_quadratic_floor hf hg) hdebit
    dsimp only [V,t] at hlow
    norm_num [lowSlope,lowOffset,a,c,w,debit,cap] at hlow hfloor ⊢
    linarith only [hlow,hfloor,hk]
  · have ht' : 885868/1000000 ≤ tOf (n+1) f g := by
      simpa only [cut,Rat.cast_div,Rat.cast_ofNat,t] using ht
    have hfloor := mul_le_mul_of_nonneg_left (signed_fifth_radial_885868 hf hg ht') hdebit
    dsimp only [V,t] at hhi
    norm_num [highOffset,a,c,w,debit,cap] at hhi hfloor ⊢
    linarith only [hhi,hfloor,hk]

/-- Transfer to finite complex matrices uses the signed operator with its genuine fifth coefficient. -/
theorem signedFifth_profile_transfer (hcaps : TailNodeCaps (nuHat (47/2000))) : TransferInputsL2 (cap:ℝ) := by
  apply signedFifth_transfer (e := (1-(w:ℝ))*(191/250)) (ν := (1-(w:ℝ))*(47/2000))
    (debit := (debit:ℝ)) (by norm_num [w]) (by norm_num [debit]) (by norm_num [w,debit]) 2
  rintro (_|n) hn f g hf hg
  · omega
  exact signedFifth_phase_budget hcaps (by omega) hf hg

end Grothe.LowerAnalytic
namespace Grothe.Statement
open Grothe.Lower Grothe.LowerAnalytic
theorem signedFifthEndpoint_le_of_tailNodeCaps (hcaps : TailNodeCaps (nuHat (47/2000)))
    (hne : ∃ K, IsBound K) :
    1/(SignedFifth.cap:ℝ) ≤ complexGrothendieckConstant :=
  le_csInf hne fun _ hK ↦ transfer_lower (signedFifth_profile_transfer hcaps) (isBound_iff.mp hK)
end Grothe.Statement
