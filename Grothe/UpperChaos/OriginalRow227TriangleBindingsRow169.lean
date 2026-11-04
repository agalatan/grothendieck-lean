import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow169

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow169

theorem block1854_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 169 (168 + i.val) = some (values1854[i.val]'(by rw [values1854_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row169_lookup _).trans (OriginalRow227TriangleLookupRow169.block1854_lookup i)

theorem block1854_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 169 (168 + i.val) = (values1854[i.val]'(by rw [values1854_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1854_lookup i)

theorem block1855_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 169 (200 + i.val) = some (values1855[i.val]'(by rw [values1855_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row169_lookup _).trans (OriginalRow227TriangleLookupRow169.block1855_lookup i)

theorem block1855_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 169 (200 + i.val) = (values1855[i.val]'(by rw [values1855_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1855_lookup i)

theorem block1856_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 169 (232 + i.val) = some (values1856[i.val]'(by rw [values1856_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row169_lookup _).trans (OriginalRow227TriangleLookupRow169.block1856_lookup i)

theorem block1856_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 169 (232 + i.val) = (values1856[i.val]'(by rw [values1856_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1856_lookup i)

theorem block1857_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 169 (264 + i.val) = some (values1857[i.val]'(by rw [values1857_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row169_lookup _).trans (OriginalRow227TriangleLookupRow169.block1857_lookup i)

theorem block1857_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 169 (264 + i.val) = (values1857[i.val]'(by rw [values1857_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1857_lookup i)

theorem block1858_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 169 (296 + i.val) = some (values1858[i.val]'(by rw [values1858_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row169_lookup _).trans (OriginalRow227TriangleLookupRow169.block1858_lookup i)

theorem block1858_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 169 (296 + i.val) = (values1858[i.val]'(by rw [values1858_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1858_lookup i)

theorem block1859_lookup (i : Fin 5) :
    OriginalRow227TriangleLookup.lookup 169 (328 + i.val) = some (values1859[i.val]'(by rw [values1859_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row169_lookup _).trans (OriginalRow227TriangleLookupRow169.block1859_lookup i)

theorem block1859_value (i : Fin 5) :
    OriginalRow227TriangleLookup.T 169 (328 + i.val) = (values1859[i.val]'(by rw [values1859_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1859_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow169.block1854_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow169.block1854_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow169.block1855_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow169.block1855_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow169.block1856_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow169.block1856_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow169.block1857_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow169.block1857_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow169.block1858_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow169.block1858_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow169.block1859_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow169.block1859_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow169
