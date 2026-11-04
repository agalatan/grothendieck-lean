import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow159

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow159

theorem block1794_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 159 (158 + i.val) = some (values1794[i.val]'(by rw [values1794_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row159_lookup _).trans (OriginalRow227TriangleLookupRow159.block1794_lookup i)

theorem block1794_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 159 (158 + i.val) = (values1794[i.val]'(by rw [values1794_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1794_lookup i)

theorem block1795_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 159 (190 + i.val) = some (values1795[i.val]'(by rw [values1795_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row159_lookup _).trans (OriginalRow227TriangleLookupRow159.block1795_lookup i)

theorem block1795_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 159 (190 + i.val) = (values1795[i.val]'(by rw [values1795_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1795_lookup i)

theorem block1796_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 159 (222 + i.val) = some (values1796[i.val]'(by rw [values1796_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row159_lookup _).trans (OriginalRow227TriangleLookupRow159.block1796_lookup i)

theorem block1796_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 159 (222 + i.val) = (values1796[i.val]'(by rw [values1796_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1796_lookup i)

theorem block1797_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 159 (254 + i.val) = some (values1797[i.val]'(by rw [values1797_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row159_lookup _).trans (OriginalRow227TriangleLookupRow159.block1797_lookup i)

theorem block1797_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 159 (254 + i.val) = (values1797[i.val]'(by rw [values1797_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1797_lookup i)

theorem block1798_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 159 (286 + i.val) = some (values1798[i.val]'(by rw [values1798_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row159_lookup _).trans (OriginalRow227TriangleLookupRow159.block1798_lookup i)

theorem block1798_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 159 (286 + i.val) = (values1798[i.val]'(by rw [values1798_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1798_lookup i)

theorem block1799_lookup (i : Fin 25) :
    OriginalRow227TriangleLookup.lookup 159 (318 + i.val) = some (values1799[i.val]'(by rw [values1799_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row159_lookup _).trans (OriginalRow227TriangleLookupRow159.block1799_lookup i)

theorem block1799_value (i : Fin 25) :
    OriginalRow227TriangleLookup.T 159 (318 + i.val) = (values1799[i.val]'(by rw [values1799_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1799_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow159.block1794_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow159.block1794_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow159.block1795_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow159.block1795_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow159.block1796_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow159.block1796_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow159.block1797_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow159.block1797_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow159.block1798_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow159.block1798_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow159.block1799_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow159.block1799_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow159
