import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068
import Grothe.UpperChaos.OriginalRow227TriangleForward0944
import Grothe.UpperChaos.OriginalRow227TriangleForward0945
import Grothe.UpperChaos.OriginalRow227TriangleForward0946
import Grothe.UpperChaos.OriginalRow227TriangleForward0947
import Grothe.UpperChaos.OriginalRow227TriangleForward0948
import Grothe.UpperChaos.OriginalRow227TriangleForward0949
import Grothe.UpperChaos.OriginalRow227TriangleForward0950
import Grothe.UpperChaos.OriginalRow227TriangleForward0951
import Grothe.UpperChaos.OriginalRow227TriangleForward0952
import Grothe.UpperChaos.OriginalRow227TriangleForward0953
import Grothe.UpperChaos.OriginalRow227TriangleForward0954
import Grothe.UpperChaos.OriginalRow227TriangleForward0955

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0944 : OriginalRow227TriangleForward0944.entries.size = 32 := rfl

def entry0944 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0944.entries[i.val]'(by rw [size0944]; exact i.isLt)

theorem fields0944 (i : Fin 32) :
    (entry0944 i).IA = shift ∧ (entry0944 i).ID = S (67 + i.val + 1) ∧
      (entry0944 i).IC = S 68 ∧ (entry0944 i).Inext = T 67 (67 + i.val + 1) ∧
      (entry0944 i).Icur = T 67 (67 + i.val) ∧
      (entry0944 i).output = T 68 (67 + i.val) ∧
      (entry0944 i).charge = charge 67 (67 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0944 (i : Fin 32) :
    forwardStepOK (-768) (charge 67 (67 + i.val)) shift
      (S (67 + i.val + 1)) (S 68) (T 67 (67 + i.val + 1))
      (T 67 (67 + i.val)) (T 68 (67 + i.val))
      (OriginalRow227Roots.root_pos 68 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 67 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0944.entries OriginalRow227TriangleForward0944.checked
    ⟨i.val, by rw [size0944]; exact i.isLt⟩
  change (entry0944 i).check = true at h
  rcases fields0944 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0945 : OriginalRow227TriangleForward0945.entries.size = 32 := rfl

def entry0945 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0945.entries[i.val]'(by rw [size0945]; exact i.isLt)

theorem fields0945 (i : Fin 32) :
    (entry0945 i).IA = shift ∧ (entry0945 i).ID = S (99 + i.val + 1) ∧
      (entry0945 i).IC = S 68 ∧ (entry0945 i).Inext = T 67 (99 + i.val + 1) ∧
      (entry0945 i).Icur = T 67 (99 + i.val) ∧
      (entry0945 i).output = T 68 (99 + i.val) ∧
      (entry0945 i).charge = charge 67 (99 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0945 (i : Fin 32) :
    forwardStepOK (-768) (charge 67 (99 + i.val)) shift
      (S (99 + i.val + 1)) (S 68) (T 67 (99 + i.val + 1))
      (T 67 (99 + i.val)) (T 68 (99 + i.val))
      (OriginalRow227Roots.root_pos 68 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 67 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0945.entries OriginalRow227TriangleForward0945.checked
    ⟨i.val, by rw [size0945]; exact i.isLt⟩
  change (entry0945 i).check = true at h
  rcases fields0945 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0946 : OriginalRow227TriangleForward0946.entries.size = 32 := rfl

def entry0946 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0946.entries[i.val]'(by rw [size0946]; exact i.isLt)

theorem fields0946 (i : Fin 32) :
    (entry0946 i).IA = shift ∧ (entry0946 i).ID = S (131 + i.val + 1) ∧
      (entry0946 i).IC = S 68 ∧ (entry0946 i).Inext = T 67 (131 + i.val + 1) ∧
      (entry0946 i).Icur = T 67 (131 + i.val) ∧
      (entry0946 i).output = T 68 (131 + i.val) ∧
      (entry0946 i).charge = charge 67 (131 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0946 (i : Fin 32) :
    forwardStepOK (-768) (charge 67 (131 + i.val)) shift
      (S (131 + i.val + 1)) (S 68) (T 67 (131 + i.val + 1))
      (T 67 (131 + i.val)) (T 68 (131 + i.val))
      (OriginalRow227Roots.root_pos 68 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 67 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0946.entries OriginalRow227TriangleForward0946.checked
    ⟨i.val, by rw [size0946]; exact i.isLt⟩
  change (entry0946 i).check = true at h
  rcases fields0946 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0947 : OriginalRow227TriangleForward0947.entries.size = 32 := rfl

def entry0947 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0947.entries[i.val]'(by rw [size0947]; exact i.isLt)

theorem fields0947 (i : Fin 32) :
    (entry0947 i).IA = shift ∧ (entry0947 i).ID = S (163 + i.val + 1) ∧
      (entry0947 i).IC = S 68 ∧ (entry0947 i).Inext = T 67 (163 + i.val + 1) ∧
      (entry0947 i).Icur = T 67 (163 + i.val) ∧
      (entry0947 i).output = T 68 (163 + i.val) ∧
      (entry0947 i).charge = charge 67 (163 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0947 (i : Fin 32) :
    forwardStepOK (-768) (charge 67 (163 + i.val)) shift
      (S (163 + i.val + 1)) (S 68) (T 67 (163 + i.val + 1))
      (T 67 (163 + i.val)) (T 68 (163 + i.val))
      (OriginalRow227Roots.root_pos 68 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 67 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0947.entries OriginalRow227TriangleForward0947.checked
    ⟨i.val, by rw [size0947]; exact i.isLt⟩
  change (entry0947 i).check = true at h
  rcases fields0947 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0948 : OriginalRow227TriangleForward0948.entries.size = 32 := rfl

def entry0948 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0948.entries[i.val]'(by rw [size0948]; exact i.isLt)

theorem fields0948 (i : Fin 32) :
    (entry0948 i).IA = shift ∧ (entry0948 i).ID = S (195 + i.val + 1) ∧
      (entry0948 i).IC = S 68 ∧ (entry0948 i).Inext = T 67 (195 + i.val + 1) ∧
      (entry0948 i).Icur = T 67 (195 + i.val) ∧
      (entry0948 i).output = T 68 (195 + i.val) ∧
      (entry0948 i).charge = charge 67 (195 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0948 (i : Fin 32) :
    forwardStepOK (-768) (charge 67 (195 + i.val)) shift
      (S (195 + i.val + 1)) (S 68) (T 67 (195 + i.val + 1))
      (T 67 (195 + i.val)) (T 68 (195 + i.val))
      (OriginalRow227Roots.root_pos 68 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 67 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0948.entries OriginalRow227TriangleForward0948.checked
    ⟨i.val, by rw [size0948]; exact i.isLt⟩
  change (entry0948 i).check = true at h
  rcases fields0948 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0949 : OriginalRow227TriangleForward0949.entries.size = 32 := rfl

def entry0949 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0949.entries[i.val]'(by rw [size0949]; exact i.isLt)

theorem fields0949 (i : Fin 32) :
    (entry0949 i).IA = shift ∧ (entry0949 i).ID = S (227 + i.val + 1) ∧
      (entry0949 i).IC = S 68 ∧ (entry0949 i).Inext = T 67 (227 + i.val + 1) ∧
      (entry0949 i).Icur = T 67 (227 + i.val) ∧
      (entry0949 i).output = T 68 (227 + i.val) ∧
      (entry0949 i).charge = charge 67 (227 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0949 (i : Fin 32) :
    forwardStepOK (-768) (charge 67 (227 + i.val)) shift
      (S (227 + i.val + 1)) (S 68) (T 67 (227 + i.val + 1))
      (T 67 (227 + i.val)) (T 68 (227 + i.val))
      (OriginalRow227Roots.root_pos 68 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 67 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0949.entries OriginalRow227TriangleForward0949.checked
    ⟨i.val, by rw [size0949]; exact i.isLt⟩
  change (entry0949 i).check = true at h
  rcases fields0949 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0950 : OriginalRow227TriangleForward0950.entries.size = 32 := rfl

def entry0950 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0950.entries[i.val]'(by rw [size0950]; exact i.isLt)

theorem fields0950 (i : Fin 32) :
    (entry0950 i).IA = shift ∧ (entry0950 i).ID = S (259 + i.val + 1) ∧
      (entry0950 i).IC = S 68 ∧ (entry0950 i).Inext = T 67 (259 + i.val + 1) ∧
      (entry0950 i).Icur = T 67 (259 + i.val) ∧
      (entry0950 i).output = T 68 (259 + i.val) ∧
      (entry0950 i).charge = charge 67 (259 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0950 (i : Fin 32) :
    forwardStepOK (-768) (charge 67 (259 + i.val)) shift
      (S (259 + i.val + 1)) (S 68) (T 67 (259 + i.val + 1))
      (T 67 (259 + i.val)) (T 68 (259 + i.val))
      (OriginalRow227Roots.root_pos 68 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 67 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0950.entries OriginalRow227TriangleForward0950.checked
    ⟨i.val, by rw [size0950]; exact i.isLt⟩
  change (entry0950 i).check = true at h
  rcases fields0950 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0951 : OriginalRow227TriangleForward0951.entries.size = 32 := rfl

def entry0951 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0951.entries[i.val]'(by rw [size0951]; exact i.isLt)

theorem fields0951 (i : Fin 32) :
    (entry0951 i).IA = shift ∧ (entry0951 i).ID = S (291 + i.val + 1) ∧
      (entry0951 i).IC = S 68 ∧ (entry0951 i).Inext = T 67 (291 + i.val + 1) ∧
      (entry0951 i).Icur = T 67 (291 + i.val) ∧
      (entry0951 i).output = T 68 (291 + i.val) ∧
      (entry0951 i).charge = charge 67 (291 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0951 (i : Fin 32) :
    forwardStepOK (-768) (charge 67 (291 + i.val)) shift
      (S (291 + i.val + 1)) (S 68) (T 67 (291 + i.val + 1))
      (T 67 (291 + i.val)) (T 68 (291 + i.val))
      (OriginalRow227Roots.root_pos 68 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 67 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0951.entries OriginalRow227TriangleForward0951.checked
    ⟨i.val, by rw [size0951]; exact i.isLt⟩
  change (entry0951 i).check = true at h
  rcases fields0951 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0952 : OriginalRow227TriangleForward0952.entries.size = 32 := rfl

def entry0952 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0952.entries[i.val]'(by rw [size0952]; exact i.isLt)

theorem fields0952 (i : Fin 32) :
    (entry0952 i).IA = shift ∧ (entry0952 i).ID = S (323 + i.val + 1) ∧
      (entry0952 i).IC = S 68 ∧ (entry0952 i).Inext = T 67 (323 + i.val + 1) ∧
      (entry0952 i).Icur = T 67 (323 + i.val) ∧
      (entry0952 i).output = T 68 (323 + i.val) ∧
      (entry0952 i).charge = charge 67 (323 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0952 (i : Fin 32) :
    forwardStepOK (-768) (charge 67 (323 + i.val)) shift
      (S (323 + i.val + 1)) (S 68) (T 67 (323 + i.val + 1))
      (T 67 (323 + i.val)) (T 68 (323 + i.val))
      (OriginalRow227Roots.root_pos 68 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 67 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0952.entries OriginalRow227TriangleForward0952.checked
    ⟨i.val, by rw [size0952]; exact i.isLt⟩
  change (entry0952 i).check = true at h
  rcases fields0952 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0953 : OriginalRow227TriangleForward0953.entries.size = 32 := rfl

def entry0953 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0953.entries[i.val]'(by rw [size0953]; exact i.isLt)

theorem fields0953 (i : Fin 32) :
    (entry0953 i).IA = shift ∧ (entry0953 i).ID = S (355 + i.val + 1) ∧
      (entry0953 i).IC = S 68 ∧ (entry0953 i).Inext = T 67 (355 + i.val + 1) ∧
      (entry0953 i).Icur = T 67 (355 + i.val) ∧
      (entry0953 i).output = T 68 (355 + i.val) ∧
      (entry0953 i).charge = charge 67 (355 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0953 (i : Fin 32) :
    forwardStepOK (-768) (charge 67 (355 + i.val)) shift
      (S (355 + i.val + 1)) (S 68) (T 67 (355 + i.val + 1))
      (T 67 (355 + i.val)) (T 68 (355 + i.val))
      (OriginalRow227Roots.root_pos 68 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 67 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0953.entries OriginalRow227TriangleForward0953.checked
    ⟨i.val, by rw [size0953]; exact i.isLt⟩
  change (entry0953 i).check = true at h
  rcases fields0953 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0954 : OriginalRow227TriangleForward0954.entries.size = 32 := rfl

def entry0954 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0954.entries[i.val]'(by rw [size0954]; exact i.isLt)

theorem fields0954 (i : Fin 32) :
    (entry0954 i).IA = shift ∧ (entry0954 i).ID = S (387 + i.val + 1) ∧
      (entry0954 i).IC = S 68 ∧ (entry0954 i).Inext = T 67 (387 + i.val + 1) ∧
      (entry0954 i).Icur = T 67 (387 + i.val) ∧
      (entry0954 i).output = T 68 (387 + i.val) ∧
      (entry0954 i).charge = charge 67 (387 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0954 (i : Fin 32) :
    forwardStepOK (-768) (charge 67 (387 + i.val)) shift
      (S (387 + i.val + 1)) (S 68) (T 67 (387 + i.val + 1))
      (T 67 (387 + i.val)) (T 68 (387 + i.val))
      (OriginalRow227Roots.root_pos 68 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 67 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0954.entries OriginalRow227TriangleForward0954.checked
    ⟨i.val, by rw [size0954]; exact i.isLt⟩
  change (entry0954 i).check = true at h
  rcases fields0954 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0955 : OriginalRow227TriangleForward0955.entries.size = 15 := rfl

def entry0955 (i : Fin 15) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0955.entries[i.val]'(by rw [size0955]; exact i.isLt)

theorem fields0955 (i : Fin 15) :
    (entry0955 i).IA = shift ∧ (entry0955 i).ID = S (419 + i.val + 1) ∧
      (entry0955 i).IC = S 68 ∧ (entry0955 i).Inext = T 67 (419 + i.val + 1) ∧
      (entry0955 i).Icur = T 67 (419 + i.val) ∧
      (entry0955 i).output = T 68 (419 + i.val) ∧
      (entry0955 i).charge = charge 67 (419 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings02.S_eq_root68).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨14, by decide⟩).symm, rfl⟩

theorem step0955 (i : Fin 15) :
    forwardStepOK (-768) (charge 67 (419 + i.val)) shift
      (S (419 + i.val + 1)) (S 68) (T 67 (419 + i.val + 1))
      (T 67 (419 + i.val)) (T 68 (419 + i.val))
      (OriginalRow227Roots.root_pos 68 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 67 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0955.entries OriginalRow227TriangleForward0955.checked
    ⟨i.val, by rw [size0955]; exact i.isLt⟩
  change (entry0955 i).check = true at h
  rcases fields0955 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 67 ≤ d) (hhi : d < 434) :
    forwardStepOK (-768) (charge 67 d) shift (S (d + 1)) (S 68)
      (T 67 (d + 1)) (T 67 d) (T 68 d)
      (OriginalRow227Roots.root_pos 68 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 67 (by decide)) = true := by
  by_cases h259 : d < 259
  ·
    by_cases h163 : d < 163
    ·
      by_cases h99 : d < 99
      ·
        have hi : d - 67 < 32 := by omega
        have heq : 67 + (d - 67) = d := by omega
        simpa only [heq] using step0944 ⟨d - 67, hi⟩
      ·
        by_cases h131 : d < 131
        ·
          have hi : d - 99 < 32 := by omega
          have heq : 99 + (d - 99) = d := by omega
          simpa only [heq] using step0945 ⟨d - 99, hi⟩
        ·
          have hi : d - 131 < 32 := by omega
          have heq : 131 + (d - 131) = d := by omega
          simpa only [heq] using step0946 ⟨d - 131, hi⟩
    ·
      by_cases h195 : d < 195
      ·
        have hi : d - 163 < 32 := by omega
        have heq : 163 + (d - 163) = d := by omega
        simpa only [heq] using step0947 ⟨d - 163, hi⟩
      ·
        by_cases h227 : d < 227
        ·
          have hi : d - 195 < 32 := by omega
          have heq : 195 + (d - 195) = d := by omega
          simpa only [heq] using step0948 ⟨d - 195, hi⟩
        ·
          have hi : d - 227 < 32 := by omega
          have heq : 227 + (d - 227) = d := by omega
          simpa only [heq] using step0949 ⟨d - 227, hi⟩
  ·
    by_cases h355 : d < 355
    ·
      by_cases h291 : d < 291
      ·
        have hi : d - 259 < 32 := by omega
        have heq : 259 + (d - 259) = d := by omega
        simpa only [heq] using step0950 ⟨d - 259, hi⟩
      ·
        by_cases h323 : d < 323
        ·
          have hi : d - 291 < 32 := by omega
          have heq : 291 + (d - 291) = d := by omega
          simpa only [heq] using step0951 ⟨d - 291, hi⟩
        ·
          have hi : d - 323 < 32 := by omega
          have heq : 323 + (d - 323) = d := by omega
          simpa only [heq] using step0952 ⟨d - 323, hi⟩
    ·
      by_cases h387 : d < 387
      ·
        have hi : d - 355 < 32 := by omega
        have heq : 355 + (d - 355) = d := by omega
        simpa only [heq] using step0953 ⟨d - 355, hi⟩
      ·
        by_cases h419 : d < 419
        ·
          have hi : d - 387 < 32 := by omega
          have heq : 387 + (d - 387) = d := by omega
          simpa only [heq] using step0954 ⟨d - 387, hi⟩
        ·
          have hi : d - 419 < 15 := by omega
          have heq : 419 + (d - 419) = d := by omega
          simpa only [heq] using step0955 ⟨d - 419, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.fields0944,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.step0944,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.fields0945,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.step0945,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.fields0946,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.step0946,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.fields0947,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.step0947,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.fields0948,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.step0948,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.fields0949,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.step0949,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.fields0950,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.step0950,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.fields0951,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.step0951,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.fields0952,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.step0952,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.fields0953,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.step0953,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.fields0954,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.step0954,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.fields0955,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.step0955,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow068
