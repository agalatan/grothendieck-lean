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
# Scalar rows and witness transfer for the circular Gaussian reduction

The two checked antiholomorphic Stein bounds supply rows 08 and 09. Together with
the mass tangent and the twelve other rows they feed the joint envelope. A uniform
profile bound then transfers to the identity-tail witness through the node caps.
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


end

end Grothe.LowerAnalytic
