import Grothe.Lower.WeightedSchur
import Grothe.Lower.EnvelopeTight

set_option warningAsError true

/-!
# The weighted law and gate deduction for the two tightened rows

A quadratic majorant supplies a potential saving for row08 at small residual scales.
The joint Schur price applies at every scale to the same random coordinates.

Agent-ID: codex-a7c4
-/

open MeasureTheory
open scoped BigOperators

namespace Grothe.Lower.TightShared

open LowerAnalytic

def row8 : EnvRow := ({ row08 with cap := cap08Tight } : Row).env

def row9 : EnvRow := ({ row09 with cap := cap09Tight } : Row).env

end Grothe.Lower.TightShared

namespace Grothe.Lower.SharedGate.WeightedSchur

def twoRows : Fin 2 → Row := ![row08, row09]

noncomputable def twoWeights (θ : ℝ) : Fin 2 → ℝ := ![1-θ, θ]

noncomputable def pairGain (θ : ℝ) : ℝ := gain (twoWeights θ) twoRows

/-- The integrated surplus for every real mixing weight of the actual rows 08 and 09. -/
theorem pair_surplus {Ω : Type} [MeasurableSpace Ω] {μ : Measure Ω}
    {U : Ω → ℝ} {x τ : ℝ} {X1 X2 X3 : Ω → ℂ}
    (θ : ℝ) (h0 : 0 ≤ θ) (h1 : θ ≤ 1) (hM : Moments μ U x)
    (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω)
    (h8 : Integrable (fun ω ↦ row08.gate (X1 ω) (X2 ω) (X3 ω)) μ)
    (h9 : Integrable (fun ω ↦ row09.gate (X1 ω) (X2 ω) (X3 ω)) μ) :
    pairGain θ * τ ^ 2 ≤ (1-θ) * surplus row08 μ X1 X2 X3 τ + θ * surplus row09 μ X1 X2 X3 τ := by
  have hw (i) : 0 ≤ twoWeights θ i := by
    fin_cases i
    · exact sub_nonneg.mpr h1
    · exact h0
  have hsum : 0 < ∑ i, twoWeights θ i := by simp [twoWeights, Fin.sum_univ_two]
  have hr (i) : gateOK (twoRows i).N = true := by
    fin_cases i <;> decide +kernel
  have hints (i) : Integrable (fun ω ↦ (twoRows i).gate (X1 ω) (X2 ω) (X3 ω)) μ := by
    fin_cases i
    · exact h8
    · exact h9
  simpa [pairGain, Fin.sum_univ_two, twoWeights, twoRows] using
    weighted_surplus (twoWeights θ) twoRows hw hsum hr hM hX hints

private def blendQ (θ : ℚ) (f : Row → ℚ) : ℚ := (1-θ)*f row08 + θ*f row09

/-- Rational form of the mixed price, evaluated only at certificate endpoints. -/
def pairGainQ (θ : ℚ) : ℚ :=
  let n := blendQ θ (fun r ↦ r.N.m11 + 2*r.g1)
  let x := blendQ θ (fun r ↦ r.N.m12 + r.g2)
  let y := blendQ θ (fun r ↦ r.N.m13 + r.g3)
  let a := blendQ θ (fun r ↦ r.N.m22)
  let b := blendQ θ (fun r ↦ r.N.m23)
  let c := blendQ θ (fun r ↦ r.N.m33)
  n - (c*x^2-2*b*x*y+a*y^2)/(a*c-b^2) - blendQ θ baseline

theorem pairGain_rat (θ : ℚ) : pairGain (θ : ℝ) = (pairGainQ θ : ℝ) := by
  simp [pairGain, pairGainQ, blendQ, gain, price, det, mix, Fin.sum_univ_two,
    twoWeights, twoRows, ofRow]

private theorem twoWeight_nonneg (w : ℝ) (hw₀ : 0 ≤ w) (hw₁ : w ≤ 1) (i : Fin 2) :
    0 ≤ twoWeights w i := by
  fin_cases i
  · exact sub_nonneg.mpr hw₁
  · exact hw₀

private theorem twoWeight_sum (w : ℝ) : 0 < ∑ i, twoWeights w i := by
  simp [twoWeights, Fin.sum_univ_two]

