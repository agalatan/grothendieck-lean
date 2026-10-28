import Grothe.UpperChaos.Q0FoldBatchedAlgebra
import Grothe.UpperChaos.Q0LiteralBinaryMerge_000
import Grothe.UpperChaos.Q0LiteralSourceData

/-! Binary grouped fold. This proof must itself be compiled. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.Q0LiteralBinaryFold
open GrotheKernel
open Grothe.UpperChaos
open Grothe.UpperChaos.Q0FoldBatchedAlgebra
open Grothe.UpperChaos.Q0LiteralSourceData
abbrev Dense := List (List (List Int))

def groups : List (List Dense) := [
  Q0LiteralFoldGroup_000.inputs,
  Q0LiteralFoldGroup_001.inputs,
  Q0LiteralFoldGroup_002.inputs,
  Q0LiteralFoldGroup_003.inputs,
  Q0LiteralFoldGroup_004.inputs,
  Q0LiteralFoldGroup_005.inputs,
  Q0LiteralFoldGroup_006.inputs,
  Q0LiteralFoldGroup_007.inputs,
  Q0LiteralFoldGroup_008.inputs,
  Q0LiteralFoldGroup_009.inputs,
  Q0LiteralFoldGroup_010.inputs,
  Q0LiteralFoldGroup_011.inputs,
  Q0LiteralFoldGroup_012.inputs,
  Q0LiteralFoldGroup_013.inputs,
  Q0LiteralFoldGroup_014.inputs,
  Q0LiteralFoldGroup_015.inputs,
  Q0LiteralFoldGroup_016.inputs,
  Q0LiteralFoldGroup_017.inputs,
  Q0LiteralFoldGroup_018.inputs,
  Q0LiteralFoldGroup_019.inputs,
  Q0LiteralFoldGroup_020.inputs
]

theorem add3_nil (a : Dense) : add3 a [] = a := by
  cases a <;> rfl

set_option maxRecDepth 65536 in
set_option maxHeartbeats 16000000 in
theorem fold_eq_literal : groups.flatten.foldr add3 [] = sourceCoefficients := by
  rw [foldr_flatten_batched]
  simp only [groups, List.map_cons, List.map_nil,
    Q0LiteralFoldGroup_000.fold_eq_literal,
    Q0LiteralFoldGroup_001.fold_eq_literal,
    Q0LiteralFoldGroup_002.fold_eq_literal,
    Q0LiteralFoldGroup_003.fold_eq_literal,
    Q0LiteralFoldGroup_004.fold_eq_literal,
    Q0LiteralFoldGroup_005.fold_eq_literal,
    Q0LiteralFoldGroup_006.fold_eq_literal,
    Q0LiteralFoldGroup_007.fold_eq_literal,
    Q0LiteralFoldGroup_008.fold_eq_literal,
    Q0LiteralFoldGroup_009.fold_eq_literal,
    Q0LiteralFoldGroup_010.fold_eq_literal,
    Q0LiteralFoldGroup_011.fold_eq_literal,
    Q0LiteralFoldGroup_012.fold_eq_literal,
    Q0LiteralFoldGroup_013.fold_eq_literal,
    Q0LiteralFoldGroup_014.fold_eq_literal,
    Q0LiteralFoldGroup_015.fold_eq_literal,
    Q0LiteralFoldGroup_016.fold_eq_literal,
    Q0LiteralFoldGroup_017.fold_eq_literal,
    Q0LiteralFoldGroup_018.fold_eq_literal,
    Q0LiteralFoldGroup_019.fold_eq_literal,
    Q0LiteralFoldGroup_020.fold_eq_literal]
  simp only [List.foldr_cons, List.foldr_nil, add3_nil]
  rw [Q0LiteralBinaryMerge_019.check]
  rw [Q0LiteralBinaryMerge_018.check]
  rw [Q0LiteralBinaryMerge_017.check]
  rw [Q0LiteralBinaryMerge_016.check]
  rw [Q0LiteralBinaryMerge_015.check]
  rw [Q0LiteralBinaryMerge_014.check]
  rw [Q0LiteralBinaryMerge_013.check]
  rw [Q0LiteralBinaryMerge_012.check]
  rw [Q0LiteralBinaryMerge_011.check]
  rw [Q0LiteralBinaryMerge_010.check]
  rw [Q0LiteralBinaryMerge_009.check]
  rw [Q0LiteralBinaryMerge_008.check]
  rw [Q0LiteralBinaryMerge_007.check]
  rw [Q0LiteralBinaryMerge_006.check]
  rw [Q0LiteralBinaryMerge_005.check]
  rw [Q0LiteralBinaryMerge_004.check]
  rw [Q0LiteralBinaryMerge_003.check]
  rw [Q0LiteralBinaryMerge_002.check]
  rw [Q0LiteralBinaryMerge_001.check]
  rw [Q0LiteralBinaryMerge_000.check]
  rfl

end Grothe.UpperChaos.Q0LiteralBinaryFold
