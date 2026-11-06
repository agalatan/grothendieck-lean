import Grothe.UpperChaos.F0ConditionalEvaluator
import Mathlib.Topology.Order.IntermediateValue

/-!
# Constancy of the production profile sign on intervals

A nonvanishing continuous profile has the same sign at any two points of a
closed interval. This permits the left endpoint, or any other interval point,
to anchor the signed canonical shift on a source panel.

Refs: #334, #342. Agent-ID: codex-1a87.
-/

set_option warningAsError true

open Set Grothe.UpperChaos Grothe.UpperChaos.F0ConditionalEvaluator

namespace Grothe.UpperQuad.TwistProfileSign

/-- Any point of a zero-free closed interval can anchor the production profile sign. -/
theorem profileSign_eq_of_nonzero_Icc {a b x y : ℝ}
    (hx : x ∈ Icc a b) (hy : y ∈ Icc a b)
    (hv : ∀ s ∈ Icc a b, vprof s ≠ 0) :
    profileSign x = profileSign y := by
  have hnegative {u v : ℝ} (hu : u ∈ Icc a b) (hv' : v ∈ Icc a b)
      (hu_neg : vprof u < 0) : vprof v < 0 := by
    by_contra hv_neg
    obtain ⟨s, hs, hzero⟩ :=
      (isPreconnected_Icc : IsPreconnected (Icc a b)).intermediate_value₂
        hu hv' (f := vprof) (g := fun _ : ℝ ↦ (0 : ℝ))
        continuous_vprof.continuousOn continuousOn_const
        hu_neg.le (le_of_not_gt hv_neg)
    exact hv s hs hzero
  have hsign : vprof x < 0 ↔ vprof y < 0 :=
    ⟨hnegative hx hy, hnegative hy hx⟩
  simp only [profileSign, hsign]

end Grothe.UpperQuad.TwistProfileSign
