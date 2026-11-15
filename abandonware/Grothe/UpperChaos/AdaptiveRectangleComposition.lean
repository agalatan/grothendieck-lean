import Grothe.UpperChaos.AdaptiveRectangleEnclosure

/-!
# Composition of certified midpoint subrectangles

An exact midpoint split combines two child integral certificates directly.
Continuity is required only on the closed parent rectangle, and every
integral retains the auxiliary-outside, radial-inside integration order.
This allows large adaptive trees to be checked through separate subtrees.

Agent-ID: codex-2ca4
-/

open LeanCert.Core

namespace Grothe.UpperChaos.AdaptiveRectanglePartition.Rect

/-- Local continuity suffices for the exact radial midpoint split. -/
theorem integral_splitS_of_continuousOn (r : Rect) (hr : r.Valid)
    (f : ℝ → ℝ → ℝ) (hf : ContinuousOn f.uncurry r.domain) :
    r.integral f = r.leftS.integral f + r.rightS.integral f := by
  simpa [SplitTree.leaves] using
    SplitTree.integral_eq_sum (.splitS .leaf .leaf) r hr f hf

/-- Local continuity suffices for the exact auxiliary midpoint split. -/
theorem integral_splitAux_of_continuousOn (r : Rect) (hr : r.Valid)
    (f : ℝ → ℝ → ℝ) (hf : ContinuousOn f.uncurry r.domain) :
    r.integral f = r.leftAux.integral f + r.rightAux.integral f := by
  simpa [SplitTree.leaves] using
    SplitTree.integral_eq_sum (.splitAux .leaf .leaf) r hr f hf

/-- Add two certified radial child intervals without expanding their leaves. -/
theorem integral_mem_add_splitS (r : Rect) (hr : r.Valid)
    (f : ℝ → ℝ → ℝ) (hf : ContinuousOn f.uncurry r.domain)
    {I J : IntervalRat} (hleft : r.leftS.integral f ∈ I)
    (hright : r.rightS.integral f ∈ J) :
    r.integral f ∈ IntervalRat.add I J := by
  rw [integral_splitS_of_continuousOn r hr f hf]
  exact IntervalRat.mem_add hleft hright

/-- Add two certified auxiliary child intervals without expanding their leaves. -/
theorem integral_mem_add_splitAux (r : Rect) (hr : r.Valid)
    (f : ℝ → ℝ → ℝ) (hf : ContinuousOn f.uncurry r.domain)
    {I J : IntervalRat} (hleft : r.leftAux.integral f ∈ I)
    (hright : r.rightAux.integral f ∈ J) :
    r.integral f ∈ IntervalRat.add I J := by
  rw [integral_splitAux_of_continuousOn r hr f hf]
  exact IntervalRat.mem_add hleft hright

end Grothe.UpperChaos.AdaptiveRectanglePartition.Rect
