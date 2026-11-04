import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow177

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow177

theorem block1897_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 177 (176 + i.val) = some (values1897[i.val]'(by rw [values1897_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row177_lookup _).trans (OriginalRow227TriangleLookupRow177.block1897_lookup i)

theorem block1897_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 177 (176 + i.val) = (values1897[i.val]'(by rw [values1897_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1897_lookup i)

theorem block1898_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 177 (208 + i.val) = some (values1898[i.val]'(by rw [values1898_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row177_lookup _).trans (OriginalRow227TriangleLookupRow177.block1898_lookup i)

theorem block1898_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 177 (208 + i.val) = (values1898[i.val]'(by rw [values1898_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1898_lookup i)

theorem block1899_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 177 (240 + i.val) = some (values1899[i.val]'(by rw [values1899_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row177_lookup _).trans (OriginalRow227TriangleLookupRow177.block1899_lookup i)

theorem block1899_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 177 (240 + i.val) = (values1899[i.val]'(by rw [values1899_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1899_lookup i)

theorem block1900_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 177 (272 + i.val) = some (values1900[i.val]'(by rw [values1900_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row177_lookup _).trans (OriginalRow227TriangleLookupRow177.block1900_lookup i)

theorem block1900_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 177 (272 + i.val) = (values1900[i.val]'(by rw [values1900_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1900_lookup i)

theorem block1901_lookup (i : Fin 21) :
    OriginalRow227TriangleLookup.lookup 177 (304 + i.val) = some (values1901[i.val]'(by rw [values1901_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row177_lookup _).trans (OriginalRow227TriangleLookupRow177.block1901_lookup i)

theorem block1901_value (i : Fin 21) :
    OriginalRow227TriangleLookup.T 177 (304 + i.val) = (values1901[i.val]'(by rw [values1901_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1901_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow177.block1897_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow177.block1897_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow177.block1898_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow177.block1898_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow177.block1899_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow177.block1899_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow177.block1900_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow177.block1900_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow177.block1901_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow177.block1901_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow177
