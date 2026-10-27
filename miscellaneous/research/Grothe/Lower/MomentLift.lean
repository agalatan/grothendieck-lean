import Grothe.Lower.Moment

/-!
# Algebraic transport of a joint-moment node

Increasing the coefficient of `-u³+9u²-12` in an accepted radial cut changes its
majorant by the same polynomial. Thus a stronger budget can improve a node without
re-running the half-line majorant search. Acceptance of the stronger budget is still
required; this module only transports the pointwise inequality and its moment bound.
-/

namespace Grothe.Lower

/-- Lift the moment-cut weight by `d`; the argument of the physical polynomial is `√u`. -/
def MPoly.momentLift (p : MPoly) (d : ℚ) : MPoly :=
  ⟨p.a0 - 12 * d, p.a1, p.a2, p.a4 + 9 * d, p.a6 - d⟩

/-- Exact pointwise transport: the correction to the majorant equals the correction to the cut. -/
theorem MPoly.momentLift_eval (p : MPoly) (d : ℚ) (v : ℝ) :
    evalL (((p.momentLift d).list).map ((↑) : ℚ → ℝ)) v =
      evalL (p.list.map ((↑) : ℚ → ℝ)) v + (d : ℝ) * (-v ^ 6 + 9 * v ^ 4 - 12) := by
  simp only [MPoly.momentLift, MPoly.list, List.map_cons, List.map_nil, evalL]
  push_cast
  ring

/-- The scalar moment price decreases by `d C₆ x³`, exactly, at every normalized node. -/
theorem MPoly.momentLift_J (p : MPoly) (d : ℚ) (x : ℝ) :
    (p.momentLift d).J 0 1 x = p.J 0 1 x - (d : ℝ) * (C6 : ℝ) * x ^ 3 := by
  simp only [MPoly.momentLift, MPoly.J]
  push_cast
  ring

/-- The sixth coefficient remains admissible precisely when the lift does not exceed it. -/
theorem MPoly.momentLift_admissible (p : MPoly) (d : ℚ) (h1 : 0 ≤ p.a1) (h6 : d ≤ p.a6) :
    0 ≤ (p.momentLift d).a1 ∧ 0 ≤ (p.momentLift d).a6 := by
  exact ⟨h1, sub_nonneg.2 h6⟩

/-- A lifted cut needs no new pointwise majorant proof. -/
theorem MPoly.momentLift_majorant (p : MPoly) (d : ℚ) (Ψ G : ℝ → ℝ)
    (hp : ∀ v : ℝ, 0 ≤ v → Ψ v + G v ≤ evalL (p.list.map ((↑) : ℚ → ℝ)) v) :
    ∀ v : ℝ, 0 ≤ v → Ψ v + (G v + (d : ℝ) * (-v ^ 6 + 9 * v ^ 4 - 12)) ≤
      evalL (((p.momentLift d).list).map ((↑) : ℚ → ℝ)) v := by
  intro v hv
  rw [p.momentLift_eval]
  linarith [hp v hv]

end Grothe.Lower
