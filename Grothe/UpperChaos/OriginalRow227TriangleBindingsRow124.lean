import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow124

theorem block1536_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 124 (123 + i.val) = some (values1536[i.val]'(by rw [values1536_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row124_lookup _).trans (OriginalRow227TriangleLookupRow124.block1536_lookup i)

theorem block1536_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 124 (123 + i.val) = (values1536[i.val]'(by rw [values1536_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1536_lookup i)

theorem block1537_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 124 (155 + i.val) = some (values1537[i.val]'(by rw [values1537_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row124_lookup _).trans (OriginalRow227TriangleLookupRow124.block1537_lookup i)

theorem block1537_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 124 (155 + i.val) = (values1537[i.val]'(by rw [values1537_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1537_lookup i)

theorem block1538_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 124 (187 + i.val) = some (values1538[i.val]'(by rw [values1538_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row124_lookup _).trans (OriginalRow227TriangleLookupRow124.block1538_lookup i)

theorem block1538_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 124 (187 + i.val) = (values1538[i.val]'(by rw [values1538_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1538_lookup i)

theorem block1539_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 124 (219 + i.val) = some (values1539[i.val]'(by rw [values1539_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row124_lookup _).trans (OriginalRow227TriangleLookupRow124.block1539_lookup i)

theorem block1539_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 124 (219 + i.val) = (values1539[i.val]'(by rw [values1539_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1539_lookup i)

theorem block1540_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 124 (251 + i.val) = some (values1540[i.val]'(by rw [values1540_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row124_lookup _).trans (OriginalRow227TriangleLookupRow124.block1540_lookup i)

theorem block1540_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 124 (251 + i.val) = (values1540[i.val]'(by rw [values1540_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1540_lookup i)

theorem block1541_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 124 (283 + i.val) = some (values1541[i.val]'(by rw [values1541_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row124_lookup _).trans (OriginalRow227TriangleLookupRow124.block1541_lookup i)

theorem block1541_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 124 (283 + i.val) = (values1541[i.val]'(by rw [values1541_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1541_lookup i)

theorem block1542_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 124 (315 + i.val) = some (values1542[i.val]'(by rw [values1542_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row124_lookup _).trans (OriginalRow227TriangleLookupRow124.block1542_lookup i)

theorem block1542_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 124 (315 + i.val) = (values1542[i.val]'(by rw [values1542_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1542_lookup i)

theorem block1543_lookup (i : Fin 31) :
    OriginalRow227TriangleLookup.lookup 124 (347 + i.val) = some (values1543[i.val]'(by rw [values1543_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row124_lookup _).trans (OriginalRow227TriangleLookupRow124.block1543_lookup i)

theorem block1543_value (i : Fin 31) :
    OriginalRow227TriangleLookup.T 124 (347 + i.val) = (values1543[i.val]'(by rw [values1543_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1543_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124.block1536_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124.block1536_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124.block1537_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124.block1537_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124.block1538_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124.block1538_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124.block1539_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124.block1539_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124.block1540_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124.block1540_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124.block1541_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124.block1541_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124.block1542_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124.block1542_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124.block1543_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124.block1543_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124
