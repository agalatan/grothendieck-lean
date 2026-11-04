import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow008

theorem block0128_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 8 (7 + i.val) = some (values0128[i.val]'(by rw [values0128_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row008_lookup _).trans (OriginalRow227TriangleLookupRow008.block0128_lookup i)

theorem block0128_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 8 (7 + i.val) = (values0128[i.val]'(by rw [values0128_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0128_lookup i)

theorem block0129_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 8 (39 + i.val) = some (values0129[i.val]'(by rw [values0129_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row008_lookup _).trans (OriginalRow227TriangleLookupRow008.block0129_lookup i)

theorem block0129_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 8 (39 + i.val) = (values0129[i.val]'(by rw [values0129_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0129_lookup i)

theorem block0130_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 8 (71 + i.val) = some (values0130[i.val]'(by rw [values0130_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row008_lookup _).trans (OriginalRow227TriangleLookupRow008.block0130_lookup i)

theorem block0130_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 8 (71 + i.val) = (values0130[i.val]'(by rw [values0130_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0130_lookup i)

theorem block0131_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 8 (103 + i.val) = some (values0131[i.val]'(by rw [values0131_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row008_lookup _).trans (OriginalRow227TriangleLookupRow008.block0131_lookup i)

theorem block0131_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 8 (103 + i.val) = (values0131[i.val]'(by rw [values0131_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0131_lookup i)

theorem block0132_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 8 (135 + i.val) = some (values0132[i.val]'(by rw [values0132_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row008_lookup _).trans (OriginalRow227TriangleLookupRow008.block0132_lookup i)

theorem block0132_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 8 (135 + i.val) = (values0132[i.val]'(by rw [values0132_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0132_lookup i)

theorem block0133_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 8 (167 + i.val) = some (values0133[i.val]'(by rw [values0133_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row008_lookup _).trans (OriginalRow227TriangleLookupRow008.block0133_lookup i)

theorem block0133_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 8 (167 + i.val) = (values0133[i.val]'(by rw [values0133_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0133_lookup i)

theorem block0134_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 8 (199 + i.val) = some (values0134[i.val]'(by rw [values0134_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row008_lookup _).trans (OriginalRow227TriangleLookupRow008.block0134_lookup i)

theorem block0134_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 8 (199 + i.val) = (values0134[i.val]'(by rw [values0134_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0134_lookup i)

theorem block0135_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 8 (231 + i.val) = some (values0135[i.val]'(by rw [values0135_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row008_lookup _).trans (OriginalRow227TriangleLookupRow008.block0135_lookup i)

theorem block0135_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 8 (231 + i.val) = (values0135[i.val]'(by rw [values0135_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0135_lookup i)

theorem block0136_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 8 (263 + i.val) = some (values0136[i.val]'(by rw [values0136_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row008_lookup _).trans (OriginalRow227TriangleLookupRow008.block0136_lookup i)

theorem block0136_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 8 (263 + i.val) = (values0136[i.val]'(by rw [values0136_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0136_lookup i)

theorem block0137_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 8 (295 + i.val) = some (values0137[i.val]'(by rw [values0137_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row008_lookup _).trans (OriginalRow227TriangleLookupRow008.block0137_lookup i)

theorem block0137_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 8 (295 + i.val) = (values0137[i.val]'(by rw [values0137_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0137_lookup i)

theorem block0138_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 8 (327 + i.val) = some (values0138[i.val]'(by rw [values0138_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row008_lookup _).trans (OriginalRow227TriangleLookupRow008.block0138_lookup i)

theorem block0138_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 8 (327 + i.val) = (values0138[i.val]'(by rw [values0138_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0138_lookup i)

theorem block0139_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 8 (359 + i.val) = some (values0139[i.val]'(by rw [values0139_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row008_lookup _).trans (OriginalRow227TriangleLookupRow008.block0139_lookup i)

theorem block0139_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 8 (359 + i.val) = (values0139[i.val]'(by rw [values0139_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0139_lookup i)

theorem block0140_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 8 (391 + i.val) = some (values0140[i.val]'(by rw [values0140_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row008_lookup _).trans (OriginalRow227TriangleLookupRow008.block0140_lookup i)

theorem block0140_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 8 (391 + i.val) = (values0140[i.val]'(by rw [values0140_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0140_lookup i)

theorem block0141_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 8 (423 + i.val) = some (values0141[i.val]'(by rw [values0141_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row008_lookup _).trans (OriginalRow227TriangleLookupRow008.block0141_lookup i)

theorem block0141_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 8 (423 + i.val) = (values0141[i.val]'(by rw [values0141_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0141_lookup i)

theorem block0142_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 8 (455 + i.val) = some (values0142[i.val]'(by rw [values0142_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row008_lookup _).trans (OriginalRow227TriangleLookupRow008.block0142_lookup i)

theorem block0142_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 8 (455 + i.val) = (values0142[i.val]'(by rw [values0142_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0142_lookup i)

theorem block0143_lookup (i : Fin 7) :
    OriginalRow227TriangleLookup.lookup 8 (487 + i.val) = some (values0143[i.val]'(by rw [values0143_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row008_lookup _).trans (OriginalRow227TriangleLookupRow008.block0143_lookup i)

theorem block0143_value (i : Fin 7) :
    OriginalRow227TriangleLookup.T 8 (487 + i.val) = (values0143[i.val]'(by rw [values0143_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0143_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0128_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0128_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0129_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0129_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0130_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0130_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0131_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0131_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0132_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0132_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0133_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0133_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0134_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0134_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0135_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0135_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0136_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0136_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0137_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0137_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0138_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0138_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0139_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0139_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0140_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0140_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0141_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0141_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0142_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0142_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0143_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008.block0143_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008
