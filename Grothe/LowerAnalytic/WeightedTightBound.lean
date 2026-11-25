import Grothe.Lower.WeightedTightEnvelope
import Grothe.LowerAnalytic.LowerBoundTight
import Grothe.StatementBridges

set_option warningAsError true

/-!
# Transfer of the weighted common gate to the complex Grothendieck constant

Use the same circular Gaussian reduction as the tight scalar rows. Its common coordinates
give the two-row deduction at each real mixing weight used by the affine envelope.

Agent-ID: codex-a7c4
-/

open MeasureTheory MvPolynomial Grothe.Lower

namespace Grothe.LowerAnalytic

/-- Specialize a scale-uniform circular law certificate to the actual residual scale. -/
private theorem circularLawAt {d : ℕ} {J : Fin d → Fin d → ℝ} {a b : MvPolynomial (Fin d) ℝ}
    {r : Row} {cap : ℚ} (hδ : 0 < r.delta) (hb : CircularRowBound r cap)
    (ha : Chaos3 a) (haa : ∫ y, eval y a ^ 2 ∂(stdGaussian d) = 1 / 2) (hc : Circular J a b)
    {Ψ : ℝ → ℝ} {τ : ℝ} (hτ0 : 0 ≤ τ) (hτ93 : τ ≤ 93 / 100)
    (hΨ : CapsHold (fun s => Ψ s - capPad) r.nodeList r.smax)
    (hInt : ∀ σ' : ℝ, 0 ≤ σ' → Integrable (fun y => Ψ (σ' * √(eval y (radU a b)))) (stdGaussian d)) :
    Goal (stdGaussian d) (fun y => eval y (radU a b)) (fun s => Ψ s - capPad)
      r.kappa cap (r.delta * τ) := by
  have hd : (0 : ℝ) ≤ r.delta := by exact_mod_cast hδ.le
  intro _
  exact hb a b ha haa hc _ _ hΨ (mul_nonneg hd hτ0) (mul_le_mul_of_nonneg_left hτ93 hd)
    (fun σ' hσ' => (hInt σ' hσ').sub (integrable_const _))

/-- Specialize the weighted law/gate estimate to both certified circular laws in a single frame. -/
theorem weightedTight_deductions {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {V t : ℝ} {Qh v : E} (hred : CircularSharedReduction rowData V t Qh v)
    (θ : ℝ) (hθ0 : 0 ≤ θ) (hθ1 : θ ≤ 1) :
    ∃ d8 d9 : ℝ, SharedGate.WeightedSchur.discount θ ≤ (1 - θ) * d8 + θ * d9 ∧
      RowHolds ε TightShared.row8.ell TightShared.row8.beta ((TightShared.row8.C : ℝ) - d8) V t Qh v ∧
      RowHolds ε TightShared.row9.ell TightShared.row9.beta ((TightShared.row9.C : ℝ) - d9) V t Qh v := by
  obtain ⟨d, J, A, B, X1, X2, X3, τ, x, hA, haa, hc, hM, _, hτ0, hτ93, _, hX, hshared⟩ := hred
  obtain ⟨P8, h8, hi8⟩ := hshared row08 (List.mem_of_getElem? (i := 7) (by rfl))
  obtain ⟨P9, h9, hi9⟩ := hshared row09 (List.mem_of_getElem? (i := 8) (by rfl))
  have hc08 : row08CapTight = cap08Tight := by decide +kernel
  have hc09 : row09CapTight = cap09Tight := by decide +kernel
  have hb8 : CircularRowBound row08 cap08Tight := by
    intro dim
    rw [← hc08]
    exact @circularRowBound_row08 dim
  have hb9 : CircularRowBound row09 cap09Tight := by
    intro dim
    rw [← hc09]
    exact @circularRowBound_row09 dim
  apply SharedGate.WeightedSchur.actual_deductions θ hθ0 hθ1 hM hτ0 hX h8 h9
  · exact circularLawAt row08_delta_pos hb8 hA haa hc hτ0 hτ93 h8.1 hi8
  · exact circularLawAt row09_delta_pos hb9 hA haa hc hτ0 hτ93 h9.1 hi9

/-- The affine comparison caps every physical profile. -/
theorem weightedTight_profile {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hmass : V ≤ (1 - 1 / 2) * t ^ 2 + 1 / 2 + (massS : ℝ) - (ε : ℝ) * ‖Qh‖ ^ 2)
    (hred : CircularSharedReduction rowData V t Qh v) : V ≤ (WeightedTight.cap : ℝ) :=
  WeightedTight.profile_bound hv ht0 ht1 (tight_scalar_rows V t Qh v hmass hred) (weightedTight_deductions hred)

theorem weightedTight_lower_of_tailNodeCaps (hcaps : TailNodeCaps (nuHat (47 / 2000))) {K : ℝ}
    (hK : IsGrothendieckBound K) : (WeightedTight.endpoint : ℝ) ≤ K := by
  simpa only [WeightedTight.endpoint, Rat.cast_div, Rat.cast_one, Rat.cast_sub, Rat.cast_mul,
    Rat.cast_add, Rat.cast_ofNat] using
    transfer_lower (transferInputs_of_witnessCap (by norm_num) (by norm_num) 2
      (witnessCap_of_circular_profile (@weightedTight_profile) hcaps)) hK

end Grothe.LowerAnalytic

namespace Grothe.Statement

theorem weightedTightEndpoint_le_of_tailNodeCaps
    (hcaps : LowerAnalytic.TailNodeCaps (LowerAnalytic.nuHat (47 / 2000)))
    (hne : ∃ K, IsBound K) : (WeightedTight.endpoint : ℝ) ≤ complexGrothendieckConstant :=
  le_csInf hne fun _ hK => LowerAnalytic.weightedTight_lower_of_tailNodeCaps hcaps (isBound_iff.mp hK)

end Grothe.Statement
