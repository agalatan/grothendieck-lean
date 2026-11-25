import Grothe.LowerAnalytic.Reduction
import Grothe.LowerAnalytic.MassRowFrame
import Grothe.LowerAnalytic.AntiRows.Row08
import Grothe.LowerAnalytic.AntiRows.Row09
import Grothe.Lower.EnvelopeTight
import Grothe.Lower.Cert.Row01
import Grothe.Lower.Cert.Row02
import Grothe.Lower.Cert.Row03
import Grothe.Lower.Cert.Row04
import Grothe.Lower.Cert.Row05
import Grothe.Lower.Cert.Row06
import Grothe.Lower.Cert.Row07
import Grothe.Lower.Cert.Row10
import Grothe.Lower.Cert.Row11
import Grothe.Lower.Cert.Row12
import Grothe.Lower.Cert.Row13
import Grothe.Lower.Cert.Row14

/-!
# Tightened lower bound breaking `K_G^ℂ > 1.402` via antiholomorphic Stein calculus

Replaces the two bottleneck rows `row08` (`0.835`) and `row09` (`0.845`) with their kernel-checked
antiholomorphic Stein certificates (`circularRowBound_row08`, `circularRowBound_row09`) and uses the
certified cubic radius bound `‖p‖ ≤ 93/100` (`circularReductionHyp_of_nodeCaps`) together with the
kernel-checked 38-cell tightened envelope (`certEnvelopeTight`, `envBTight = 353183/500000 = 0.706366`) to
certify `1 / ((1 − 47/2000) envBTight + 47/2000) > 1.402` (`lower_bound_tight_of_tailNodeCaps`),
with zero node-cap rebuild and zero new `native_decide` axioms.
-/

open MeasureTheory MvPolynomial Grothe.Lower

