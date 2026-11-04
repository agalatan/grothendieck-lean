import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow191

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow191

theorem block1964_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 191 (190 + i.val) = some (values1964[i.val]'(by rw [values1964_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row191_lookup _).trans (OriginalRow227TriangleLookupRow191.block1964_lookup i)

theorem block1964_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 191 (190 + i.val) = (values1964[i.val]'(by rw [values1964_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1964_lookup i)

theorem block1965_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 191 (222 + i.val) = some (values1965[i.val]'(by rw [values1965_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row191_lookup _).trans (OriginalRow227TriangleLookupRow191.block1965_lookup i)

theorem block1965_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 191 (222 + i.val) = (values1965[i.val]'(by rw [values1965_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1965_lookup i)

theorem block1966_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 191 (254 + i.val) = some (values1966[i.val]'(by rw [values1966_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row191_lookup _).trans (OriginalRow227TriangleLookupRow191.block1966_lookup i)

theorem block1966_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 191 (254 + i.val) = (values1966[i.val]'(by rw [values1966_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1966_lookup i)

theorem block1967_lookup (i : Fin 25) :
    OriginalRow227TriangleLookup.lookup 191 (286 + i.val) = some (values1967[i.val]'(by rw [values1967_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row191_lookup _).trans (OriginalRow227TriangleLookupRow191.block1967_lookup i)

theorem block1967_value (i : Fin 25) :
    OriginalRow227TriangleLookup.T 191 (286 + i.val) = (values1967[i.val]'(by rw [values1967_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1967_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow191.block1964_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow191.block1964_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow191.block1965_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow191.block1965_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow191.block1966_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow191.block1966_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow191.block1967_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow191.block1967_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow191
