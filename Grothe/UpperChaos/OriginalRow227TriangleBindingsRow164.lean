import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow164

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow164

theorem block1824_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 164 (163 + i.val) = some (values1824[i.val]'(by rw [values1824_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row164_lookup _).trans (OriginalRow227TriangleLookupRow164.block1824_lookup i)

theorem block1824_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 164 (163 + i.val) = (values1824[i.val]'(by rw [values1824_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1824_lookup i)

theorem block1825_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 164 (195 + i.val) = some (values1825[i.val]'(by rw [values1825_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row164_lookup _).trans (OriginalRow227TriangleLookupRow164.block1825_lookup i)

theorem block1825_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 164 (195 + i.val) = (values1825[i.val]'(by rw [values1825_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1825_lookup i)

theorem block1826_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 164 (227 + i.val) = some (values1826[i.val]'(by rw [values1826_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row164_lookup _).trans (OriginalRow227TriangleLookupRow164.block1826_lookup i)

theorem block1826_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 164 (227 + i.val) = (values1826[i.val]'(by rw [values1826_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1826_lookup i)

theorem block1827_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 164 (259 + i.val) = some (values1827[i.val]'(by rw [values1827_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row164_lookup _).trans (OriginalRow227TriangleLookupRow164.block1827_lookup i)

theorem block1827_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 164 (259 + i.val) = (values1827[i.val]'(by rw [values1827_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1827_lookup i)

theorem block1828_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 164 (291 + i.val) = some (values1828[i.val]'(by rw [values1828_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row164_lookup _).trans (OriginalRow227TriangleLookupRow164.block1828_lookup i)

theorem block1828_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 164 (291 + i.val) = (values1828[i.val]'(by rw [values1828_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1828_lookup i)

theorem block1829_lookup (i : Fin 15) :
    OriginalRow227TriangleLookup.lookup 164 (323 + i.val) = some (values1829[i.val]'(by rw [values1829_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row164_lookup _).trans (OriginalRow227TriangleLookupRow164.block1829_lookup i)

theorem block1829_value (i : Fin 15) :
    OriginalRow227TriangleLookup.T 164 (323 + i.val) = (values1829[i.val]'(by rw [values1829_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1829_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow164.block1824_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow164.block1824_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow164.block1825_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow164.block1825_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow164.block1826_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow164.block1826_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow164.block1827_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow164.block1827_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow164.block1828_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow164.block1828_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow164.block1829_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow164.block1829_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow164
