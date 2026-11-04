import Grothe.UpperChaos.ConditionalNodeIndices
import Grothe.UpperChaos.Q0ConditionalPairRankCheck

/-!
# Exact triangle coverage of the selected conditional modes

The selected set has `d ≤ 250` and `c ≤ d + 1`. Hence every selected
pair lies in the recurrence triangle `c ≤ d + 1`, `c + d < 502`.
The selected pair `(251,250)` attains total degree 501, so 502 is the
smallest strict total-degree cutoff covering the selection.

The final equality uses the production integer rank formula. It does not
expand the generated pair table or assert anything about saved coefficients.

Agent-ID: codex-aa04. Refs #293.
-/

namespace Grothe.UpperChaos.ConditionalSelectedTriangle

open ConditionalNodeIndices

/-- Coordinatewise bounds, attained simultaneously by `(251,250)`. -/
theorem coordinate_bounds {c d : ℕ} (h : (c, d) ∈ modes) :
    c ≤ 251 ∧ d ≤ 250 := by
  have hm := (mem_modes c d).mp h
  omega

/-- Every selected mode is in the full recurrence triangle at `M = 502`. -/
theorem mem_triangle {c d : ℕ} (h : (c, d) ∈ modes) :
    c ≤ d + 1 ∧ c + d < 502 := by
  have hm := (mem_modes c d).mp h
  omega

/-- The simultaneous maximal coordinates belong to the actual selection. -/
theorem max_selected : (251, 250) ∈ modes := by
  exact (mem_modes 251 250).mpr (by omega)

/-- The maximal total degree is attained only at the maximal selected pair. -/
theorem degree_eq_501_iff {c d : ℕ} (h : (c, d) ∈ modes) :
    c + d = 501 ↔ c = 251 ∧ d = 250 := by
  have hm := coordinate_bounds h
  omega

/-- Exact cutoff requirement for covering all selected total degrees. -/
theorem total_degree_bound_iff (M : ℕ) :
    (∀ c d, (c, d) ∈ modes → c + d < M) ↔ 502 ≤ M := by
  constructor
  · intro h
    have hm := h 251 250 max_selected
    omega
  · intro hM c d hm
    have ht := (mem_triangle hm).2
    omega

/-- Any predicate proved on the recurrence triangle covers the selection.
This adapter imposes no analytic or numerical assumptions of its own. -/
theorem predicate_on_selected (P : ℕ → ℕ → Prop)
    (htriangle : ∀ c d, c ≤ d + 1 → c + d < 502 → P c d) :
    ∀ c d, (c, d) ∈ modes → P c d := by
  intro c d hm
  have ht := mem_triangle hm
  exact htriangle c d ht.1 ht.2

/-- Exact zero-based production rank of the maximal selected pair. -/
theorem max_selected_rank : Q0ConditionalPairRankCheck.rank 251 250 = 35536 := by
  rfl

end Grothe.UpperChaos.ConditionalSelectedTriangle

/-- info: 'Grothe.UpperChaos.ConditionalSelectedTriangle.coordinate_bounds' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSelectedTriangle.coordinate_bounds

/-- info: 'Grothe.UpperChaos.ConditionalSelectedTriangle.mem_triangle' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSelectedTriangle.mem_triangle

/-- info: 'Grothe.UpperChaos.ConditionalSelectedTriangle.max_selected' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSelectedTriangle.max_selected

/-- info: 'Grothe.UpperChaos.ConditionalSelectedTriangle.degree_eq_501_iff' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSelectedTriangle.degree_eq_501_iff

/-- info: 'Grothe.UpperChaos.ConditionalSelectedTriangle.total_degree_bound_iff' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSelectedTriangle.total_degree_bound_iff

/-- info: 'Grothe.UpperChaos.ConditionalSelectedTriangle.predicate_on_selected' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSelectedTriangle.predicate_on_selected

/-- info: 'Grothe.UpperChaos.ConditionalSelectedTriangle.max_selected_rank' does not depend on any axioms -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalSelectedTriangle.max_selected_rank
