import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow076
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow077
import Grothe.UpperChaos.OriginalRow227TriangleForward1051
import Grothe.UpperChaos.OriginalRow227TriangleForward1052
import Grothe.UpperChaos.OriginalRow227TriangleForward1053
import Grothe.UpperChaos.OriginalRow227TriangleForward1054
import Grothe.UpperChaos.OriginalRow227TriangleForward1055
import Grothe.UpperChaos.OriginalRow227TriangleForward1056
import Grothe.UpperChaos.OriginalRow227TriangleForward1057
import Grothe.UpperChaos.OriginalRow227TriangleForward1058
import Grothe.UpperChaos.OriginalRow227TriangleForward1059
import Grothe.UpperChaos.OriginalRow227TriangleForward1060
import Grothe.UpperChaos.OriginalRow227TriangleForward1061

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1051 : OriginalRow227TriangleForward1051.entries.size = 32 := rfl

def entry1051 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1051.entries[i.val]'(by rw [size1051]; exact i.isLt)

theorem fields1051 (i : Fin 32) :
    (entry1051 i).IA = shift ∧ (entry1051 i).ID = S (76 + i.val + 1) ∧
      (entry1051 i).IC = S 77 ∧ (entry1051 i).Inext = T 76 (76 + i.val + 1) ∧
      (entry1051 i).Icur = T 76 (76 + i.val) ∧
      (entry1051 i).output = T 77 (76 + i.val) ∧
      (entry1051 i).charge = charge 76 (76 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1056_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1067_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1051 (i : Fin 32) :
    forwardStepOK (-768) (charge 76 (76 + i.val)) shift
      (S (76 + i.val + 1)) (S 77) (T 76 (76 + i.val + 1))
      (T 76 (76 + i.val)) (T 77 (76 + i.val))
      (OriginalRow227Roots.root_pos 77 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 76 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1051.entries OriginalRow227TriangleForward1051.checked
    ⟨i.val, by rw [size1051]; exact i.isLt⟩
  change (entry1051 i).check = true at h
  rcases fields1051 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1052 : OriginalRow227TriangleForward1052.entries.size = 32 := rfl

def entry1052 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1052.entries[i.val]'(by rw [size1052]; exact i.isLt)

theorem fields1052 (i : Fin 32) :
    (entry1052 i).IA = shift ∧ (entry1052 i).ID = S (108 + i.val + 1) ∧
      (entry1052 i).IC = S 77 ∧ (entry1052 i).Inext = T 76 (108 + i.val + 1) ∧
      (entry1052 i).Icur = T 76 (108 + i.val) ∧
      (entry1052 i).output = T 77 (108 + i.val) ∧
      (entry1052 i).charge = charge 76 (108 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1057_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1068_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1052 (i : Fin 32) :
    forwardStepOK (-768) (charge 76 (108 + i.val)) shift
      (S (108 + i.val + 1)) (S 77) (T 76 (108 + i.val + 1))
      (T 76 (108 + i.val)) (T 77 (108 + i.val))
      (OriginalRow227Roots.root_pos 77 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 76 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1052.entries OriginalRow227TriangleForward1052.checked
    ⟨i.val, by rw [size1052]; exact i.isLt⟩
  change (entry1052 i).check = true at h
  rcases fields1052 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1053 : OriginalRow227TriangleForward1053.entries.size = 32 := rfl

def entry1053 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1053.entries[i.val]'(by rw [size1053]; exact i.isLt)

theorem fields1053 (i : Fin 32) :
    (entry1053 i).IA = shift ∧ (entry1053 i).ID = S (140 + i.val + 1) ∧
      (entry1053 i).IC = S 77 ∧ (entry1053 i).Inext = T 76 (140 + i.val + 1) ∧
      (entry1053 i).Icur = T 76 (140 + i.val) ∧
      (entry1053 i).output = T 77 (140 + i.val) ∧
      (entry1053 i).charge = charge 76 (140 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1058_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1069_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1053 (i : Fin 32) :
    forwardStepOK (-768) (charge 76 (140 + i.val)) shift
      (S (140 + i.val + 1)) (S 77) (T 76 (140 + i.val + 1))
      (T 76 (140 + i.val)) (T 77 (140 + i.val))
      (OriginalRow227Roots.root_pos 77 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 76 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1053.entries OriginalRow227TriangleForward1053.checked
    ⟨i.val, by rw [size1053]; exact i.isLt⟩
  change (entry1053 i).check = true at h
  rcases fields1053 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1054 : OriginalRow227TriangleForward1054.entries.size = 32 := rfl

def entry1054 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1054.entries[i.val]'(by rw [size1054]; exact i.isLt)

theorem fields1054 (i : Fin 32) :
    (entry1054 i).IA = shift ∧ (entry1054 i).ID = S (172 + i.val + 1) ∧
      (entry1054 i).IC = S 77 ∧ (entry1054 i).Inext = T 76 (172 + i.val + 1) ∧
      (entry1054 i).Icur = T 76 (172 + i.val) ∧
      (entry1054 i).output = T 77 (172 + i.val) ∧
      (entry1054 i).charge = charge 76 (172 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1059_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1070_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1054 (i : Fin 32) :
    forwardStepOK (-768) (charge 76 (172 + i.val)) shift
      (S (172 + i.val + 1)) (S 77) (T 76 (172 + i.val + 1))
      (T 76 (172 + i.val)) (T 77 (172 + i.val))
      (OriginalRow227Roots.root_pos 77 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 76 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1054.entries OriginalRow227TriangleForward1054.checked
    ⟨i.val, by rw [size1054]; exact i.isLt⟩
  change (entry1054 i).check = true at h
  rcases fields1054 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1055 : OriginalRow227TriangleForward1055.entries.size = 32 := rfl

def entry1055 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1055.entries[i.val]'(by rw [size1055]; exact i.isLt)

theorem fields1055 (i : Fin 32) :
    (entry1055 i).IA = shift ∧ (entry1055 i).ID = S (204 + i.val + 1) ∧
      (entry1055 i).IC = S 77 ∧ (entry1055 i).Inext = T 76 (204 + i.val + 1) ∧
      (entry1055 i).Icur = T 76 (204 + i.val) ∧
      (entry1055 i).output = T 77 (204 + i.val) ∧
      (entry1055 i).charge = charge 76 (204 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1060_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1071_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1055 (i : Fin 32) :
    forwardStepOK (-768) (charge 76 (204 + i.val)) shift
      (S (204 + i.val + 1)) (S 77) (T 76 (204 + i.val + 1))
      (T 76 (204 + i.val)) (T 77 (204 + i.val))
      (OriginalRow227Roots.root_pos 77 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 76 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1055.entries OriginalRow227TriangleForward1055.checked
    ⟨i.val, by rw [size1055]; exact i.isLt⟩
  change (entry1055 i).check = true at h
  rcases fields1055 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1056 : OriginalRow227TriangleForward1056.entries.size = 32 := rfl

def entry1056 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1056.entries[i.val]'(by rw [size1056]; exact i.isLt)

theorem fields1056 (i : Fin 32) :
    (entry1056 i).IA = shift ∧ (entry1056 i).ID = S (236 + i.val + 1) ∧
      (entry1056 i).IC = S 77 ∧ (entry1056 i).Inext = T 76 (236 + i.val + 1) ∧
      (entry1056 i).Icur = T 76 (236 + i.val) ∧
      (entry1056 i).output = T 77 (236 + i.val) ∧
      (entry1056 i).charge = charge 76 (236 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1061_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1072_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1056 (i : Fin 32) :
    forwardStepOK (-768) (charge 76 (236 + i.val)) shift
      (S (236 + i.val + 1)) (S 77) (T 76 (236 + i.val + 1))
      (T 76 (236 + i.val)) (T 77 (236 + i.val))
      (OriginalRow227Roots.root_pos 77 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 76 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1056.entries OriginalRow227TriangleForward1056.checked
    ⟨i.val, by rw [size1056]; exact i.isLt⟩
  change (entry1056 i).check = true at h
  rcases fields1056 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1057 : OriginalRow227TriangleForward1057.entries.size = 32 := rfl

def entry1057 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1057.entries[i.val]'(by rw [size1057]; exact i.isLt)

theorem fields1057 (i : Fin 32) :
    (entry1057 i).IA = shift ∧ (entry1057 i).ID = S (268 + i.val + 1) ∧
      (entry1057 i).IC = S 77 ∧ (entry1057 i).Inext = T 76 (268 + i.val + 1) ∧
      (entry1057 i).Icur = T 76 (268 + i.val) ∧
      (entry1057 i).output = T 77 (268 + i.val) ∧
      (entry1057 i).charge = charge 76 (268 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1062_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1073_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1057 (i : Fin 32) :
    forwardStepOK (-768) (charge 76 (268 + i.val)) shift
      (S (268 + i.val + 1)) (S 77) (T 76 (268 + i.val + 1))
      (T 76 (268 + i.val)) (T 77 (268 + i.val))
      (OriginalRow227Roots.root_pos 77 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 76 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1057.entries OriginalRow227TriangleForward1057.checked
    ⟨i.val, by rw [size1057]; exact i.isLt⟩
  change (entry1057 i).check = true at h
  rcases fields1057 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1058 : OriginalRow227TriangleForward1058.entries.size = 32 := rfl

def entry1058 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1058.entries[i.val]'(by rw [size1058]; exact i.isLt)

theorem fields1058 (i : Fin 32) :
    (entry1058 i).IA = shift ∧ (entry1058 i).ID = S (300 + i.val + 1) ∧
      (entry1058 i).IC = S 77 ∧ (entry1058 i).Inext = T 76 (300 + i.val + 1) ∧
      (entry1058 i).Icur = T 76 (300 + i.val) ∧
      (entry1058 i).output = T 77 (300 + i.val) ∧
      (entry1058 i).charge = charge 76 (300 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1063_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1074_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1058 (i : Fin 32) :
    forwardStepOK (-768) (charge 76 (300 + i.val)) shift
      (S (300 + i.val + 1)) (S 77) (T 76 (300 + i.val + 1))
      (T 76 (300 + i.val)) (T 77 (300 + i.val))
      (OriginalRow227Roots.root_pos 77 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 76 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1058.entries OriginalRow227TriangleForward1058.checked
    ⟨i.val, by rw [size1058]; exact i.isLt⟩
  change (entry1058 i).check = true at h
  rcases fields1058 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1059 : OriginalRow227TriangleForward1059.entries.size = 32 := rfl

def entry1059 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1059.entries[i.val]'(by rw [size1059]; exact i.isLt)

theorem fields1059 (i : Fin 32) :
    (entry1059 i).IA = shift ∧ (entry1059 i).ID = S (332 + i.val + 1) ∧
      (entry1059 i).IC = S 77 ∧ (entry1059 i).Inext = T 76 (332 + i.val + 1) ∧
      (entry1059 i).Icur = T 76 (332 + i.val) ∧
      (entry1059 i).output = T 77 (332 + i.val) ∧
      (entry1059 i).charge = charge 76 (332 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1064_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1075_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1059 (i : Fin 32) :
    forwardStepOK (-768) (charge 76 (332 + i.val)) shift
      (S (332 + i.val + 1)) (S 77) (T 76 (332 + i.val + 1))
      (T 76 (332 + i.val)) (T 77 (332 + i.val))
      (OriginalRow227Roots.root_pos 77 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 76 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1059.entries OriginalRow227TriangleForward1059.checked
    ⟨i.val, by rw [size1059]; exact i.isLt⟩
  change (entry1059 i).check = true at h
  rcases fields1059 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1060 : OriginalRow227TriangleForward1060.entries.size = 32 := rfl

def entry1060 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1060.entries[i.val]'(by rw [size1060]; exact i.isLt)

theorem fields1060 (i : Fin 32) :
    (entry1060 i).IA = shift ∧ (entry1060 i).ID = S (364 + i.val + 1) ∧
      (entry1060 i).IC = S 77 ∧ (entry1060 i).Inext = T 76 (364 + i.val + 1) ∧
      (entry1060 i).Icur = T 76 (364 + i.val) ∧
      (entry1060 i).output = T 77 (364 + i.val) ∧
      (entry1060 i).charge = charge 76 (364 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1065_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1076_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1060 (i : Fin 32) :
    forwardStepOK (-768) (charge 76 (364 + i.val)) shift
      (S (364 + i.val + 1)) (S 77) (T 76 (364 + i.val + 1))
      (T 76 (364 + i.val)) (T 77 (364 + i.val))
      (OriginalRow227Roots.root_pos 77 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 76 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1060.entries OriginalRow227TriangleForward1060.checked
    ⟨i.val, by rw [size1060]; exact i.isLt⟩
  change (entry1060 i).check = true at h
  rcases fields1060 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1061 : OriginalRow227TriangleForward1061.entries.size = 29 := rfl

def entry1061 (i : Fin 29) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1061.entries[i.val]'(by rw [size1061]; exact i.isLt)

theorem fields1061 (i : Fin 29) :
    (entry1061 i).IA = shift ∧ (entry1061 i).ID = S (396 + i.val + 1) ∧
      (entry1061 i).IC = S 77 ∧ (entry1061 i).Inext = T 76 (396 + i.val + 1) ∧
      (entry1061 i).Icur = T 76 (396 + i.val) ∧
      (entry1061 i).output = T 77 (396 + i.val) ∧
      (entry1061 i).charge = charge 76 (396 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings02.S_eq_root77).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow076.block1066_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow077.block1077_value ⟨28, by decide⟩).symm, rfl⟩

theorem step1061 (i : Fin 29) :
    forwardStepOK (-768) (charge 76 (396 + i.val)) shift
      (S (396 + i.val + 1)) (S 77) (T 76 (396 + i.val + 1))
      (T 76 (396 + i.val)) (T 77 (396 + i.val))
      (OriginalRow227Roots.root_pos 77 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 76 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1061.entries OriginalRow227TriangleForward1061.checked
    ⟨i.val, by rw [size1061]; exact i.isLt⟩
  change (entry1061 i).check = true at h
  rcases fields1061 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 76 ≤ d) (hhi : d < 425) :
    forwardStepOK (-768) (charge 76 d) shift (S (d + 1)) (S 77)
      (T 76 (d + 1)) (T 76 d) (T 77 d)
      (OriginalRow227Roots.root_pos 77 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 76 (by decide)) = true := by
  by_cases h236 : d < 236
  ·
    by_cases h140 : d < 140
    ·
      by_cases h108 : d < 108
      ·
        have hi : d - 76 < 32 := by omega
        have heq : 76 + (d - 76) = d := by omega
        simpa only [heq] using step1051 ⟨d - 76, hi⟩
      ·
        have hi : d - 108 < 32 := by omega
        have heq : 108 + (d - 108) = d := by omega
        simpa only [heq] using step1052 ⟨d - 108, hi⟩
    ·
      by_cases h172 : d < 172
      ·
        have hi : d - 140 < 32 := by omega
        have heq : 140 + (d - 140) = d := by omega
        simpa only [heq] using step1053 ⟨d - 140, hi⟩
      ·
        by_cases h204 : d < 204
        ·
          have hi : d - 172 < 32 := by omega
          have heq : 172 + (d - 172) = d := by omega
          simpa only [heq] using step1054 ⟨d - 172, hi⟩
        ·
          have hi : d - 204 < 32 := by omega
          have heq : 204 + (d - 204) = d := by omega
          simpa only [heq] using step1055 ⟨d - 204, hi⟩
  ·
    by_cases h332 : d < 332
    ·
      by_cases h268 : d < 268
      ·
        have hi : d - 236 < 32 := by omega
        have heq : 236 + (d - 236) = d := by omega
        simpa only [heq] using step1056 ⟨d - 236, hi⟩
      ·
        by_cases h300 : d < 300
        ·
          have hi : d - 268 < 32 := by omega
          have heq : 268 + (d - 268) = d := by omega
          simpa only [heq] using step1057 ⟨d - 268, hi⟩
        ·
          have hi : d - 300 < 32 := by omega
          have heq : 300 + (d - 300) = d := by omega
          simpa only [heq] using step1058 ⟨d - 300, hi⟩
    ·
      by_cases h364 : d < 364
      ·
        have hi : d - 332 < 32 := by omega
        have heq : 332 + (d - 332) = d := by omega
        simpa only [heq] using step1059 ⟨d - 332, hi⟩
      ·
        by_cases h396 : d < 396
        ·
          have hi : d - 364 < 32 := by omega
          have heq : 364 + (d - 364) = d := by omega
          simpa only [heq] using step1060 ⟨d - 364, hi⟩
        ·
          have hi : d - 396 < 29 := by omega
          have heq : 396 + (d - 396) = d := by omega
          simpa only [heq] using step1061 ⟨d - 396, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.fields1051,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.step1051,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.fields1052,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.step1052,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.fields1053,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.step1053,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.fields1054,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.step1054,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.fields1055,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.step1055,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.fields1056,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.step1056,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.fields1057,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.step1057,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.fields1058,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.step1058,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.fields1059,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.step1059,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.fields1060,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.step1060,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.fields1061,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.step1061,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow077
