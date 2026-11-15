import Grothe.UpperChaos.PackedDyadicStructural
import Grothe.UpperChaos.LegacySingleCharacterSplit

/-! Transfer the pure standard-library delimiter theorem to the unchanged
public packed decoder. Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.PackedDyadic.Structural

/-- Transfer the unchanged public parser to the checked structural reader with
no delimiter or numeric hypotheses. -/
theorem parse_eq_row_unconditional (E : ℕ) (s : String) :
    parse E s = (row? E s.toList).map List.toArray := by
  exact parse_eq_row E s (legacy_split_tokens s ',')
    (fun r _ => legacy_split_tokens r ':')


end Grothe.UpperChaos.PackedDyadic.Structural

open Lean Elab Command
run_cmd do
  for ax in ← Lean.collectAxioms
      ``Grothe.UpperChaos.PackedDyadic.Structural.parse_eq_row_unconditional do
    unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
      throwError m!"legacy delimiter transfer has forbidden axiom {ax}"
