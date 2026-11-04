import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow000

theorem block0000_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 0 (0 + i.val) = some (values0000[i.val]'(by rw [values0000_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row000_lookup _).trans (OriginalRow227TriangleLookupRow000.block0000_lookup i)

theorem block0000_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 0 (0 + i.val) = (values0000[i.val]'(by rw [values0000_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0000_lookup i)

theorem block0001_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 0 (32 + i.val) = some (values0001[i.val]'(by rw [values0001_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row000_lookup _).trans (OriginalRow227TriangleLookupRow000.block0001_lookup i)

theorem block0001_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 0 (32 + i.val) = (values0001[i.val]'(by rw [values0001_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0001_lookup i)

theorem block0002_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 0 (64 + i.val) = some (values0002[i.val]'(by rw [values0002_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row000_lookup _).trans (OriginalRow227TriangleLookupRow000.block0002_lookup i)

theorem block0002_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 0 (64 + i.val) = (values0002[i.val]'(by rw [values0002_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0002_lookup i)

theorem block0003_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 0 (96 + i.val) = some (values0003[i.val]'(by rw [values0003_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row000_lookup _).trans (OriginalRow227TriangleLookupRow000.block0003_lookup i)

theorem block0003_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 0 (96 + i.val) = (values0003[i.val]'(by rw [values0003_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0003_lookup i)

theorem block0004_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 0 (128 + i.val) = some (values0004[i.val]'(by rw [values0004_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row000_lookup _).trans (OriginalRow227TriangleLookupRow000.block0004_lookup i)

theorem block0004_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 0 (128 + i.val) = (values0004[i.val]'(by rw [values0004_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0004_lookup i)

theorem block0005_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 0 (160 + i.val) = some (values0005[i.val]'(by rw [values0005_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row000_lookup _).trans (OriginalRow227TriangleLookupRow000.block0005_lookup i)

theorem block0005_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 0 (160 + i.val) = (values0005[i.val]'(by rw [values0005_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0005_lookup i)

theorem block0006_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 0 (192 + i.val) = some (values0006[i.val]'(by rw [values0006_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row000_lookup _).trans (OriginalRow227TriangleLookupRow000.block0006_lookup i)

theorem block0006_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 0 (192 + i.val) = (values0006[i.val]'(by rw [values0006_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0006_lookup i)

theorem block0007_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 0 (224 + i.val) = some (values0007[i.val]'(by rw [values0007_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row000_lookup _).trans (OriginalRow227TriangleLookupRow000.block0007_lookup i)

theorem block0007_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 0 (224 + i.val) = (values0007[i.val]'(by rw [values0007_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0007_lookup i)

theorem block0008_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 0 (256 + i.val) = some (values0008[i.val]'(by rw [values0008_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row000_lookup _).trans (OriginalRow227TriangleLookupRow000.block0008_lookup i)

theorem block0008_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 0 (256 + i.val) = (values0008[i.val]'(by rw [values0008_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0008_lookup i)

theorem block0009_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 0 (288 + i.val) = some (values0009[i.val]'(by rw [values0009_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row000_lookup _).trans (OriginalRow227TriangleLookupRow000.block0009_lookup i)

theorem block0009_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 0 (288 + i.val) = (values0009[i.val]'(by rw [values0009_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0009_lookup i)

theorem block0010_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 0 (320 + i.val) = some (values0010[i.val]'(by rw [values0010_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row000_lookup _).trans (OriginalRow227TriangleLookupRow000.block0010_lookup i)

theorem block0010_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 0 (320 + i.val) = (values0010[i.val]'(by rw [values0010_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0010_lookup i)

theorem block0011_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 0 (352 + i.val) = some (values0011[i.val]'(by rw [values0011_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row000_lookup _).trans (OriginalRow227TriangleLookupRow000.block0011_lookup i)

theorem block0011_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 0 (352 + i.val) = (values0011[i.val]'(by rw [values0011_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0011_lookup i)

theorem block0012_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 0 (384 + i.val) = some (values0012[i.val]'(by rw [values0012_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row000_lookup _).trans (OriginalRow227TriangleLookupRow000.block0012_lookup i)

theorem block0012_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 0 (384 + i.val) = (values0012[i.val]'(by rw [values0012_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0012_lookup i)

theorem block0013_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 0 (416 + i.val) = some (values0013[i.val]'(by rw [values0013_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row000_lookup _).trans (OriginalRow227TriangleLookupRow000.block0013_lookup i)

theorem block0013_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 0 (416 + i.val) = (values0013[i.val]'(by rw [values0013_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0013_lookup i)

theorem block0014_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 0 (448 + i.val) = some (values0014[i.val]'(by rw [values0014_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row000_lookup _).trans (OriginalRow227TriangleLookupRow000.block0014_lookup i)

theorem block0014_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 0 (448 + i.val) = (values0014[i.val]'(by rw [values0014_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0014_lookup i)

theorem block0015_lookup (i : Fin 22) :
    OriginalRow227TriangleLookup.lookup 0 (480 + i.val) = some (values0015[i.val]'(by rw [values0015_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row000_lookup _).trans (OriginalRow227TriangleLookupRow000.block0015_lookup i)

theorem block0015_value (i : Fin 22) :
    OriginalRow227TriangleLookup.T 0 (480 + i.val) = (values0015[i.val]'(by rw [values0015_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0015_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0000_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0000_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0001_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0001_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0002_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0002_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0003_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0003_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0004_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0004_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0005_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0005_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0006_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0006_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0007_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0007_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0008_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0008_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0009_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0009_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0010_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0010_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0011_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0011_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0012_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0012_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0013_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0013_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0014_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0014_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0015_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000.block0015_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000
