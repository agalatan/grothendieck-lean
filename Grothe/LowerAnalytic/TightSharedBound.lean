import Grothe.Lower.SharedGateSaving
import Grothe.Lower.TightSharedEnvelope
import Grothe.LowerAnalytic.LowerBoundTight
import Grothe.StatementBridges

set_option warningAsError true

/-!
# The joint gate on the antiholomorphic Stein rows

The law bounds control the potential, while the joint Gaussian gate retains the surplus from using
the same three coefficients in both rows. At small residual scale a quadratic majorant of row08
gives the same saving relative to its tightened cap.

Agent-ID: codex-a7c4
-/

open MeasureTheory MvPolynomial Grothe.Lower

namespace Grothe.LowerAnalytic

noncomputable section

private def tightSmallRect : Rect :=
  ⟨0, row08.delta * TightShared.cut, SharedGate.smallRect.P⟩

private theorem tightSmallRect_ok :
    checkRect row08.nodeList row08.smax row08.kappa (cap08Tight - TightShared.saving)
      0 xMax tightSmallRect = true := by
  have old := SharedGate.smallRectangle_ok
  simp only [checkRect, Bool.and_eq_true] at old ⊢
  exact ⟨⟨⟨old.1.1.1, by decide +kernel⟩, old.1.2⟩, by decide +kernel⟩

