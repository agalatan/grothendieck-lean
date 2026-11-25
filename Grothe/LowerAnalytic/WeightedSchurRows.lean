import Grothe.Lower.WeightedSchur
import Grothe.Lower.EnvelopeTight

set_option warningAsError true

/-!
# The weighted law and gate deduction for the two tightened rows

The Schur complement prices both rows on their common Gaussian coordinates.
The row reserve combines this gain with each row’s law bound.

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

open LowerAnalytic

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

end Grothe.Lower.SharedGate.WeightedSchur
