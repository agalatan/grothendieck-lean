import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow119

theorem block1491_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 119 (118 + i.val) = some (values1491[i.val]'(by rw [values1491_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row119_lookup _).trans (OriginalRow227TriangleLookupRow119.block1491_lookup i)

theorem block1491_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 119 (118 + i.val) = (values1491[i.val]'(by rw [values1491_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1491_lookup i)

theorem block1492_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 119 (150 + i.val) = some (values1492[i.val]'(by rw [values1492_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row119_lookup _).trans (OriginalRow227TriangleLookupRow119.block1492_lookup i)

theorem block1492_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 119 (150 + i.val) = (values1492[i.val]'(by rw [values1492_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1492_lookup i)

theorem block1493_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 119 (182 + i.val) = some (values1493[i.val]'(by rw [values1493_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row119_lookup _).trans (OriginalRow227TriangleLookupRow119.block1493_lookup i)

theorem block1493_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 119 (182 + i.val) = (values1493[i.val]'(by rw [values1493_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1493_lookup i)

theorem block1494_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 119 (214 + i.val) = some (values1494[i.val]'(by rw [values1494_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row119_lookup _).trans (OriginalRow227TriangleLookupRow119.block1494_lookup i)

theorem block1494_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 119 (214 + i.val) = (values1494[i.val]'(by rw [values1494_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1494_lookup i)

theorem block1495_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 119 (246 + i.val) = some (values1495[i.val]'(by rw [values1495_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row119_lookup _).trans (OriginalRow227TriangleLookupRow119.block1495_lookup i)

theorem block1495_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 119 (246 + i.val) = (values1495[i.val]'(by rw [values1495_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1495_lookup i)

theorem block1496_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 119 (278 + i.val) = some (values1496[i.val]'(by rw [values1496_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row119_lookup _).trans (OriginalRow227TriangleLookupRow119.block1496_lookup i)

theorem block1496_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 119 (278 + i.val) = (values1496[i.val]'(by rw [values1496_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1496_lookup i)

theorem block1497_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 119 (310 + i.val) = some (values1497[i.val]'(by rw [values1497_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row119_lookup _).trans (OriginalRow227TriangleLookupRow119.block1497_lookup i)

theorem block1497_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 119 (310 + i.val) = (values1497[i.val]'(by rw [values1497_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1497_lookup i)

theorem block1498_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 119 (342 + i.val) = some (values1498[i.val]'(by rw [values1498_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row119_lookup _).trans (OriginalRow227TriangleLookupRow119.block1498_lookup i)

theorem block1498_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 119 (342 + i.val) = (values1498[i.val]'(by rw [values1498_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1498_lookup i)

theorem block1499_lookup (i : Fin 9) :
    OriginalRow227TriangleLookup.lookup 119 (374 + i.val) = some (values1499[i.val]'(by rw [values1499_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row119_lookup _).trans (OriginalRow227TriangleLookupRow119.block1499_lookup i)

theorem block1499_value (i : Fin 9) :
    OriginalRow227TriangleLookup.T 119 (374 + i.val) = (values1499[i.val]'(by rw [values1499_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1499_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119.block1491_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119.block1491_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119.block1492_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119.block1492_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119.block1493_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119.block1493_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119.block1494_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119.block1494_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119.block1495_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119.block1495_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119.block1496_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119.block1496_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119.block1497_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119.block1497_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119.block1498_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119.block1498_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119.block1499_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119.block1499_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119
