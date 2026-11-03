import Grothe.UpperChaos.PackedDyadicChunks
import Init.Data.Array.Monadic
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
Composition of bounded certificates for the actual public packed decoder.
The input arrays and parser are not replaced. These lemmas assemble successful
chunk checks; the individual source checks remain separate obligations.
Agent-ID: codex-8c4d.
-/

namespace Grothe.UpperChaos.PackedDyadic.SourceAssembly

set_option maxHeartbeats 1000000

theorem fold_append_acc (xs : Array (Array ℤ)) (acc : Array ℤ) :
    xs.foldl (fun a b => a ++ b) acc =
      acc ++ xs.foldl (fun a b => a ++ b) #[] := by
  rw [← Array.foldl_toList, ← Array.foldl_toList]
  generalize xs.toList = rows
  induction rows generalizing acc with
  | nil => simp
  | cons row rows ih =>
      simp only [List.foldl_cons]
      rw [ih (acc ++ row), ih (#[] ++ row)]
      simp only [Array.empty_append, Array.append_assoc]

theorem fold_append (xs ys : Array (Array ℤ)) :
    (xs ++ ys).foldl (fun a b => a ++ b) #[] =
      xs.foldl (fun a b => a ++ b) #[] ++ ys.foldl (fun a b => a ++ b) #[] := by
  rw [Array.foldl_append, fold_append_acc]

/-- Parsing combined source arrays is equivalent to checking both arrays first. -/
theorem parseChunks_append (E : ℕ) (xs ys : Array String) :
    parseChunks E (xs ++ ys) = (do
      let a ← parseChunks E xs
      let b ← parseChunks E ys
      pure (a ++ b)) := by
  simp only [parseChunks, Array.mapM_append]
  cases hx : xs.mapM (parse E) <;> cases hy : ys.mapM (parse E) <;>
    simp [hx, hy, fold_append]

theorem parseChunks_append_of_eq (E : ℕ) (xs ys : Array String) (a b : Array ℤ)
    (hx : parseChunks E xs = some a) (hy : parseChunks E ys = some b) :
    parseChunks E (xs ++ ys) = some (a ++ b) := by
  simpa [hx, hy] using parseChunks_append E xs ys

theorem parseChunks_singleton (E : ℕ) (s : String) :
    parseChunks E #[s] = parse E s := by
  simp only [parseChunks, Array.mapM_eq_mapM_toList]
  cases h : parse E s <;> simp [h]

end Grothe.UpperChaos.PackedDyadic.SourceAssembly

open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.PackedDyadic.SourceAssembly.fold_append_acc,
      ``Grothe.UpperChaos.PackedDyadic.SourceAssembly.fold_append,
      ``Grothe.UpperChaos.PackedDyadic.SourceAssembly.parseChunks_append,
      ``Grothe.UpperChaos.PackedDyadic.SourceAssembly.parseChunks_append_of_eq,
      ``Grothe.UpperChaos.PackedDyadic.SourceAssembly.parseChunks_singleton] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
