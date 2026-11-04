import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow175

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow175

theorem block1887_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 175 (174 + i.val) = some (values1887[i.val]'(by rw [values1887_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row175_lookup _).trans (OriginalRow227TriangleLookupRow175.block1887_lookup i)

theorem block1887_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 175 (174 + i.val) = (values1887[i.val]'(by rw [values1887_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1887_lookup i)

theorem block1888_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 175 (206 + i.val) = some (values1888[i.val]'(by rw [values1888_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row175_lookup _).trans (OriginalRow227TriangleLookupRow175.block1888_lookup i)

theorem block1888_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 175 (206 + i.val) = (values1888[i.val]'(by rw [values1888_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1888_lookup i)

theorem block1889_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 175 (238 + i.val) = some (values1889[i.val]'(by rw [values1889_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row175_lookup _).trans (OriginalRow227TriangleLookupRow175.block1889_lookup i)

theorem block1889_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 175 (238 + i.val) = (values1889[i.val]'(by rw [values1889_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1889_lookup i)

theorem block1890_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 175 (270 + i.val) = some (values1890[i.val]'(by rw [values1890_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row175_lookup _).trans (OriginalRow227TriangleLookupRow175.block1890_lookup i)

theorem block1890_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 175 (270 + i.val) = (values1890[i.val]'(by rw [values1890_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1890_lookup i)

theorem block1891_lookup (i : Fin 25) :
    OriginalRow227TriangleLookup.lookup 175 (302 + i.val) = some (values1891[i.val]'(by rw [values1891_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row175_lookup _).trans (OriginalRow227TriangleLookupRow175.block1891_lookup i)

theorem block1891_value (i : Fin 25) :
    OriginalRow227TriangleLookup.T 175 (302 + i.val) = (values1891[i.val]'(by rw [values1891_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1891_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow175.block1887_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow175.block1887_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow175.block1888_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow175.block1888_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow175.block1889_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow175.block1889_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow175.block1890_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow175.block1890_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow175.block1891_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow175.block1891_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow175
