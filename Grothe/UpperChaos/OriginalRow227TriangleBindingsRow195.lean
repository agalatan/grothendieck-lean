import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow195

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow195

theorem block1980_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 195 (194 + i.val) = some (values1980[i.val]'(by rw [values1980_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row195_lookup _).trans (OriginalRow227TriangleLookupRow195.block1980_lookup i)

theorem block1980_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 195 (194 + i.val) = (values1980[i.val]'(by rw [values1980_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1980_lookup i)

theorem block1981_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 195 (226 + i.val) = some (values1981[i.val]'(by rw [values1981_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row195_lookup _).trans (OriginalRow227TriangleLookupRow195.block1981_lookup i)

theorem block1981_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 195 (226 + i.val) = (values1981[i.val]'(by rw [values1981_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1981_lookup i)

theorem block1982_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 195 (258 + i.val) = some (values1982[i.val]'(by rw [values1982_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row195_lookup _).trans (OriginalRow227TriangleLookupRow195.block1982_lookup i)

theorem block1982_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 195 (258 + i.val) = (values1982[i.val]'(by rw [values1982_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1982_lookup i)

theorem block1983_lookup (i : Fin 17) :
    OriginalRow227TriangleLookup.lookup 195 (290 + i.val) = some (values1983[i.val]'(by rw [values1983_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row195_lookup _).trans (OriginalRow227TriangleLookupRow195.block1983_lookup i)

theorem block1983_value (i : Fin 17) :
    OriginalRow227TriangleLookup.T 195 (290 + i.val) = (values1983[i.val]'(by rw [values1983_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1983_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow195.block1980_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow195.block1980_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow195.block1981_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow195.block1981_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow195.block1982_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow195.block1982_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow195.block1983_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow195.block1983_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow195
