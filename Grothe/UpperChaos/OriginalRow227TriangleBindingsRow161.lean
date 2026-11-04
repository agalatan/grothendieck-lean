import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow161

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow161

theorem block1806_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 161 (160 + i.val) = some (values1806[i.val]'(by rw [values1806_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row161_lookup _).trans (OriginalRow227TriangleLookupRow161.block1806_lookup i)

theorem block1806_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 161 (160 + i.val) = (values1806[i.val]'(by rw [values1806_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1806_lookup i)

theorem block1807_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 161 (192 + i.val) = some (values1807[i.val]'(by rw [values1807_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row161_lookup _).trans (OriginalRow227TriangleLookupRow161.block1807_lookup i)

theorem block1807_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 161 (192 + i.val) = (values1807[i.val]'(by rw [values1807_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1807_lookup i)

theorem block1808_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 161 (224 + i.val) = some (values1808[i.val]'(by rw [values1808_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row161_lookup _).trans (OriginalRow227TriangleLookupRow161.block1808_lookup i)

theorem block1808_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 161 (224 + i.val) = (values1808[i.val]'(by rw [values1808_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1808_lookup i)

theorem block1809_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 161 (256 + i.val) = some (values1809[i.val]'(by rw [values1809_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row161_lookup _).trans (OriginalRow227TriangleLookupRow161.block1809_lookup i)

theorem block1809_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 161 (256 + i.val) = (values1809[i.val]'(by rw [values1809_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1809_lookup i)

theorem block1810_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 161 (288 + i.val) = some (values1810[i.val]'(by rw [values1810_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row161_lookup _).trans (OriginalRow227TriangleLookupRow161.block1810_lookup i)

theorem block1810_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 161 (288 + i.val) = (values1810[i.val]'(by rw [values1810_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1810_lookup i)

theorem block1811_lookup (i : Fin 21) :
    OriginalRow227TriangleLookup.lookup 161 (320 + i.val) = some (values1811[i.val]'(by rw [values1811_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row161_lookup _).trans (OriginalRow227TriangleLookupRow161.block1811_lookup i)

theorem block1811_value (i : Fin 21) :
    OriginalRow227TriangleLookup.T 161 (320 + i.val) = (values1811[i.val]'(by rw [values1811_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1811_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow161.block1806_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow161.block1806_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow161.block1807_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow161.block1807_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow161.block1808_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow161.block1808_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow161.block1809_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow161.block1809_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow161.block1810_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow161.block1810_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow161.block1811_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow161.block1811_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow161