/-- Concavity of the row 08/09 price as a function of its real weight. -/
theorem pairGain_chord {w z : ℝ} (hw₀ : 0 ≤ w) (hw₁ : w ≤ 1)
    (hz₀ : 0 ≤ z) (hz₁ : z ≤ 1) {θ : ℝ} (h₀ : 0 ≤ θ) (h₁ : θ ≤ 1) :
    (1-θ)*pairGain w + θ*pairGain z ≤ pairGain ((1-θ)*w + θ*z) := by
  have hr (i) : gateOK (twoRows i).N = true := by fin_cases i <;> decide +kernel
  have hm : (fun i ↦ (1-θ)*twoWeights w i + θ*twoWeights z i) =
      twoWeights ((1-θ)*w + θ*z) := by
    funext i
    fin_cases i <;> simp [twoWeights]
    ring
  have h := gain_chord _ _ _ (twoWeight_nonneg w hw₀ hw₁) (twoWeight_nonneg z hz₀ hz₁)
    (twoWeight_sum w) (twoWeight_sum z) hr θ h₀ h₁
  rw [hm] at h
  exact h

theorem pairGain_nonneg {θ : ℝ} (h₀ : 0 ≤ θ) (h₁ : θ ≤ 1) : 0 ≤ pairGain θ := by
  have hz : 0 ≤ pairGain 0 := by
    rw [← Rat.cast_zero (α := ℝ), pairGain_rat]
    exact_mod_cast (show 0 ≤ pairGainQ 0 by decide +kernel)
  have ho : 0 ≤ pairGain 1 := by
    rw [← Rat.cast_one (α := ℝ), pairGain_rat]
    exact_mod_cast (show 0 ≤ pairGainQ 1 by decide +kernel)
  have h := pairGain_chord (w := 0) (z := 1) le_rfl zero_le_one zero_le_one le_rfl h₀ h₁
  simpa using (add_nonneg (mul_nonneg (sub_nonneg.mpr h₁) hz) (mul_nonneg h₀ ho)).trans h

/-- At weight one half the simultaneous price recovers the certified unweighted gain. -/
theorem half_gain : (1018 : ℚ) / 10000000 ≤ 2 * pairGainQ (1/2) := by decide +kernel

