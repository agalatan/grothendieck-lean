import Grothe.Lower.MassCover
import Grothe.Lower.Cert.MassWitnesses

/-! # The kernel-certified mass row -/

open MeasureTheory

namespace Grothe.Lower

private theorem massMesh_ok : meshOK 0 massMesh = true := by decide +kernel

/-- The spectral inequalities at the witness scales and convexity between them bound the
expected mass potential for every admissible law. -/
theorem certMassRow {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]
    {U : Ω → ℝ} {x : ℝ} (hM : Moments μ U x) (hS : SteinCut μ U)
    {σ : ℝ} (h0 : 0 ≤ σ) (h1 : σ ≤ (massRow.delta : ℝ) * ρ) :
    Goal μ U massPot massRow.kappa massRow.cap σ := by
  apply massCover_sound μ hM massWitnesses _ massCells massCover_checked h0 (by exact_mod_cast h1)
  intro w hw
  have hok := massWitnesses_ok w hw
  exact ⟨(massWitOK_nonneg massMesh w hok).2, massWit_tb μ hM hS massMesh massMesh_ok w hok⟩

end Grothe.Lower
