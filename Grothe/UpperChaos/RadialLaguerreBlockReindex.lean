import Grothe.UpperChaos.ConditionalNodeIndices
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Conditional block grades and charge prefixes

The actual conditional-coordinate block has grades d <= q < 251. Reindexing by
m = q - d gives a prefix of length 251 - d. Every charge k <= 251 has a maximal
prefix of length 251 - (k - 1); charges zero and one both have length 251.
No numerical operator bound is asserted.

Agent-ID: codex-8c4d. Refs #21.
-/

set_option warningAsError true

namespace Grothe.UpperChaos.RadialLaguerreBlockReindex

/-- Exactly the grades in a fixed conditional-coordinate block. -/
def BlockGrade (d : ℕ) := {q : ℕ // d ≤ q ∧ q < 251}

/-- The block is a prefix indexed by m = q - d. -/
def blockGradeEquiv (d : ℕ) :
    BlockGrade d ≃ Fin (251 - d) where
  toFun q := ⟨q.val - d, by have := q.property; omega⟩
  invFun m := ⟨d + m.val, by have := m.isLt; constructor <;> omega⟩
  left_inv q := by
    apply Subtype.ext
    have := q.property
    change d + (q.val - d) = q.val
    omega
  right_inv m := by
    apply Fin.ext
    change d + m.val - d = m.val
    omega

/-- No natural-subtraction truncation occurs on the canonical domain. -/
theorem primary_indices (q c d : ℕ) (hdq : d ≤ q) (hcd : c ≤ d + 1) :
    (q + 1 - c, q - d) = ((q - d) + (d + 1 - c), q - d) := by
  congr 1
  omega

/-- Every conditional pair has a nonnegative charge k at most 251. -/
theorem charge_bound (c d : ℕ)
    (h : (c, d) ∈ ConditionalNodeIndices.modes) : d + 1 - c ≤ 251 := by
  have := (ConditionalNodeIndices.mem_modes c d).mp h
  omega

/-- Longest prefix for a charge; k=0 and k=1 both have length 251. -/
def maxPrefixLength (k : ℕ) : ℕ := 251 - (k - 1)

theorem block_is_prefix (c d : ℕ)
    (h : (c, d) ∈ ConditionalNodeIndices.modes) :
    251 - d ≤ maxPrefixLength (d + 1 - c) := by
  have := (ConditionalNodeIndices.mem_modes c d).mp h
  unfold maxPrefixLength
  omega

/-- The longest block exists for each charge k <= 251, at d=k-1. -/
theorem maximal_pair (k : ℕ) (hk : k ≤ 251) :
    let d := k - 1
    let c := d + 1 - k
    (c, d) ∈ ConditionalNodeIndices.modes ∧ d + 1 - c = k := by
  dsimp
  rw [ConditionalNodeIndices.mem_modes]
  omega

end Grothe.UpperChaos.RadialLaguerreBlockReindex

open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.RadialLaguerreBlockReindex.BlockGrade,
      ``Grothe.UpperChaos.RadialLaguerreBlockReindex.blockGradeEquiv,
      ``Grothe.UpperChaos.RadialLaguerreBlockReindex.primary_indices,
      ``Grothe.UpperChaos.RadialLaguerreBlockReindex.charge_bound,
      ``Grothe.UpperChaos.RadialLaguerreBlockReindex.maxPrefixLength,
      ``Grothe.UpperChaos.RadialLaguerreBlockReindex.block_is_prefix,
      ``Grothe.UpperChaos.RadialLaguerreBlockReindex.maximal_pair] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