/-- Taking the infimum over residual squared scales for the checked piecewise-linear law.
The estimate is attained at either zero or the zero of the affine law deduction. -/
theorem law_gate_discount {a b W G s : ℝ} (hb : 0 < b) (hW : 0 ≤ W)
    (hG : 0 ≤ G) (hs : 0 ≤ s) :
    min (W*a) (G*(a/b)) ≤ G*s + W*max 0 (a-b*s) := by
  have hid : b*(a/b) = a := by field_simp
  by_cases hz : a/b ≤ s
  · exact (min_le_right _ _).trans ((mul_le_mul_of_nonneg_left hz hG).trans
      (le_add_of_nonneg_right (mul_nonneg hW (le_max_left _ _))))
  · have hs' : s ≤ a/b := (lt_of_not_ge hz).le
    have hdot := mul_le_mul_of_nonneg_left hs' hb.le
    rw [hid] at hdot
    rw [max_eq_right (sub_nonneg.mpr hdot)]
    by_cases hsign : G ≤ W*b
    · apply (min_le_right _ _).trans
      have hdiff := mul_nonneg (sub_nonneg.mpr hsign) (sub_nonneg.mpr hs')
      nlinarith only [hdiff, congrArg (W * ·) hid]
    · apply (min_le_left _ _).trans
      nlinarith only [mul_nonneg (sub_nonneg.mpr (le_of_not_ge hsign)) hs]

/-- The two nonlinear deductions have simultaneous lower chords. -/
theorem min_chord {p q r s θ : ℝ} (h₀ : 0 ≤ θ) (h₁ : θ ≤ 1) :
    (1-θ)*min p q + θ*min r s ≤ min ((1-θ)*p + θ*r) ((1-θ)*q + θ*s) :=
  le_min
    (add_le_add (mul_le_mul_of_nonneg_left (min_le_left _ _) (sub_nonneg.mpr h₁))
      (mul_le_mul_of_nonneg_left (min_le_left _ _) h₀))
    (add_le_add (mul_le_mul_of_nonneg_left (min_le_right _ _) (sub_nonneg.mpr h₁))
      (mul_le_mul_of_nonneg_left (min_le_right _ _) h₀))

/-- The published quadratic is a global pointwise majorant of the potential. Its explicit
integral deduction holds at every nonnegative scale; the positive deduction is useful near zero. -/
theorem row08_quadratic_law {Ω : Type} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {U : Ω → ℝ} {x : ℝ} {Ψ : ℝ → ℝ} (hM : Moments μ U x)
    (hΨ : CapsHold Ψ row08.nodeList row08.smax) {σ : ℝ} (hσ : 0 ≤ σ)
    (hf : Integrable (fun ω ↦ Ψ (σ * √(U ω))) μ) :
    (∫ ω, Ψ (σ * √(U ω)) ∂μ) - (row08.kappa : ℝ) * σ^2 ≤
      1339829981/1000000000 + (11331869/10000000 - (row08.kappa : ℝ)) * σ^2 := by
  have hcheck := smallRectangle_ok
  simp only [checkRect, Bool.and_eq_true] at hcheck
  have hpt (ω) : Ψ (σ * √(U ω)) ≤ evalL (smallRect.P.list.map ((↑) : ℚ → ℝ)) (σ * √(U ω)) := by
    simpa using major_sound Ψ row08.nodeList row08.smax hΨ 1 smallRect.P.list
      (fun _ ↦ []) [] (fun _ ↦ 0) (by intro v _ _; simp [evalL]) hcheck.1.2
      (σ * √(U ω)) (mul_nonneg hσ (Real.sqrt_nonneg _))
  apply le_trans (rect_integral μ hM smallRect.P (by decide +kernel) (by decide +kernel)
    row08.kappa σ hσ _ hf hpt)
  simp [MPoly.J, smallRect]

open LowerAnalytic

def lawA : ℚ := cap08Tight - 1339829981/1000000000

def lawB : ℚ := (11331869/10000000 - row08.kappa) * row08.delta ^ 2

noncomputable def discount (θ : ℝ) : ℝ :=
  min ((1-θ)*(lawA : ℝ)) (pairGain θ * ((lawA : ℝ)/(lawB : ℝ)))

/-- A real-valued law deduction and the actual gate surplus lower the same row intercept. -/
theorem real_reserve {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {Ω : Type} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {U : Ω → ℝ} {τ V t : ℝ} {X1 X2 X3 : Ω → ℂ} {Qh v : E}
    (r : Row) (cap : ℚ) (reserve : ℝ) {Ψ : ℝ → ℝ}
    (hr : RowSharedWith r Ψ μ U X1 X2 X3 τ V t Qh v)
    (hlaw : (∫ ω, (Ψ (r.delta * τ * √(U ω)) - capPad) ∂μ) -
      (r.kappa : ℝ) * (r.delta * τ)^2 ≤ (cap : ℝ) - reserve) :
    RowHolds ε r.ell r.beta ((({r with cap := cap} : Row).env.C : ℝ) -
      (reserve + surplus r μ X1 X2 X3 τ)) V t Qh v := by
  obtain ⟨_, hf, _, hV⟩ := hr
  rw [integral_sub hf (integrable_const _), integral_const, probReal_univ, one_smul] at hlaw
  unfold RowHolds Row.env surplus baseline
  push_cast at hlaw ⊢
  nlinarith only [hV, hlaw]

/-- On the actual shared coordinates, the tightened row08 law and both gates pay their
joint discount at every admissible weight. The full law for each tightened row is explicit. -/
theorem actual_deductions {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {Ω : Type} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {U : Ω → ℝ} {x τ V t : ℝ} {X1 X2 X3 : Ω → ℂ} {Qh v : E} {Ψ8 Ψ9 : ℝ → ℝ}
    (θ : ℝ) (h₀ : 0 ≤ θ) (h₁ : θ ≤ 1) (hM : Moments μ U x) (hτ : 0 ≤ τ)
    (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω)
    (h8 : RowSharedWith row08 Ψ8 μ U X1 X2 X3 τ V t Qh v)
    (h9 : RowSharedWith row09 Ψ9 μ U X1 X2 X3 τ V t Qh v)
    (hl8 : Goal μ U (fun z ↦ Ψ8 z - capPad) row08.kappa cap08Tight (row08.delta * τ))
    (hl9 : Goal μ U (fun z ↦ Ψ9 z - capPad) row09.kappa cap09Tight (row09.delta * τ)) :
    ∃ d8 d9 : ℝ, discount θ ≤ (1-θ)*d8 + θ*d9 ∧
      RowHolds ε TightShared.row8.ell TightShared.row8.beta ((TightShared.row8.C : ℝ)-d8) V t Qh v ∧
      RowHolds ε TightShared.row9.ell TightShared.row9.beta ((TightShared.row9.C : ℝ)-d9) V t Qh v := by
  let dlaw := max 0 ((lawA : ℝ) - lawB*τ^2)
  let s8 := surplus row08 μ X1 X2 X3 τ
  let s9 := surplus row09 μ X1 X2 X3 τ
  have hb : 0 < (lawB : ℝ) := by exact_mod_cast (show 0 < lawB by decide +kernel)
  have hd : (0 : ℝ) ≤ row08.delta := by exact_mod_cast (show 0 ≤ row08.delta by decide +kernel)
  have hg := pair_surplus θ h₀ h₁ hM hX h8.2.2.1 h9.2.2.1
  change pairGain θ * τ^2 ≤ (1-θ)*s8 + θ*s9 at hg
  have hdisc := law_gate_discount (a := (lawA : ℝ)) hb (sub_nonneg.mpr h₁)
    (pairGain_nonneg h₀ h₁) (sq_nonneg τ)
  change discount θ ≤ pairGain θ * τ ^ 2 + (1-θ) * dlaw at hdisc
  refine ⟨dlaw+s8, s9, by linarith only [hdisc,hg], ?_, ?_⟩
  · apply real_reserve row08 cap08Tight dlaw h8
    have hI := h8.2.1.sub (integrable_const (capPad : ℝ))
    have hcap := hl8 hI
    have hquad := row08_quadratic_law hM h8.1 (mul_nonneg hd hτ) hI
    have hA : (lawA : ℝ) = (cap08Tight : ℝ)-1339829981/1000000000 := by norm_num [lawA]
    have hB : (lawB : ℝ) = (11331869/10000000-(row08.kappa : ℝ))*(row08.delta : ℝ)^2 := by
      push_cast [lawB]
      rfl
    change _ ≤ (cap08Tight : ℝ) - max 0 ((lawA : ℝ) - lawB*τ^2)
    rcases le_total ((lawA : ℝ) - lawB*τ^2) 0 with hz | hz
    · simpa only [max_eq_left hz, sub_zero] using hcap
    · rw [max_eq_right hz,hA,hB]
      nlinarith only [hquad]
  · have h := real_reserve row09 cap09Tight 0 h9 (by
      simpa using hl9 (h9.2.1.sub (integrable_const (capPad : ℝ))))
    simpa only [TightShared.row9, Row.env, s9, zero_add] using h

def discountQ (θ : ℚ) : ℚ := min ((1-θ)*lawA) (pairGainQ θ * (lawA/lawB))

theorem discount_rat (θ : ℚ) : discount (θ : ℝ) = (discountQ θ : ℝ) := by
  simp [discount, discountQ, pairGain_rat]

theorem discount_chord {w z : ℝ} (hw₀ : 0 ≤ w) (hw₁ : w ≤ 1)
    (hz₀ : 0 ≤ z) (hz₁ : z ≤ 1) {θ : ℝ} (h₀ : 0 ≤ θ) (h₁ : θ ≤ 1) :
    (1-θ)*discount w + θ*discount z ≤ discount ((1-θ)*w+θ*z) := by
  have hab : 0 ≤ (lawA : ℝ)/(lawB : ℝ) :=
    div_nonneg (by exact_mod_cast (show 0 ≤ lawA by decide +kernel))
      (by exact_mod_cast (show 0 ≤ lawB by decide +kernel))
  apply (min_chord h₀ h₁).trans
  apply min_le_min
  · apply le_of_eq
    ring
  · rw [← mul_assoc, ← mul_assoc, ← add_mul]
    exact mul_le_mul_of_nonneg_right (pairGain_chord hw₀ hw₁ hz₀ hz₁ h₀ h₁) hab

end Grothe.Lower.SharedGate.WeightedSchur
