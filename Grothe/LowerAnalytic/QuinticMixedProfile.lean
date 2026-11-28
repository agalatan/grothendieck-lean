import Grothe.Lower.Cert.QuinticHybrid
import Grothe.LowerAnalytic.QuinticHybridTransfer
import Grothe.LowerAnalytic.SparseSteinBound

set_option warningAsError true

/-!
# Amplitude certificate for the retuned degree-five mixture

The coefficients scale the normalized identity-tail payoff and the first-chaos
energy of the same phase pair. Each checked segment maximizes their sum along
the original affine row-weight path, including its possible interior extremum.

Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic.QuinticMixedProfile

open Grothe.Lower

private theorem retuned_check : SparseEnvelope.mixedCheck
    (488214395787/500000000000) (191362643/2625000000000)
    (246732237901/10500000000000) (713254705661/1000000000000) = true := by
  decide +kernel

/-- All unrestricted physical row data pay the joint scalar budget for the mixture. -/
theorem retuned_profile {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (V t : ℝ) (Qh v : E) (hv : ‖v‖^2 = 2) (ht₀ : 0 ≤ t) (ht₁ : t ≤ 9/10)
    (hmass : V ≤ (1-1/2)*t^2+1/2+(massS : ℝ)-(ε : ℝ)*‖Qh‖^2)
    (hred : CircularSharedReduction rowData V t Qh v) :
    (488214395787/500000000000 : ℝ)*V + (191362643/2625000000000 : ℝ)*t^2 +
      (246732237901/10500000000000 : ℝ) ≤ 713254705661/1000000000000 := by
  simpa only [Rat.cast_div, Rat.cast_ofNat] using
    SparseEnvelope.mixed_profile_bound _ _ _ _ (by decide +kernel) retuned_check hv ht₀ ht₁ hred
      (tight_scalar_rows V t Qh v hmass hred) (SparseStein.actual_deductions hred)

end Grothe.LowerAnalytic.QuinticMixedProfile

namespace Grothe.Statement

open Grothe.Lower Grothe.LowerAnalytic

/-- The original verified NodeCaps suffice for the retuned operator's finite-matrix bound. -/
theorem quinticHybridEndpoint_le_of_tailNodeCaps (hcaps : TailNodeCaps (nuHat (47/2000)))
    (hne : ∃ K, IsBound K) : (QuinticHybrid.endpoint : ℝ) ≤ complexGrothendieckConstant := by
  have hT := retunedHybrid_transferInputs_of_profile hcaps (@QuinticMixedProfile.retuned_profile)
  have h : 1/(713254705661/1000000000000 : ℝ) ≤ complexGrothendieckConstant :=
    le_csInf hne fun _ hK ↦ transfer_lower hT (isBound_iff.mp hK)
  simpa only [QuinticHybrid.endpoint, QuinticHybrid.cap, Rat.cast_div, Rat.cast_one, Rat.cast_ofNat] using h

end Grothe.Statement
