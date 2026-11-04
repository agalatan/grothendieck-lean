import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow185

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow185

theorem block1937_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 185 (184 + i.val) = some (values1937[i.val]'(by rw [values1937_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row185_lookup _).trans (OriginalRow227TriangleLookupRow185.block1937_lookup i)

theorem block1937_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 185 (184 + i.val) = (values1937[i.val]'(by rw [values1937_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1937_lookup i)

theorem block1938_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 185 (216 + i.val) = some (values1938[i.val]'(by rw [values1938_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row185_lookup _).trans (OriginalRow227TriangleLookupRow185.block1938_lookup i)

theorem block1938_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 185 (216 + i.val) = (values1938[i.val]'(by rw [values1938_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1938_lookup i)

theorem block1939_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 185 (248 + i.val) = some (values1939[i.val]'(by rw [values1939_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row185_lookup _).trans (OriginalRow227TriangleLookupRow185.block1939_lookup i)

theorem block1939_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 185 (248 + i.val) = (values1939[i.val]'(by rw [values1939_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1939_lookup i)

theorem block1940_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 185 (280 + i.val) = some (values1940[i.val]'(by rw [values1940_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row185_lookup _).trans (OriginalRow227TriangleLookupRow185.block1940_lookup i)

theorem block1940_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 185 (280 + i.val) = (values1940[i.val]'(by rw [values1940_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1940_lookup i)

theorem block1941_lookup (i : Fin 5) :
    OriginalRow227TriangleLookup.lookup 185 (312 + i.val) = some (values1941[i.val]'(by rw [values1941_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row185_lookup _).trans (OriginalRow227TriangleLookupRow185.block1941_lookup i)

theorem block1941_value (i : Fin 5) :
    OriginalRow227TriangleLookup.T 185 (312 + i.val) = (values1941[i.val]'(by rw [values1941_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1941_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow185.block1937_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow185.block1937_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow185.block1938_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow185.block1938_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow185.block1939_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow185.block1939_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow185.block1940_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow185.block1940_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow185.block1941_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow185.block1941_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow185
