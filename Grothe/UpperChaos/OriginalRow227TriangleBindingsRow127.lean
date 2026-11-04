import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow127

theorem block1560_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 127 (126 + i.val) = some (values1560[i.val]'(by rw [values1560_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row127_lookup _).trans (OriginalRow227TriangleLookupRow127.block1560_lookup i)

theorem block1560_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 127 (126 + i.val) = (values1560[i.val]'(by rw [values1560_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1560_lookup i)

theorem block1561_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 127 (158 + i.val) = some (values1561[i.val]'(by rw [values1561_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row127_lookup _).trans (OriginalRow227TriangleLookupRow127.block1561_lookup i)

theorem block1561_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 127 (158 + i.val) = (values1561[i.val]'(by rw [values1561_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1561_lookup i)

theorem block1562_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 127 (190 + i.val) = some (values1562[i.val]'(by rw [values1562_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row127_lookup _).trans (OriginalRow227TriangleLookupRow127.block1562_lookup i)

theorem block1562_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 127 (190 + i.val) = (values1562[i.val]'(by rw [values1562_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1562_lookup i)

theorem block1563_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 127 (222 + i.val) = some (values1563[i.val]'(by rw [values1563_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row127_lookup _).trans (OriginalRow227TriangleLookupRow127.block1563_lookup i)

theorem block1563_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 127 (222 + i.val) = (values1563[i.val]'(by rw [values1563_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1563_lookup i)

theorem block1564_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 127 (254 + i.val) = some (values1564[i.val]'(by rw [values1564_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row127_lookup _).trans (OriginalRow227TriangleLookupRow127.block1564_lookup i)

theorem block1564_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 127 (254 + i.val) = (values1564[i.val]'(by rw [values1564_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1564_lookup i)

theorem block1565_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 127 (286 + i.val) = some (values1565[i.val]'(by rw [values1565_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row127_lookup _).trans (OriginalRow227TriangleLookupRow127.block1565_lookup i)

theorem block1565_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 127 (286 + i.val) = (values1565[i.val]'(by rw [values1565_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1565_lookup i)

theorem block1566_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 127 (318 + i.val) = some (values1566[i.val]'(by rw [values1566_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row127_lookup _).trans (OriginalRow227TriangleLookupRow127.block1566_lookup i)

theorem block1566_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 127 (318 + i.val) = (values1566[i.val]'(by rw [values1566_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1566_lookup i)

theorem block1567_lookup (i : Fin 25) :
    OriginalRow227TriangleLookup.lookup 127 (350 + i.val) = some (values1567[i.val]'(by rw [values1567_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row127_lookup _).trans (OriginalRow227TriangleLookupRow127.block1567_lookup i)

theorem block1567_value (i : Fin 25) :
    OriginalRow227TriangleLookup.T 127 (350 + i.val) = (values1567[i.val]'(by rw [values1567_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1567_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127.block1560_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127.block1560_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127.block1561_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127.block1561_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127.block1562_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127.block1562_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127.block1563_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127.block1563_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127.block1564_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127.block1564_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127.block1565_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127.block1565_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127.block1566_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127.block1566_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127.block1567_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127.block1567_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127
