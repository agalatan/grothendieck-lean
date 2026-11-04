import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow196

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow196

theorem block1984_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 196 (195 + i.val) = some (values1984[i.val]'(by rw [values1984_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row196_lookup _).trans (OriginalRow227TriangleLookupRow196.block1984_lookup i)

theorem block1984_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 196 (195 + i.val) = (values1984[i.val]'(by rw [values1984_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1984_lookup i)

theorem block1985_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 196 (227 + i.val) = some (values1985[i.val]'(by rw [values1985_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row196_lookup _).trans (OriginalRow227TriangleLookupRow196.block1985_lookup i)

theorem block1985_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 196 (227 + i.val) = (values1985[i.val]'(by rw [values1985_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1985_lookup i)

theorem block1986_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 196 (259 + i.val) = some (values1986[i.val]'(by rw [values1986_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row196_lookup _).trans (OriginalRow227TriangleLookupRow196.block1986_lookup i)

theorem block1986_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 196 (259 + i.val) = (values1986[i.val]'(by rw [values1986_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1986_lookup i)

theorem block1987_lookup (i : Fin 15) :
    OriginalRow227TriangleLookup.lookup 196 (291 + i.val) = some (values1987[i.val]'(by rw [values1987_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row196_lookup _).trans (OriginalRow227TriangleLookupRow196.block1987_lookup i)

theorem block1987_value (i : Fin 15) :
    OriginalRow227TriangleLookup.T 196 (291 + i.val) = (values1987[i.val]'(by rw [values1987_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1987_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow196.block1984_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow196.block1984_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow196.block1985_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow196.block1985_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow196.block1986_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow196.block1986_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow196.block1987_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow196.block1987_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow196
