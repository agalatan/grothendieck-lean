import Grothe.UpperChaos.Q0ConditionalMetadataCheck
import Grothe.UpperChaos.Q0ConditionalPairRankCheck
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! The original degree-531 storage is ordered by total degree. A node's
cutoff selects a prefix in that order; this does not say that the smaller
degree-501 set of production modes is itself a prefix. These are finite
index facts only, not numerical coefficient estimates. Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos.Q0ConditionalRetention

open Grothe.UpperChaos.Q0ConditionalMetadataCheck
open Grothe.UpperChaos.Q0ConditionalPairRankCheck

set_option maxRecDepth 8192 in
set_option maxHeartbeats 4000000 in
theorem degreeCount_pos_checked :
    (List.range 532).all (fun m => decide (0 < degreeCount m)) = true := by
  decide +kernel

theorem degreeCount_pos (m : ℕ) (hm : m < 532) : 0 < degreeCount m := by
  exact of_decide_eq_true
    ((List.all_eq_true.mp degreeCount_pos_checked) m (List.mem_range.mpr hm))

/-- Prefix counts are strictly increasing through the complete stored
degree range, including its final endpoint 532. -/
theorem prefix_strict {m n : ℕ} (hmn : m < n) (hn : n ≤ 532) :
    pairPrefix m < pairPrefix n := by
  induction n generalizing m with
  | zero => omega
  | succ n ih =>
    by_cases heq : m = n
    · subst m
      have hs := prefix_increment n (by omega)
      have hp := degreeCount_pos n (by omega)
      omega
    · have hs := prefix_increment n (by omega)
      have hp := degreeCount_pos n (by omega)
      have hi := ih (m := m) (by omega) (by omega)
      omega

/-- A canonical pair's rank lies in the block for its total degree. -/
theorem rank_between (c d : ℕ) (hc : c ≤ 266) (hd : d ≤ 265)
    (hcanonical : c ≤ d + 1) (hdegree : c + d ≤ 531) :
    pairPrefix (c + d) ≤ rank c d ∧ rank c d < pairPrefix (c + d + 1) := by
  have hlo : c + d - 265 ≤ c := by omega
  have hhi : c ≤ min 266 (min (c + d) ((c + d + 1) / 2)) := by
    apply le_min hc
    apply le_min (by omega)
    omega
  have hoff : c - (c + d - 265) < degreeCount (c + d) := by
    unfold degreeCount
    omega
  have hstep := prefix_increment (c + d) (by omega)
  have hrank : rank c d = pairPrefix (c + d) + c - (c + d - 265) := by rfl
  omega

/-- The exact rank test is equivalent to the saved total-degree cutoff.
The special cutoff 532 includes all stored degrees 0 through 531. -/
theorem retained_iff_degree_le_cutoff (c d cutoff : ℕ)
    (hc : c ≤ 266) (hd : d ≤ 265) (hcanonical : c ≤ d + 1)
    (hdegree : c + d ≤ 531) :
    rank c d < pairPrefix (min cutoff 531 + 1) ↔ c + d ≤ cutoff := by
  have hb := rank_between c d hc hd hcanonical hdegree
  have htmax : min cutoff 531 + 1 ≤ 532 := by
    have h := Nat.min_le_right cutoff 531
    omega
  have ht : c + d < min cutoff 531 + 1 ↔ c + d ≤ cutoff := by
    by_cases h : cutoff ≤ 531
    · simp only [min_eq_left h]
      omega
    · have h' : 531 ≤ cutoff := by omega
      simp only [min_eq_right h']
      omega
  rw [← ht]
  constructor
  · intro hr
    by_contra h
    have hle : min cutoff 531 + 1 ≤ c + d := by omega
    have hp : pairPrefix (min cutoff 531 + 1) ≤ pairPrefix (c + d) := by
      by_cases heq : min cutoff 531 + 1 = c + d
      · rw [heq]
      · exact le_of_lt (prefix_strict (by omega) (by omega))
    omega
  · intro hm
    have hp : pairPrefix (c + d + 1) ≤ pairPrefix (min cutoff 531 + 1) := by
      by_cases heq : c + d + 1 = min cutoff 531 + 1
      · rw [heq]
      · exact le_of_lt (prefix_strict (by omega) (by omega))
    omega

end Grothe.UpperChaos.Q0ConditionalRetention

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0ConditionalRetention.degreeCount_pos,
      ``Grothe.UpperChaos.Q0ConditionalRetention.prefix_strict,
      ``Grothe.UpperChaos.Q0ConditionalRetention.rank_between,
      ``Grothe.UpperChaos.Q0ConditionalRetention.retained_iff_degree_le_cutoff] do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Conditional retention audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
