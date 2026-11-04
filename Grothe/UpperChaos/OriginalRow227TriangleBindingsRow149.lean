import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow149

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow149

theorem block1727_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 149 (148 + i.val) = some (values1727[i.val]'(by rw [values1727_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row149_lookup _).trans (OriginalRow227TriangleLookupRow149.block1727_lookup i)

theorem block1727_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 149 (148 + i.val) = (values1727[i.val]'(by rw [values1727_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1727_lookup i)

theorem block1728_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 149 (180 + i.val) = some (values1728[i.val]'(by rw [values1728_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row149_lookup _).trans (OriginalRow227TriangleLookupRow149.block1728_lookup i)

theorem block1728_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 149 (180 + i.val) = (values1728[i.val]'(by rw [values1728_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1728_lookup i)

theorem block1729_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 149 (212 + i.val) = some (values1729[i.val]'(by rw [values1729_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row149_lookup _).trans (OriginalRow227TriangleLookupRow149.block1729_lookup i)

theorem block1729_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 149 (212 + i.val) = (values1729[i.val]'(by rw [values1729_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1729_lookup i)

theorem block1730_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 149 (244 + i.val) = some (values1730[i.val]'(by rw [values1730_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row149_lookup _).trans (OriginalRow227TriangleLookupRow149.block1730_lookup i)

theorem block1730_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 149 (244 + i.val) = (values1730[i.val]'(by rw [values1730_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1730_lookup i)

theorem block1731_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 149 (276 + i.val) = some (values1731[i.val]'(by rw [values1731_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row149_lookup _).trans (OriginalRow227TriangleLookupRow149.block1731_lookup i)

theorem block1731_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 149 (276 + i.val) = (values1731[i.val]'(by rw [values1731_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1731_lookup i)

theorem block1732_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 149 (308 + i.val) = some (values1732[i.val]'(by rw [values1732_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row149_lookup _).trans (OriginalRow227TriangleLookupRow149.block1732_lookup i)

theorem block1732_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 149 (308 + i.val) = (values1732[i.val]'(by rw [values1732_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1732_lookup i)

theorem block1733_lookup (i : Fin 13) :
    OriginalRow227TriangleLookup.lookup 149 (340 + i.val) = some (values1733[i.val]'(by rw [values1733_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row149_lookup _).trans (OriginalRow227TriangleLookupRow149.block1733_lookup i)

theorem block1733_value (i : Fin 13) :
    OriginalRow227TriangleLookup.T 149 (340 + i.val) = (values1733[i.val]'(by rw [values1733_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1733_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow149.block1727_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow149.block1727_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow149.block1728_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow149.block1728_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow149.block1729_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow149.block1729_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow149.block1730_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow149.block1730_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow149.block1731_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow149.block1731_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow149.block1732_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow149.block1732_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow149.block1733_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow149.block1733_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow149
