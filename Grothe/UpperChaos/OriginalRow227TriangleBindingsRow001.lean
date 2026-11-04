import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow001

theorem block0016_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 1 (0 + i.val) = some (values0016[i.val]'(by rw [values0016_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row001_lookup _).trans (OriginalRow227TriangleLookupRow001.block0016_lookup i)

theorem block0016_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 1 (0 + i.val) = (values0016[i.val]'(by rw [values0016_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0016_lookup i)

theorem block0017_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 1 (32 + i.val) = some (values0017[i.val]'(by rw [values0017_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row001_lookup _).trans (OriginalRow227TriangleLookupRow001.block0017_lookup i)

theorem block0017_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 1 (32 + i.val) = (values0017[i.val]'(by rw [values0017_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0017_lookup i)

theorem block0018_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 1 (64 + i.val) = some (values0018[i.val]'(by rw [values0018_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row001_lookup _).trans (OriginalRow227TriangleLookupRow001.block0018_lookup i)

theorem block0018_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 1 (64 + i.val) = (values0018[i.val]'(by rw [values0018_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0018_lookup i)

theorem block0019_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 1 (96 + i.val) = some (values0019[i.val]'(by rw [values0019_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row001_lookup _).trans (OriginalRow227TriangleLookupRow001.block0019_lookup i)

theorem block0019_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 1 (96 + i.val) = (values0019[i.val]'(by rw [values0019_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0019_lookup i)

theorem block0020_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 1 (128 + i.val) = some (values0020[i.val]'(by rw [values0020_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row001_lookup _).trans (OriginalRow227TriangleLookupRow001.block0020_lookup i)

theorem block0020_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 1 (128 + i.val) = (values0020[i.val]'(by rw [values0020_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0020_lookup i)

theorem block0021_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 1 (160 + i.val) = some (values0021[i.val]'(by rw [values0021_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row001_lookup _).trans (OriginalRow227TriangleLookupRow001.block0021_lookup i)

theorem block0021_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 1 (160 + i.val) = (values0021[i.val]'(by rw [values0021_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0021_lookup i)

theorem block0022_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 1 (192 + i.val) = some (values0022[i.val]'(by rw [values0022_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row001_lookup _).trans (OriginalRow227TriangleLookupRow001.block0022_lookup i)

theorem block0022_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 1 (192 + i.val) = (values0022[i.val]'(by rw [values0022_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0022_lookup i)

theorem block0023_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 1 (224 + i.val) = some (values0023[i.val]'(by rw [values0023_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row001_lookup _).trans (OriginalRow227TriangleLookupRow001.block0023_lookup i)

theorem block0023_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 1 (224 + i.val) = (values0023[i.val]'(by rw [values0023_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0023_lookup i)

theorem block0024_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 1 (256 + i.val) = some (values0024[i.val]'(by rw [values0024_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row001_lookup _).trans (OriginalRow227TriangleLookupRow001.block0024_lookup i)

theorem block0024_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 1 (256 + i.val) = (values0024[i.val]'(by rw [values0024_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0024_lookup i)

theorem block0025_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 1 (288 + i.val) = some (values0025[i.val]'(by rw [values0025_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row001_lookup _).trans (OriginalRow227TriangleLookupRow001.block0025_lookup i)

theorem block0025_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 1 (288 + i.val) = (values0025[i.val]'(by rw [values0025_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0025_lookup i)

theorem block0026_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 1 (320 + i.val) = some (values0026[i.val]'(by rw [values0026_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row001_lookup _).trans (OriginalRow227TriangleLookupRow001.block0026_lookup i)

theorem block0026_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 1 (320 + i.val) = (values0026[i.val]'(by rw [values0026_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0026_lookup i)

theorem block0027_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 1 (352 + i.val) = some (values0027[i.val]'(by rw [values0027_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row001_lookup _).trans (OriginalRow227TriangleLookupRow001.block0027_lookup i)

theorem block0027_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 1 (352 + i.val) = (values0027[i.val]'(by rw [values0027_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0027_lookup i)

theorem block0028_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 1 (384 + i.val) = some (values0028[i.val]'(by rw [values0028_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row001_lookup _).trans (OriginalRow227TriangleLookupRow001.block0028_lookup i)

theorem block0028_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 1 (384 + i.val) = (values0028[i.val]'(by rw [values0028_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0028_lookup i)

theorem block0029_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 1 (416 + i.val) = some (values0029[i.val]'(by rw [values0029_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row001_lookup _).trans (OriginalRow227TriangleLookupRow001.block0029_lookup i)

theorem block0029_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 1 (416 + i.val) = (values0029[i.val]'(by rw [values0029_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0029_lookup i)

theorem block0030_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 1 (448 + i.val) = some (values0030[i.val]'(by rw [values0030_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row001_lookup _).trans (OriginalRow227TriangleLookupRow001.block0030_lookup i)

theorem block0030_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 1 (448 + i.val) = (values0030[i.val]'(by rw [values0030_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0030_lookup i)

theorem block0031_lookup (i : Fin 21) :
    OriginalRow227TriangleLookup.lookup 1 (480 + i.val) = some (values0031[i.val]'(by rw [values0031_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row001_lookup _).trans (OriginalRow227TriangleLookupRow001.block0031_lookup i)

theorem block0031_value (i : Fin 21) :
    OriginalRow227TriangleLookup.T 1 (480 + i.val) = (values0031[i.val]'(by rw [values0031_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0031_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0016_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0016_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0017_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0017_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0018_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0018_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0019_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0019_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0020_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0020_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0021_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0021_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0022_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0022_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0023_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0023_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0024_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0024_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0025_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0025_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0026_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0026_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0027_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0027_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0028_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0028_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0029_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0029_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0030_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0030_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0031_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001.block0031_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001
