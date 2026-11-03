import Grothe.UpperChaos.Q0ConditionalMetadataAll
import Grothe.UpperChaos.Q0ConditionalRetention
import Grothe.UpperChaos.ConditionalNodeIndices
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Exact retained/omitted partition of the actual selected modes at each
original source address. No coefficient-error or payload assertion is made.
Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos.Q0ConditionalRetainedModes

open Grothe.UpperChaos.Q0GaussOrdinalEquiv
open Grothe.UpperChaos.ConditionalNodeIndices
open Grothe.UpperChaos.Q0ConditionalPairRankCheck

noncomputable section

def retainedModes (a : Address) : Finset (ℕ × ℕ) :=
  modes.filter (fun p => p.1 + p.2 ≤ (Q0ConditionalMetadataAll.rowAt a).cutoff)

def omittedModes (a : Address) : Finset (ℕ × ℕ) :=
  modes.filter (fun p => ¬ p.1 + p.2 ≤ (Q0ConditionalMetadataAll.rowAt a).cutoff)

/-- Every selected mode is accounted for exactly once at every source node. -/
theorem retained_union_omitted (a : Address) :
    retainedModes a ∪ omittedModes a = modes := by
  classical
  ext p
  simp only [retainedModes, omittedModes, Finset.mem_union, Finset.mem_filter]
  tauto

theorem retained_disjoint_omitted (a : Address) :
    Disjoint (retainedModes a) (omittedModes a) := by
  apply Finset.disjoint_left.mpr
  intro p hp hq
  have hp' := (Finset.mem_filter.mp hp).2
  have hq' := (Finset.mem_filter.mp hq).2
  exact hq' hp'

theorem retained_subset_modes (a : Address) : retainedModes a ⊆ modes := by
  intro p hp
  exact (Finset.mem_filter.mp hp).1

theorem omitted_subset_modes (a : Address) : omittedModes a ⊆ modes := by
  intro p hp
  exact (Finset.mem_filter.mp hp).1

/-- The retained mode set is exactly the original rank/offset test, on
the production selection rather than a prefix of that selection. -/
theorem retained_iff_rank (a : Address) (c d : ℕ) (hm : (c, d) ∈ modes) :
    (c, d) ∈ retainedModes a ↔
      rank c d < (Q0ConditionalMetadataAll.rowAt a).last -
        (Q0ConditionalMetadataAll.rowAt a).first := by
  have hb := storage_bounds hm
  have hlast := (Q0ConditionalMetadataAll.rowAt_spec a).2.2.2.1
  have hspan : (Q0ConditionalMetadataAll.rowAt a).last -
      (Q0ConditionalMetadataAll.rowAt a).first =
      Q0ConditionalMetadataCheck.pairPrefix
        (min (Q0ConditionalMetadataAll.rowAt a).cutoff 531 + 1) := by
    rw [hlast]
    omega
  have htest := Q0ConditionalRetention.retained_iff_degree_le_cutoff c d
    (Q0ConditionalMetadataAll.rowAt a).cutoff hb.1 hb.2.1 hb.2.2.1 hb.2.2.2
  rw [hspan, htest]
  simp [retainedModes, hm]

end
end Grothe.UpperChaos.Q0ConditionalRetainedModes

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0ConditionalRetainedModes.retained_union_omitted,
      ``Grothe.UpperChaos.Q0ConditionalRetainedModes.retained_disjoint_omitted,
      ``Grothe.UpperChaos.Q0ConditionalRetainedModes.retained_iff_rank] do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Conditional retained-mode audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
