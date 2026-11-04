import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow174

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow174

theorem block1882_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 174 (173 + i.val) = some (values1882[i.val]'(by rw [values1882_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row174_lookup _).trans (OriginalRow227TriangleLookupRow174.block1882_lookup i)

theorem block1882_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 174 (173 + i.val) = (values1882[i.val]'(by rw [values1882_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1882_lookup i)

theorem block1883_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 174 (205 + i.val) = some (values1883[i.val]'(by rw [values1883_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row174_lookup _).trans (OriginalRow227TriangleLookupRow174.block1883_lookup i)

theorem block1883_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 174 (205 + i.val) = (values1883[i.val]'(by rw [values1883_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1883_lookup i)

theorem block1884_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 174 (237 + i.val) = some (values1884[i.val]'(by rw [values1884_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row174_lookup _).trans (OriginalRow227TriangleLookupRow174.block1884_lookup i)

theorem block1884_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 174 (237 + i.val) = (values1884[i.val]'(by rw [values1884_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1884_lookup i)

theorem block1885_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 174 (269 + i.val) = some (values1885[i.val]'(by rw [values1885_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row174_lookup _).trans (OriginalRow227TriangleLookupRow174.block1885_lookup i)

theorem block1885_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 174 (269 + i.val) = (values1885[i.val]'(by rw [values1885_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1885_lookup i)

theorem block1886_lookup (i : Fin 27) :
    OriginalRow227TriangleLookup.lookup 174 (301 + i.val) = some (values1886[i.val]'(by rw [values1886_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row174_lookup _).trans (OriginalRow227TriangleLookupRow174.block1886_lookup i)

theorem block1886_value (i : Fin 27) :
    OriginalRow227TriangleLookup.T 174 (301 + i.val) = (values1886[i.val]'(by rw [values1886_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1886_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow174.block1882_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow174.block1882_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow174.block1883_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow174.block1883_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow174.block1884_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow174.block1884_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow174.block1885_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow174.block1885_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow174.block1886_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow174.block1886_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow174
