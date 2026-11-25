import Grothe.Lower.CoupledSteinEnvelope
import Grothe.LowerAnalytic.CoupledSteinRows
import Grothe.LowerAnalytic.LowerBoundTight
import Grothe.StatementBridges

set_option warningAsError true

/-!
# Witness transfer for the common Stein profile

The only arithmetic premise is the nine lower enclosures of the coupled Stein
discount. The transfer uses the existing circular Gaussian witness and its node caps.

Agent-ID: codex-a7c4
-/

open MeasureTheory MvPolynomial Grothe.Lower

namespace Grothe.LowerAnalytic.CoupledStein

/-- The rational bounds used by the amplitude certificate, at exactly its listed weights. -/
def PricesHold : Prop := ∀ w ∈ prices.map Prod.fst, approxDiscount w ≤ rowDiscount w

theorem profile_of_prices (hp : PricesHold)
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (V t : ℝ) (Qh v : E) (hv : ‖v‖^2 = 2) (ht₀ : 0 ≤ t) (ht₁ : t ≤ 9/10)
    (hmass : V ≤ (1-1/2)*t^2+1/2+(massS : ℝ)-(ε : ℝ)*‖Qh‖^2)
    (hred : CircularSharedReduction rowData V t Qh v) : V ≤ (Grothe.Lower.CoupledStein.cap : ℝ) := by
  apply Grothe.Lower.CoupledStein.profile_bound hv ht₀ ht₁ (tight_scalar_rows V t Qh v hmass hred)
  intro w hwm z hzm hw₀ hw₁ hz₀ hz₁ x hx₀ hx₁
  obtain ⟨d8,d9,hd,H8,H9⟩ := actual_deductions hred w z hw₀ hw₁ hz₀ hz₁ hx₀ hx₁
  have hdisc := add_le_add
    (mul_le_mul_of_nonneg_left ((Rat.cast_le (K := ℝ)).mpr (hp w hwm)) (sub_nonneg.mpr hx₁))
    (mul_le_mul_of_nonneg_left ((Rat.cast_le (K := ℝ)).mpr (hp z hzm)) hx₀)
  exact ⟨d8,d9,hdisc.trans hd,H8,H9⟩

theorem lower_of_prices (hp : PricesHold) (hcaps : TailNodeCaps (nuHat (47/2000))) {K : ℝ}
    (hK : IsGrothendieckBound K) : (Grothe.Lower.CoupledStein.endpoint : ℝ) ≤ K := by
  simpa only [Grothe.Lower.CoupledStein.endpoint, Rat.cast_div, Rat.cast_one, Rat.cast_sub,
    Rat.cast_mul, Rat.cast_add, Rat.cast_ofNat] using
    transfer_lower (transferInputs_of_witnessCap (by norm_num) (by norm_num) 2
      (witnessCap_of_circular_profile (@profile_of_prices hp) hcaps)) hK

end Grothe.LowerAnalytic.CoupledStein

namespace Grothe.Statement

theorem coupledSteinEndpoint_le_of_prices (hp : LowerAnalytic.CoupledStein.PricesHold)
    (hcaps : LowerAnalytic.TailNodeCaps (LowerAnalytic.nuHat (47/2000))) (hne : ∃ K, IsBound K) :
    (Grothe.Lower.CoupledStein.endpoint : ℝ) ≤ complexGrothendieckConstant :=
  le_csInf hne fun _ hK ↦ LowerAnalytic.CoupledStein.lower_of_prices hp hcaps (isBound_iff.mp hK)

end Grothe.Statement