namespace Grothe.LowerAnalytic

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- **A tightened circular row holds in the circular shared reduction**: completing the gate square
and applying `CircularRowBound r cap` at `σ = δ τ ≤ δ · 93/100` gives
`RowOf ({ r with cap := cap }.env) V t Qh v`. -/
theorem rowOf_of_circular (r : Row) (cap : ℚ)
    (hδ : 0 < r.delta) (hok : gateOK r.N = true)
    (hκ : r.kappa * r.delta ^ 2 ≤ r.delta + gatePrice r.N r.g1 r.g2 r.g3)
    (hb : CircularRowBound r cap)
    {d : ℕ} {J : Fin d → Fin d → ℝ} {a b : MvPolynomial (Fin d) ℝ}
    (ha : Chaos3 a) (haa : ∫ y, eval y a ^ 2 ∂(stdGaussian d) = 1 / 2) (hc : Circular J a b)
    {X1 X2 X3 : (Fin d → ℝ) → ℂ} {τ x : ℝ}
    (hM : Moments (stdGaussian d) (fun y => eval y (radU a b)) x)
    (hτ0 : 0 ≤ τ) (hτ93 : τ ≤ 93 / 100)
    (hX : ∀ y, ‖X1 y‖ ^ 2 = τ ^ 2 * eval y (radU a b))
    {V t : ℝ} {Qh v : E} {Ψ : ℝ → ℝ}
    (h : RowSharedWith r Ψ (stdGaussian d) (fun y => eval y (radU a b)) X1 X2 X3 τ V t Qh v)
    (hInt : ∀ σ' : ℝ, 0 ≤ σ' → Integrable (fun y => Ψ (σ' * √(eval y (radU a b)))) (stdGaussian d)) :
    RowOf ({ r with cap := cap }.env) V t Qh v := by
  obtain ⟨hΨ, hf, hg, hV⟩ := h
  have hδR : (0 : ℝ) ≤ r.delta := by exact_mod_cast hδ.le
  have hG : (gatePrice r.N r.g1 r.g2 r.g3 : ℝ) * τ ^ 2 ≤ ∫ y, r.gate (X1 y) (X2 y) (X3 y) ∂(stdGaussian d) :=
    gate_integral_ge r.N r.g1 r.g2 r.g3 hok X1 X2 X3 τ hX hM hg
  have hκR : (r.kappa : ℝ) * r.delta ^ 2 ≤ r.delta + gatePrice r.N r.g1 r.g2 r.g3 := by
    exact_mod_cast hκ
  have hbd := hb a b ha haa hc (fun s => Ψ s - capPad) (r.delta * τ) hΨ
    (mul_nonneg hδR hτ0) (mul_le_mul_of_nonneg_left hτ93 hδR)
    (fun σ' hσ' => (hInt σ' hσ').sub (integrable_const _))
  rw [integral_sub hf (integrable_const _), integral_const, probReal_univ, one_smul] at hbd
  have hsq := mul_nonneg (sub_nonneg.2 hκR) (sq_nonneg τ)
  unfold RowOf RowHolds Row.env
  push_cast
  nlinarith [hV, hG, hsq, hbd]

/-- All tight scalar rows and the mass tangent, before pricing a cell of the envelope. -/
theorem tight_scalar_rows (V t : ℝ) (Qh v : E)
    (hmass : V ≤ (1 - 1 / 2) * t ^ 2 + 1 / 2 + (massS : ℝ) - (ε : ℝ) * ‖Qh‖ ^ 2)
    (hred : CircularSharedReduction rowData V t Qh v) :
    ∀ k m a, envRowAtPure envRowsTight massS m k = some a → RowOf a V t Qh v := by
  obtain ⟨d, J, A, B, X1, X2, X3, τ, x, hA, haa, hc, hM, hGI, hτ0, hτ93, hτρ, hX, hshared⟩ := hred
  have hS : SteinCut (stdGaussian d) (fun y => eval y (radU A B)) := steinCut_of_inputs _ hM hGI
  rintro (_ | k) m a h
  · cases h
    exact rowOf_massTangent hmass m v
  · simp only [envRowAtPure, ← envRowsTight_eq, List.getElem?_map] at h
    obtain ⟨r', hr', rfl⟩ := Option.map_eq_some_iff.1 h
    have hplain (r : Row) (hr : r ∈ rowData) (hf : RowFacts r) : RowOf r.env V t Qh v := by
      obtain ⟨Ψ, hsh, _⟩ := hshared r hr
      exact rowOf_of_shared r hf hM hS hτ0 hτρ hX ⟨Ψ, hsh⟩
    have h08cap : row08CapTight = cap08Tight := by decide +kernel
    have h09cap : row09CapTight = cap09Tight := by decide +kernel
    match k with
    | 0 => simp [rowDataTight] at hr'; subst hr'; exact hplain row01 (by simp [rowData]) (rowFacts_of_checkSpecRow _ certRow01)
    | 1 => simp [rowDataTight] at hr'; subst hr'; exact hplain row02 (by simp [rowData]) (rowFacts_of_checkSpecRow _ certRow02)
    | 2 => simp [rowDataTight] at hr'; subst hr'; exact hplain row03 (by simp [rowData]) (rowFacts_of_checkRow _ certRow03)
    | 3 => simp [rowDataTight] at hr'; subst hr'; exact hplain row04 (by simp [rowData]) (rowFacts_of_checkRow _ certRow04)
    | 4 => simp [rowDataTight] at hr'; subst hr'; exact hplain row05 (by simp [rowData]) (rowFacts_of_checkRow _ certRow05)
    | 5 => simp [rowDataTight] at hr'; subst hr'; exact hplain row06 (by simp [rowData]) (rowFacts_of_checkRow _ certRow06)
    | 6 => simp [rowDataTight] at hr'; subst hr'; exact hplain row07 (by simp [rowData]) (rowFacts_of_checkRow _ certRow07)
    | 7 =>
      simp [rowDataTight] at hr'; subst hr'
      obtain ⟨Ψ, hsh, hInt⟩ := hshared row08 (by simp [rowData])
      exact rowOf_of_circular row08 cap08Tight row08_delta_pos row08_gateOK row08_kappa_le
        (h08cap ▸ circularRowBound_row08) hA haa hc hM hτ0 hτ93 hX hsh hInt
    | 8 =>
      simp [rowDataTight] at hr'; subst hr'
      obtain ⟨Ψ, hsh, hInt⟩ := hshared row09 (by simp [rowData])
      exact rowOf_of_circular row09 cap09Tight row09_delta_pos row09_gateOK row09_kappa_le
        (h09cap ▸ circularRowBound_row09) hA haa hc hM hτ0 hτ93 hX hsh hInt
    | 9 => simp [rowDataTight] at hr'; subst hr'; exact hplain row10 (by simp [rowData]) (rowFacts_of_checkRow _ certRow10)
    | 10 => simp [rowDataTight] at hr'; subst hr'; exact hplain row11 (by simp [rowData]) (rowFacts_of_checkRow _ certRow11)
    | 11 => simp [rowDataTight] at hr'; subst hr'; exact hplain row12 (by simp [rowData]) (rowFacts_of_checkRow _ certRow12)
    | 12 => simp [rowDataTight] at hr'; subst hr'; exact hplain row13 (by simp [rowData]) (rowFacts_of_checkRow _ certRow13)
    | 13 => simp [rowDataTight] at hr'; subst hr'; exact hplain row14 (by simp [rowData]) (rowFacts_of_checkRow _ certRow14)
    | k + 14 => simp [rowDataTight] at hr'

/-- **Tightened envelope cap on the hat value**: combining the mass row, the 12 existing rows, and
the two antiholomorphic Stein rows (`row08`, `row09`) gives `V ≤ envBTight` for `t ∈ [0, 9/10]`. -/
theorem profile_bound_tight (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hmass : V ≤ (1 - 1 / 2) * t ^ 2 + 1 / 2 + (massS : ℝ) - (ε : ℝ) * ‖Qh‖ ^ 2)
    (hred : CircularSharedReduction rowData V t Qh v) : V ≤ (envBTight : ℝ) := by
  exact envPure_bound envRowsTight massS envBTight envCellsTight certEnvelopeTight hv ht0 ht1
    (tight_scalar_rows V t Qh v hmass hred)

/-- Transfer any uniform bound on the simultaneous circular profile to the identity-tail witness. -/
theorem witnessCap_of_circular_profile {B : ℝ}
    (hp : ∀ {F : Type} [NormedAddCommGroup F] [InnerProductSpace ℝ F] (V t : ℝ) (Qh v : F),
      ‖v‖ ^ 2 = 2 → 0 ≤ t → t ≤ 9 / 10 →
      V ≤ (1 - 1 / 2) * t ^ 2 + 1 / 2 + (massS : ℝ) - (ε : ℝ) * ‖Qh‖ ^ 2 →
      CircularSharedReduction rowData V t Qh v → V ≤ B)
    (hcaps : TailNodeCaps (nuHat (47 / 2000))) (n : ℕ) (hn : 2 ≤ n) :
    WitnessCap n (191 / 250) (47 / 2000) ((1 - 47 / 2000) * B + 47 / 2000) := by
  have he : epsHat (191 / 250) (47 / 2000) = ε := by norm_num [epsHat, ε]
  have hν : 2 * nuHat (47 / 2000) + 1 / 2 = (massC : ℝ) := by norm_num [nuHat, massC]
  obtain ⟨m, rfl⟩ : ∃ m, n = m + 1 := ⟨n - 1, by omega⟩
  refine witnessCap_of_VhatOf_le (m + 1) (by norm_num) fun f g hf hg _ => ?_
  obtain ⟨v, hv, hshared⟩ := circularReductionHyp_of_nodeCaps he hcaps (n := m) (by omega) f g hf hg
  exact hp _ _ _ v hv (norm_nonneg _) (tOf_le (m + 1) hf hg)
    (massRow_frame (m + 1) (by omega) he hν hf hg) hshared

/-- **Tightened scalar cap of the witness** `(191/250, 47/2000)`, modulo the unchanged node caps. -/
theorem witnessCap_tight (hcaps : TailNodeCaps (nuHat (47 / 2000))) (n : ℕ) (hn : 2 ≤ n) :
    WitnessCap n (191 / 250) (47 / 2000) ((1 - 47 / 2000) * (envBTight : ℝ) + 47 / 2000) :=
  witnessCap_of_circular_profile (@profile_bound_tight) hcaps n hn

/-- **Tightened lower bound, modulo the unchanged node caps**:
`K ≥ 1 / ((1 − 47/2000) envBTight + 47/2000) > 1.402` for every Grothendieck bound `K`. -/
theorem lower_bound_tight_of_tailNodeCaps (hcaps : TailNodeCaps (nuHat (47 / 2000))) {K : ℝ}
    (hK : IsGrothendieckBound K) : 1 / ((1 - 47 / 2000) * (envBTight : ℝ) + 47 / 2000) ≤ K :=
  transfer_lower (transferInputs_of_witnessCap (by norm_num) (by norm_num) 2
    fun n hn => witnessCap_tight hcaps n hn) hK

end

end Grothe.LowerAnalytic
