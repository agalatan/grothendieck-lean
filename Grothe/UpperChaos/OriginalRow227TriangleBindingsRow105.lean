import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow105

theorem block1362_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 105 (104 + i.val) = some (values1362[i.val]'(by rw [values1362_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row105_lookup _).trans (OriginalRow227TriangleLookupRow105.block1362_lookup i)

theorem block1362_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 105 (104 + i.val) = (values1362[i.val]'(by rw [values1362_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1362_lookup i)

theorem block1363_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 105 (136 + i.val) = some (values1363[i.val]'(by rw [values1363_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row105_lookup _).trans (OriginalRow227TriangleLookupRow105.block1363_lookup i)

theorem block1363_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 105 (136 + i.val) = (values1363[i.val]'(by rw [values1363_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1363_lookup i)

theorem block1364_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 105 (168 + i.val) = some (values1364[i.val]'(by rw [values1364_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row105_lookup _).trans (OriginalRow227TriangleLookupRow105.block1364_lookup i)

theorem block1364_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 105 (168 + i.val) = (values1364[i.val]'(by rw [values1364_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1364_lookup i)

theorem block1365_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 105 (200 + i.val) = some (values1365[i.val]'(by rw [values1365_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row105_lookup _).trans (OriginalRow227TriangleLookupRow105.block1365_lookup i)

theorem block1365_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 105 (200 + i.val) = (values1365[i.val]'(by rw [values1365_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1365_lookup i)

theorem block1366_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 105 (232 + i.val) = some (values1366[i.val]'(by rw [values1366_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row105_lookup _).trans (OriginalRow227TriangleLookupRow105.block1366_lookup i)

theorem block1366_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 105 (232 + i.val) = (values1366[i.val]'(by rw [values1366_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1366_lookup i)

theorem block1367_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 105 (264 + i.val) = some (values1367[i.val]'(by rw [values1367_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row105_lookup _).trans (OriginalRow227TriangleLookupRow105.block1367_lookup i)

theorem block1367_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 105 (264 + i.val) = (values1367[i.val]'(by rw [values1367_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1367_lookup i)

theorem block1368_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 105 (296 + i.val) = some (values1368[i.val]'(by rw [values1368_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row105_lookup _).trans (OriginalRow227TriangleLookupRow105.block1368_lookup i)

theorem block1368_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 105 (296 + i.val) = (values1368[i.val]'(by rw [values1368_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1368_lookup i)

theorem block1369_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 105 (328 + i.val) = some (values1369[i.val]'(by rw [values1369_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row105_lookup _).trans (OriginalRow227TriangleLookupRow105.block1369_lookup i)

theorem block1369_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 105 (328 + i.val) = (values1369[i.val]'(by rw [values1369_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1369_lookup i)

theorem block1370_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 105 (360 + i.val) = some (values1370[i.val]'(by rw [values1370_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row105_lookup _).trans (OriginalRow227TriangleLookupRow105.block1370_lookup i)

theorem block1370_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 105 (360 + i.val) = (values1370[i.val]'(by rw [values1370_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1370_lookup i)

theorem block1371_lookup (i : Fin 5) :
    OriginalRow227TriangleLookup.lookup 105 (392 + i.val) = some (values1371[i.val]'(by rw [values1371_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row105_lookup _).trans (OriginalRow227TriangleLookupRow105.block1371_lookup i)

theorem block1371_value (i : Fin 5) :
    OriginalRow227TriangleLookup.T 105 (392 + i.val) = (values1371[i.val]'(by rw [values1371_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1371_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1362_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1362_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1363_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1363_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1364_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1364_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1365_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1365_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1366_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1366_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1367_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1367_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1368_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1368_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1369_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1369_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1370_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1370_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1371_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105.block1371_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow105