/-- Specialize a scale-uniform circular law certificate to the actual residual scale. -/
theorem circularLawAt {d : ℕ} {J : Fin d → Fin d → ℝ} {a b : MvPolynomial (Fin d) ℝ}
    {r : Row} {cap : ℚ} (hδ : 0 < r.delta) (hb : CircularRowBound r cap)
    (ha : Chaos3 a) (haa : ∫ y, eval y a ^ 2 ∂(stdGaussian d) = 1 / 2) (hc : Circular J a b)
    {Ψ : ℝ → ℝ} {τ : ℝ} (hτ0 : 0 ≤ τ) (hτ93 : τ ≤ 93 / 100)
    (hΨ : CapsHold (fun s => Ψ s - capPad) r.nodeList r.smax)
    (hInt : ∀ σ' : ℝ, 0 ≤ σ' → Integrable (fun y => Ψ (σ' * √(eval y (radU a b)))) (stdGaussian d)) :
    Goal (stdGaussian d) (fun y => eval y (radU a b)) (fun s => Ψ s - capPad)
      r.kappa (cap - 0) (r.delta * τ) := by
  have hd : (0 : ℝ) ≤ r.delta := by exact_mod_cast hδ.le
  rw [sub_zero]
  intro _
  exact hb a b ha haa hc _ _ hΨ (mul_nonneg hd hτ0) (mul_le_mul_of_nonneg_left hτ93 hd)
    (fun σ' hσ' => (hInt σ' hσ').sub (integrable_const _))

/-- Joint deductions from the tightened intercepts, uniform over the residual scale. -/
theorem tightShared_deductions {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {V t : ℝ} {Qh v : E} (hred : CircularSharedReduction rowData V t Qh v) :
    ∃ d8 d9 : ℝ, 0 ≤ d8 ∧ 0 ≤ d9 ∧ (TightShared.saving : ℝ) ≤ d8 + d9 ∧
      RowHolds ε TightShared.row8.ell TightShared.row8.beta ((TightShared.row8.C : ℝ) - d8) V t Qh v ∧
      RowHolds ε TightShared.row9.ell TightShared.row9.beta ((TightShared.row9.C : ℝ) - d9) V t Qh v := by
  obtain ⟨d, J, A, B, X1, X2, X3, τ, x, hA, haa, hc, hM, _, hτ0, hτ93, _, hX, hshared⟩ := hred
  have mem8 : row08 ∈ rowData := List.mem_of_getElem? (i := 7) (by rfl)
  have mem9 : row09 ∈ rowData := List.mem_of_getElem? (i := 8) (by rfl)
  obtain ⟨P8, h8, hi8⟩ := hshared row08 mem8
  obtain ⟨P9, h9, hi9⟩ := hshared row09 mem9
  let s8 := SharedGate.surplus row08 (stdGaussian d) X1 X2 X3 τ
  let s9 := SharedGate.surplus row09 (stdGaussian d) X1 X2 X3 τ
  have z8 : 0 ≤ s8 := SharedGate.surplus_nonneg row08 row08_gateOK row08_kappa_le hM hX h8.2.2.1
  have z9 : 0 ≤ s9 := SharedGate.surplus_nonneg row09 row09_gateOK row09_kappa_le hM hX h9.2.2.1
  have hc08 : row08CapTight = cap08Tight := by decide +kernel
  have hb8 : CircularRowBound row08 cap08Tight := by
    intro dim
    rw [← hc08]
    exact @circularRowBound_row08 dim
  have hc09 : row09CapTight = cap09Tight := by decide +kernel
  have hb9 : CircularRowBound row09 cap09Tight := by
    intro dim
    rw [← hc09]
    exact @circularRowBound_row09 dim
  have H9 : RowHolds ε TightShared.row9.ell TightShared.row9.beta
      ((TightShared.row9.C : ℝ) - s9) V t Qh v := by
    simpa only [TightShared.row9, Row.env, s9, Rat.cast_zero, zero_add] using
      SharedGate.saved_row_with_cap row09 cap09Tight 0 h9
      (circularLawAt row09_delta_pos hb9 hA haa hc hτ0 hτ93 h9.1 hi9)
  by_cases hcut : τ ≤ (TightShared.cut : ℝ)
  · have hd : (0 : ℝ) ≤ row08.delta := by exact_mod_cast row08_delta_pos.le
    have smallLaw := rect_sound (stdGaussian d) hM h8.1 row08.kappa
      (cap08Tight - TightShared.saving) 0 xMax tightSmallRect tightSmallRect_ok
      (by simpa using hM.x0) hM.x1 (row08.delta * τ)
      (by simpa only [tightSmallRect, Rat.cast_zero] using mul_nonneg hd hτ0)
      (by simpa only [tightSmallRect, Rat.cast_mul] using mul_le_mul_of_nonneg_left hcut hd)
    have good : (0 : ℝ) ≤ TightShared.saving :=
      (Rat.cast_nonneg (K := ℝ)).mpr (by decide +kernel)
    exact ⟨(TightShared.saving : ℝ) + s8, s9, add_nonneg good z8, z9, by linarith only [z8, z9],
      SharedGate.saved_row_with_cap row08 cap08Tight TightShared.saving h8 smallLaw, H9⟩
  · have hs := mul_self_le_mul_self
      (show (0 : ℝ) ≤ TightShared.cut by norm_num [TightShared.cut]) (lt_of_not_ge hcut).le
    have hp : (0 : ℝ) ≤ SharedGate.gateExcess := by norm_num [SharedGate.gateExcess]
    have hsize : (TightShared.saving : ℝ) ≤ (SharedGate.gateExcess : ℝ) * τ ^ 2 := by
      simpa only [TightShared.saving, Rat.cast_mul, Rat.cast_pow, pow_two] using
        mul_le_mul_of_nonneg_left hs hp
    refine ⟨s8, s9, z8, z9, hsize.trans (SharedGate.pair_surplus hM hX h8.2.2.1 h9.2.2.1), ?_, H9⟩
    simpa only [TightShared.row8, Row.env, s8, Rat.cast_zero, zero_add] using
      SharedGate.saved_row_with_cap row08 cap08Tight 0 h8
      (circularLawAt row08_delta_pos hb8 hA haa hc hτ0 hτ93 h8.1 hi8)

/-- The simultaneous Gaussian reduction gives the tightened, shared-gate hat cap. -/
theorem tightShared_profile {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hmass : V ≤ (1 - 1 / 2) * t ^ 2 + 1 / 2 + (massS : ℝ) - (ε : ℝ) * ‖Qh‖ ^ 2)
    (hred : CircularSharedReduction rowData V t Qh v) : V ≤ (TightShared.cap : ℝ) :=
  TightShared.profile_bound hv ht0 ht1 (tight_scalar_rows V t Qh v hmass hred) (tightShared_deductions hred)

theorem tightShared_lower_of_tailNodeCaps (hcaps : TailNodeCaps (nuHat (47 / 2000))) {K : ℝ}
    (hK : IsGrothendieckBound K) : (TightShared.endpoint : ℝ) ≤ K := by
  simpa only [TightShared.endpoint, Rat.cast_div, Rat.cast_one, Rat.cast_sub, Rat.cast_mul,
    Rat.cast_add, Rat.cast_ofNat] using
    transfer_lower (transferInputs_of_witnessCap (by norm_num) (by norm_num) 2
      (witnessCap_of_circular_profile (@tightShared_profile) hcaps)) hK

end

end Grothe.LowerAnalytic

namespace Grothe.Statement

theorem tightSharedEndpoint_le_of_tailNodeCaps
    (hcaps : LowerAnalytic.TailNodeCaps (LowerAnalytic.nuHat (47 / 2000)))
    (hne : ∃ K, IsBound K) : (TightShared.endpoint : ℝ) ≤ complexGrothendieckConstant :=
  le_csInf hne fun _ hK => LowerAnalytic.tightShared_lower_of_tailNodeCaps hcaps (isBound_iff.mp hK)

end Grothe.Statement
