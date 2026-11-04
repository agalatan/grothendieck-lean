import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow016

theorem block0252_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 16 (15 + i.val) = some (values0252[i.val]'(by rw [values0252_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row016_lookup _).trans (OriginalRow227TriangleLookupRow016.block0252_lookup i)

theorem block0252_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 16 (15 + i.val) = (values0252[i.val]'(by rw [values0252_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0252_lookup i)

theorem block0253_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 16 (47 + i.val) = some (values0253[i.val]'(by rw [values0253_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row016_lookup _).trans (OriginalRow227TriangleLookupRow016.block0253_lookup i)

theorem block0253_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 16 (47 + i.val) = (values0253[i.val]'(by rw [values0253_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0253_lookup i)

theorem block0254_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 16 (79 + i.val) = some (values0254[i.val]'(by rw [values0254_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row016_lookup _).trans (OriginalRow227TriangleLookupRow016.block0254_lookup i)

theorem block0254_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 16 (79 + i.val) = (values0254[i.val]'(by rw [values0254_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0254_lookup i)

theorem block0255_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 16 (111 + i.val) = some (values0255[i.val]'(by rw [values0255_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row016_lookup _).trans (OriginalRow227TriangleLookupRow016.block0255_lookup i)

theorem block0255_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 16 (111 + i.val) = (values0255[i.val]'(by rw [values0255_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0255_lookup i)

theorem block0256_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 16 (143 + i.val) = some (values0256[i.val]'(by rw [values0256_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row016_lookup _).trans (OriginalRow227TriangleLookupRow016.block0256_lookup i)

theorem block0256_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 16 (143 + i.val) = (values0256[i.val]'(by rw [values0256_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0256_lookup i)

theorem block0257_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 16 (175 + i.val) = some (values0257[i.val]'(by rw [values0257_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row016_lookup _).trans (OriginalRow227TriangleLookupRow016.block0257_lookup i)

theorem block0257_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 16 (175 + i.val) = (values0257[i.val]'(by rw [values0257_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0257_lookup i)

theorem block0258_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 16 (207 + i.val) = some (values0258[i.val]'(by rw [values0258_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row016_lookup _).trans (OriginalRow227TriangleLookupRow016.block0258_lookup i)

theorem block0258_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 16 (207 + i.val) = (values0258[i.val]'(by rw [values0258_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0258_lookup i)

theorem block0259_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 16 (239 + i.val) = some (values0259[i.val]'(by rw [values0259_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row016_lookup _).trans (OriginalRow227TriangleLookupRow016.block0259_lookup i)

theorem block0259_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 16 (239 + i.val) = (values0259[i.val]'(by rw [values0259_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0259_lookup i)

theorem block0260_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 16 (271 + i.val) = some (values0260[i.val]'(by rw [values0260_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row016_lookup _).trans (OriginalRow227TriangleLookupRow016.block0260_lookup i)

theorem block0260_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 16 (271 + i.val) = (values0260[i.val]'(by rw [values0260_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0260_lookup i)

theorem block0261_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 16 (303 + i.val) = some (values0261[i.val]'(by rw [values0261_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row016_lookup _).trans (OriginalRow227TriangleLookupRow016.block0261_lookup i)

theorem block0261_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 16 (303 + i.val) = (values0261[i.val]'(by rw [values0261_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0261_lookup i)

theorem block0262_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 16 (335 + i.val) = some (values0262[i.val]'(by rw [values0262_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row016_lookup _).trans (OriginalRow227TriangleLookupRow016.block0262_lookup i)

theorem block0262_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 16 (335 + i.val) = (values0262[i.val]'(by rw [values0262_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0262_lookup i)

theorem block0263_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 16 (367 + i.val) = some (values0263[i.val]'(by rw [values0263_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row016_lookup _).trans (OriginalRow227TriangleLookupRow016.block0263_lookup i)

theorem block0263_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 16 (367 + i.val) = (values0263[i.val]'(by rw [values0263_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0263_lookup i)

theorem block0264_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 16 (399 + i.val) = some (values0264[i.val]'(by rw [values0264_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row016_lookup _).trans (OriginalRow227TriangleLookupRow016.block0264_lookup i)

theorem block0264_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 16 (399 + i.val) = (values0264[i.val]'(by rw [values0264_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0264_lookup i)

theorem block0265_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 16 (431 + i.val) = some (values0265[i.val]'(by rw [values0265_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row016_lookup _).trans (OriginalRow227TriangleLookupRow016.block0265_lookup i)

theorem block0265_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 16 (431 + i.val) = (values0265[i.val]'(by rw [values0265_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0265_lookup i)

theorem block0266_lookup (i : Fin 23) :
    OriginalRow227TriangleLookup.lookup 16 (463 + i.val) = some (values0266[i.val]'(by rw [values0266_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row016_lookup _).trans (OriginalRow227TriangleLookupRow016.block0266_lookup i)

theorem block0266_value (i : Fin 23) :
    OriginalRow227TriangleLookup.T 16 (463 + i.val) = (values0266[i.val]'(by rw [values0266_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block0266_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0252_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0252_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0253_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0253_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0254_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0254_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0255_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0255_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0256_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0256_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0257_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0257_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0258_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0258_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0259_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0259_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0260_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0260_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0261_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0261_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0262_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0262_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0263_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0263_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0264_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0264_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0265_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0265_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0266_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016.block0266_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016
