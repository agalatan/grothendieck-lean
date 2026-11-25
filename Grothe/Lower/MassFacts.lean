import Grothe.Lower.Cert.MassRow

/-! # The mass row: the law-level bound -/

open MeasureTheory

namespace Grothe.Lower

noncomputable section

/-- **The law-level bound of the mass row** (fact 3 of the certificate's mass row): for every law with the moments and the
Stein cuts and every `0 ≤ σ ≤ ρ`, `E φ_c(σ√U) − ε̂σ² ≤ S(1/2)`. -/
theorem mass_law_bound {Ω : Type} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ] {U : Ω → ℝ}
    {x : ℝ} (hM : Moments μ U x) (hS : SteinCut μ U) {σ : ℝ} (h0 : 0 ≤ σ) (h1 : σ ≤ ρ)
    (hf : Integrable (fun ω => phiMass ε massC (σ * √(U ω))) μ) :
    ∫ ω, phiMass ε massC (σ * √(U ω)) ∂μ - (ε : ℝ) * σ ^ 2 ≤ massS := by
  have e1 : ∀ ω, massPot ((3 / 4 : ℝ) * σ * √(U ω)) = phiMass ε massC (σ * √(U ω)) := by
    intro ω
    unfold massPot
    congr 1
    ring
  have hδ : ((massRow.delta : ℚ) : ℝ) = 3 / 4 := by rw [massRow_delta]; norm_num
  have h := certMassRow μ hM hS (σ := (3 / 4 : ℝ) * σ)
    (by positivity)
    (by rw [hδ]; exact mul_le_mul_of_nonneg_left h1 (by norm_num))
    (by simpa only [e1] using hf)
  simp only [e1] at h
  have hκ : ((massRow.kappa : ℚ) : ℝ) * (3 / 4) ^ 2 ≤ (ε : ℝ) := by
    rw [massRow_kappa]
    norm_num [ε]
  have hcap : ((massRow.cap : ℚ) : ℝ) ≤ (massS : ℝ) := by
    have : massRow.cap ≤ massS := by rw [massRow_cap]; norm_num [massS]
    exact_mod_cast this
  have hsq : 0 ≤ σ ^ 2 := sq_nonneg σ
  nlinarith [mul_le_mul_of_nonneg_right hκ hsq]

end

end Grothe.Lower
