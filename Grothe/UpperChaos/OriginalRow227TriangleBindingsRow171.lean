import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow171

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow171

theorem block1866_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 171 (170 + i.val) = some (values1866[i.val]'(by rw [values1866_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row171_lookup _).trans (OriginalRow227TriangleLookupRow171.block1866_lookup i)

theorem block1866_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 171 (170 + i.val) = (values1866[i.val]'(by rw [values1866_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1866_lookup i)

theorem block1867_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 171 (202 + i.val) = some (values1867[i.val]'(by rw [values1867_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row171_lookup _).trans (OriginalRow227TriangleLookupRow171.block1867_lookup i)

theorem block1867_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 171 (202 + i.val) = (values1867[i.val]'(by rw [values1867_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1867_lookup i)

theorem block1868_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 171 (234 + i.val) = some (values1868[i.val]'(by rw [values1868_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row171_lookup _).trans (OriginalRow227TriangleLookupRow171.block1868_lookup i)

theorem block1868_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 171 (234 + i.val) = (values1868[i.val]'(by rw [values1868_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1868_lookup i)

theorem block1869_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 171 (266 + i.val) = some (values1869[i.val]'(by rw [values1869_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row171_lookup _).trans (OriginalRow227TriangleLookupRow171.block1869_lookup i)

theorem block1869_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 171 (266 + i.val) = (values1869[i.val]'(by rw [values1869_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1869_lookup i)

theorem block1870_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 171 (298 + i.val) = some (values1870[i.val]'(by rw [values1870_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row171_lookup _).trans (OriginalRow227TriangleLookupRow171.block1870_lookup i)

theorem block1870_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 171 (298 + i.val) = (values1870[i.val]'(by rw [values1870_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1870_lookup i)

theorem block1871_lookup (i : Fin 1) :
    OriginalRow227TriangleLookup.lookup 171 (330 + i.val) = some (values1871[i.val]'(by rw [values1871_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row171_lookup _).trans (OriginalRow227TriangleLookupRow171.block1871_lookup i)

theorem block1871_value (i : Fin 1) :
    OriginalRow227TriangleLookup.T 171 (330 + i.val) = (values1871[i.val]'(by rw [values1871_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1871_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow171.block1866_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow171.block1866_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow171.block1867_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow171.block1867_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow171.block1868_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow171.block1868_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow171.block1869_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow171.block1869_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow171.block1870_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow171.block1870_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow171.block1871_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow171.block1871_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow171
