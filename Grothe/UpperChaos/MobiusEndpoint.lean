import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith

/-! Endpoint limit of the standard positive half-line map. This standalone
scratch defines the same map as MobiusGeometry; the improper integral remains
separate. -/
open Set Filter
open scoped Topology
namespace Grothe.UpperChaos.MobiusEndpoint
noncomputable section

def forward (t : ℝ) : ℝ := t / (1 + t)

theorem forward_tendsto : Tendsto forward atTop (𝓝[Icc (0 : ℝ) 1] 1) := by
  have hadd : Tendsto (fun t : ℝ => 1 + t) atTop atTop := by
    simpa only [id_eq, add_comm] using tendsto_atTop_add_const_right atTop (1 : ℝ) (tendsto_id : Tendsto (fun t : ℝ => t) atTop atTop)
  have hi : Tendsto (fun t : ℝ => (1 + t)⁻¹) atTop (𝓝 (0 : ℝ)) :=
    tendsto_inv_atTop_zero.comp hadd
  have hs : Tendsto (fun t : ℝ => 1 - (1 + t)⁻¹) atTop (𝓝 (1 : ℝ)) := by
    simpa only [sub_zero] using tendsto_const_nhds.sub hi
  have heq : forward =ᶠ[atTop] (fun t : ℝ => 1 - (1 + t)⁻¹) := by
    filter_upwards [eventually_ge_atTop (0 : ℝ)] with t ht
    have h : 1 + t ≠ 0 := by linarith
    unfold forward
    field_simp
    ring
  have hlim : Tendsto forward atTop (𝓝 (1 : ℝ)) := hs.congr' heq.symm
  apply tendsto_nhdsWithin_iff.mpr
  refine ⟨hlim, ?_⟩
  filter_upwards [eventually_ge_atTop (0 : ℝ)] with t ht
  have hp : 0 < 1 + t := by linarith
  change 0 ≤ t / (1 + t) ∧ t / (1 + t) ≤ 1
  exact ⟨div_nonneg ht hp.le, (div_le_one hp).2 (by linarith)⟩

#print axioms forward_tendsto
end
end Grothe.UpperChaos.MobiusEndpoint
