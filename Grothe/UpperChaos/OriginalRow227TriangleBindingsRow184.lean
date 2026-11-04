import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow184

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow184

theorem block1932_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 184 (183 + i.val) = some (values1932[i.val]'(by rw [values1932_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row184_lookup _).trans (OriginalRow227TriangleLookupRow184.block1932_lookup i)

theorem block1932_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 184 (183 + i.val) = (values1932[i.val]'(by rw [values1932_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1932_lookup i)

theorem block1933_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 184 (215 + i.val) = some (values1933[i.val]'(by rw [values1933_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row184_lookup _).trans (OriginalRow227TriangleLookupRow184.block1933_lookup i)

theorem block1933_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 184 (215 + i.val) = (values1933[i.val]'(by rw [values1933_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1933_lookup i)

theorem block1934_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 184 (247 + i.val) = some (values1934[i.val]'(by rw [values1934_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row184_lookup _).trans (OriginalRow227TriangleLookupRow184.block1934_lookup i)

theorem block1934_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 184 (247 + i.val) = (values1934[i.val]'(by rw [values1934_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1934_lookup i)

theorem block1935_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 184 (279 + i.val) = some (values1935[i.val]'(by rw [values1935_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row184_lookup _).trans (OriginalRow227TriangleLookupRow184.block1935_lookup i)

theorem block1935_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 184 (279 + i.val) = (values1935[i.val]'(by rw [values1935_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1935_lookup i)

theorem block1936_lookup (i : Fin 7) :
    OriginalRow227TriangleLookup.lookup 184 (311 + i.val) = some (values1936[i.val]'(by rw [values1936_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row184_lookup _).trans (OriginalRow227TriangleLookupRow184.block1936_lookup i)

theorem block1936_value (i : Fin 7) :
    OriginalRow227TriangleLookup.T 184 (311 + i.val) = (values1936[i.val]'(by rw [values1936_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1936_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow184.block1932_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow184.block1932_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow184.block1933_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow184.block1933_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow184.block1934_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow184.block1934_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow184.block1935_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow184.block1935_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow184.block1936_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow184.block1936_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow184
