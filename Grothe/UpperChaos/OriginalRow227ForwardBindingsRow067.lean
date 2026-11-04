import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow067
import Grothe.UpperChaos.OriginalRow227TriangleForward0932
import Grothe.UpperChaos.OriginalRow227TriangleForward0933
import Grothe.UpperChaos.OriginalRow227TriangleForward0934
import Grothe.UpperChaos.OriginalRow227TriangleForward0935
import Grothe.UpperChaos.OriginalRow227TriangleForward0936
import Grothe.UpperChaos.OriginalRow227TriangleForward0937
import Grothe.UpperChaos.OriginalRow227TriangleForward0938
import Grothe.UpperChaos.OriginalRow227TriangleForward0939
import Grothe.UpperChaos.OriginalRow227TriangleForward0940
import Grothe.UpperChaos.OriginalRow227TriangleForward0941
import Grothe.UpperChaos.OriginalRow227TriangleForward0942
import Grothe.UpperChaos.OriginalRow227TriangleForward0943

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0932 : OriginalRow227TriangleForward0932.entries.size = 32 := rfl

def entry0932 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0932.entries[i.val]'(by rw [size0932]; exact i.isLt)

theorem fields0932 (i : Fin 32) :
    (entry0932 i).IA = shift ∧ (entry0932 i).ID = S (66 + i.val + 1) ∧
      (entry0932 i).IC = S 67 ∧ (entry0932 i).Inext = T 66 (66 + i.val + 1) ∧
      (entry0932 i).Icur = T 66 (66 + i.val) ∧
      (entry0932 i).output = T 67 (66 + i.val) ∧
      (entry0932 i).charge = charge 66 (66 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0948_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0932 (i : Fin 32) :
    forwardStepOK (-768) (charge 66 (66 + i.val)) shift
      (S (66 + i.val + 1)) (S 67) (T 66 (66 + i.val + 1))
      (T 66 (66 + i.val)) (T 67 (66 + i.val))
      (OriginalRow227Roots.root_pos 67 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 66 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0932.entries OriginalRow227TriangleForward0932.checked
    ⟨i.val, by rw [size0932]; exact i.isLt⟩
  change (entry0932 i).check = true at h
  rcases fields0932 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0933 : OriginalRow227TriangleForward0933.entries.size = 32 := rfl

def entry0933 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0933.entries[i.val]'(by rw [size0933]; exact i.isLt)

theorem fields0933 (i : Fin 32) :
    (entry0933 i).IA = shift ∧ (entry0933 i).ID = S (98 + i.val + 1) ∧
      (entry0933 i).IC = S 67 ∧ (entry0933 i).Inext = T 66 (98 + i.val + 1) ∧
      (entry0933 i).Icur = T 66 (98 + i.val) ∧
      (entry0933 i).output = T 67 (98 + i.val) ∧
      (entry0933 i).charge = charge 66 (98 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0949_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0933 (i : Fin 32) :
    forwardStepOK (-768) (charge 66 (98 + i.val)) shift
      (S (98 + i.val + 1)) (S 67) (T 66 (98 + i.val + 1))
      (T 66 (98 + i.val)) (T 67 (98 + i.val))
      (OriginalRow227Roots.root_pos 67 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 66 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0933.entries OriginalRow227TriangleForward0933.checked
    ⟨i.val, by rw [size0933]; exact i.isLt⟩
  change (entry0933 i).check = true at h
  rcases fields0933 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0934 : OriginalRow227TriangleForward0934.entries.size = 32 := rfl

def entry0934 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0934.entries[i.val]'(by rw [size0934]; exact i.isLt)

theorem fields0934 (i : Fin 32) :
    (entry0934 i).IA = shift ∧ (entry0934 i).ID = S (130 + i.val + 1) ∧
      (entry0934 i).IC = S 67 ∧ (entry0934 i).Inext = T 66 (130 + i.val + 1) ∧
      (entry0934 i).Icur = T 66 (130 + i.val) ∧
      (entry0934 i).output = T 67 (130 + i.val) ∧
      (entry0934 i).charge = charge 66 (130 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0950_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0934 (i : Fin 32) :
    forwardStepOK (-768) (charge 66 (130 + i.val)) shift
      (S (130 + i.val + 1)) (S 67) (T 66 (130 + i.val + 1))
      (T 66 (130 + i.val)) (T 67 (130 + i.val))
      (OriginalRow227Roots.root_pos 67 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 66 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0934.entries OriginalRow227TriangleForward0934.checked
    ⟨i.val, by rw [size0934]; exact i.isLt⟩
  change (entry0934 i).check = true at h
  rcases fields0934 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0935 : OriginalRow227TriangleForward0935.entries.size = 32 := rfl

def entry0935 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0935.entries[i.val]'(by rw [size0935]; exact i.isLt)

theorem fields0935 (i : Fin 32) :
    (entry0935 i).IA = shift ∧ (entry0935 i).ID = S (162 + i.val + 1) ∧
      (entry0935 i).IC = S 67 ∧ (entry0935 i).Inext = T 66 (162 + i.val + 1) ∧
      (entry0935 i).Icur = T 66 (162 + i.val) ∧
      (entry0935 i).output = T 67 (162 + i.val) ∧
      (entry0935 i).charge = charge 66 (162 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0951_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0935 (i : Fin 32) :
    forwardStepOK (-768) (charge 66 (162 + i.val)) shift
      (S (162 + i.val + 1)) (S 67) (T 66 (162 + i.val + 1))
      (T 66 (162 + i.val)) (T 67 (162 + i.val))
      (OriginalRow227Roots.root_pos 67 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 66 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0935.entries OriginalRow227TriangleForward0935.checked
    ⟨i.val, by rw [size0935]; exact i.isLt⟩
  change (entry0935 i).check = true at h
  rcases fields0935 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0936 : OriginalRow227TriangleForward0936.entries.size = 32 := rfl

def entry0936 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0936.entries[i.val]'(by rw [size0936]; exact i.isLt)

theorem fields0936 (i : Fin 32) :
    (entry0936 i).IA = shift ∧ (entry0936 i).ID = S (194 + i.val + 1) ∧
      (entry0936 i).IC = S 67 ∧ (entry0936 i).Inext = T 66 (194 + i.val + 1) ∧
      (entry0936 i).Icur = T 66 (194 + i.val) ∧
      (entry0936 i).output = T 67 (194 + i.val) ∧
      (entry0936 i).charge = charge 66 (194 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0952_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0936 (i : Fin 32) :
    forwardStepOK (-768) (charge 66 (194 + i.val)) shift
      (S (194 + i.val + 1)) (S 67) (T 66 (194 + i.val + 1))
      (T 66 (194 + i.val)) (T 67 (194 + i.val))
      (OriginalRow227Roots.root_pos 67 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 66 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0936.entries OriginalRow227TriangleForward0936.checked
    ⟨i.val, by rw [size0936]; exact i.isLt⟩
  change (entry0936 i).check = true at h
  rcases fields0936 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0937 : OriginalRow227TriangleForward0937.entries.size = 32 := rfl

def entry0937 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0937.entries[i.val]'(by rw [size0937]; exact i.isLt)

theorem fields0937 (i : Fin 32) :
    (entry0937 i).IA = shift ∧ (entry0937 i).ID = S (226 + i.val + 1) ∧
      (entry0937 i).IC = S 67 ∧ (entry0937 i).Inext = T 66 (226 + i.val + 1) ∧
      (entry0937 i).Icur = T 66 (226 + i.val) ∧
      (entry0937 i).output = T 67 (226 + i.val) ∧
      (entry0937 i).charge = charge 66 (226 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0953_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0937 (i : Fin 32) :
    forwardStepOK (-768) (charge 66 (226 + i.val)) shift
      (S (226 + i.val + 1)) (S 67) (T 66 (226 + i.val + 1))
      (T 66 (226 + i.val)) (T 67 (226 + i.val))
      (OriginalRow227Roots.root_pos 67 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 66 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0937.entries OriginalRow227TriangleForward0937.checked
    ⟨i.val, by rw [size0937]; exact i.isLt⟩
  change (entry0937 i).check = true at h
  rcases fields0937 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0938 : OriginalRow227TriangleForward0938.entries.size = 32 := rfl

def entry0938 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0938.entries[i.val]'(by rw [size0938]; exact i.isLt)

theorem fields0938 (i : Fin 32) :
    (entry0938 i).IA = shift ∧ (entry0938 i).ID = S (258 + i.val + 1) ∧
      (entry0938 i).IC = S 67 ∧ (entry0938 i).Inext = T 66 (258 + i.val + 1) ∧
      (entry0938 i).Icur = T 66 (258 + i.val) ∧
      (entry0938 i).output = T 67 (258 + i.val) ∧
      (entry0938 i).charge = charge 66 (258 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0954_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0938 (i : Fin 32) :
    forwardStepOK (-768) (charge 66 (258 + i.val)) shift
      (S (258 + i.val + 1)) (S 67) (T 66 (258 + i.val + 1))
      (T 66 (258 + i.val)) (T 67 (258 + i.val))
      (OriginalRow227Roots.root_pos 67 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 66 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0938.entries OriginalRow227TriangleForward0938.checked
    ⟨i.val, by rw [size0938]; exact i.isLt⟩
  change (entry0938 i).check = true at h
  rcases fields0938 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0939 : OriginalRow227TriangleForward0939.entries.size = 32 := rfl

def entry0939 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0939.entries[i.val]'(by rw [size0939]; exact i.isLt)

theorem fields0939 (i : Fin 32) :
    (entry0939 i).IA = shift ∧ (entry0939 i).ID = S (290 + i.val + 1) ∧
      (entry0939 i).IC = S 67 ∧ (entry0939 i).Inext = T 66 (290 + i.val + 1) ∧
      (entry0939 i).Icur = T 66 (290 + i.val) ∧
      (entry0939 i).output = T 67 (290 + i.val) ∧
      (entry0939 i).charge = charge 66 (290 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0955_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0939 (i : Fin 32) :
    forwardStepOK (-768) (charge 66 (290 + i.val)) shift
      (S (290 + i.val + 1)) (S 67) (T 66 (290 + i.val + 1))
      (T 66 (290 + i.val)) (T 67 (290 + i.val))
      (OriginalRow227Roots.root_pos 67 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 66 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0939.entries OriginalRow227TriangleForward0939.checked
    ⟨i.val, by rw [size0939]; exact i.isLt⟩
  change (entry0939 i).check = true at h
  rcases fields0939 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0940 : OriginalRow227TriangleForward0940.entries.size = 32 := rfl

def entry0940 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0940.entries[i.val]'(by rw [size0940]; exact i.isLt)

theorem fields0940 (i : Fin 32) :
    (entry0940 i).IA = shift ∧ (entry0940 i).ID = S (322 + i.val + 1) ∧
      (entry0940 i).IC = S 67 ∧ (entry0940 i).Inext = T 66 (322 + i.val + 1) ∧
      (entry0940 i).Icur = T 66 (322 + i.val) ∧
      (entry0940 i).output = T 67 (322 + i.val) ∧
      (entry0940 i).charge = charge 66 (322 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0956_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0940 (i : Fin 32) :
    forwardStepOK (-768) (charge 66 (322 + i.val)) shift
      (S (322 + i.val + 1)) (S 67) (T 66 (322 + i.val + 1))
      (T 66 (322 + i.val)) (T 67 (322 + i.val))
      (OriginalRow227Roots.root_pos 67 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 66 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0940.entries OriginalRow227TriangleForward0940.checked
    ⟨i.val, by rw [size0940]; exact i.isLt⟩
  change (entry0940 i).check = true at h
  rcases fields0940 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0941 : OriginalRow227TriangleForward0941.entries.size = 32 := rfl

def entry0941 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0941.entries[i.val]'(by rw [size0941]; exact i.isLt)

theorem fields0941 (i : Fin 32) :
    (entry0941 i).IA = shift ∧ (entry0941 i).ID = S (354 + i.val + 1) ∧
      (entry0941 i).IC = S 67 ∧ (entry0941 i).Inext = T 66 (354 + i.val + 1) ∧
      (entry0941 i).Icur = T 66 (354 + i.val) ∧
      (entry0941 i).output = T 67 (354 + i.val) ∧
      (entry0941 i).charge = charge 66 (354 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0957_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0941 (i : Fin 32) :
    forwardStepOK (-768) (charge 66 (354 + i.val)) shift
      (S (354 + i.val + 1)) (S 67) (T 66 (354 + i.val + 1))
      (T 66 (354 + i.val)) (T 67 (354 + i.val))
      (OriginalRow227Roots.root_pos 67 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 66 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0941.entries OriginalRow227TriangleForward0941.checked
    ⟨i.val, by rw [size0941]; exact i.isLt⟩
  change (entry0941 i).check = true at h
  rcases fields0941 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0942 : OriginalRow227TriangleForward0942.entries.size = 32 := rfl

def entry0942 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0942.entries[i.val]'(by rw [size0942]; exact i.isLt)

theorem fields0942 (i : Fin 32) :
    (entry0942 i).IA = shift ∧ (entry0942 i).ID = S (386 + i.val + 1) ∧
      (entry0942 i).IC = S 67 ∧ (entry0942 i).Inext = T 66 (386 + i.val + 1) ∧
      (entry0942 i).Icur = T 66 (386 + i.val) ∧
      (entry0942 i).output = T 67 (386 + i.val) ∧
      (entry0942 i).charge = charge 66 (386 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0958_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0942 (i : Fin 32) :
    forwardStepOK (-768) (charge 66 (386 + i.val)) shift
      (S (386 + i.val + 1)) (S 67) (T 66 (386 + i.val + 1))
      (T 66 (386 + i.val)) (T 67 (386 + i.val))
      (OriginalRow227Roots.root_pos 67 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 66 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0942.entries OriginalRow227TriangleForward0942.checked
    ⟨i.val, by rw [size0942]; exact i.isLt⟩
  change (entry0942 i).check = true at h
  rcases fields0942 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0943 : OriginalRow227TriangleForward0943.entries.size = 17 := rfl

def entry0943 (i : Fin 17) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0943.entries[i.val]'(by rw [size0943]; exact i.isLt)

theorem fields0943 (i : Fin 17) :
    (entry0943 i).IA = shift ∧ (entry0943 i).ID = S (418 + i.val + 1) ∧
      (entry0943 i).IC = S 67 ∧ (entry0943 i).Inext = T 66 (418 + i.val + 1) ∧
      (entry0943 i).Icur = T 66 (418 + i.val) ∧
      (entry0943 i).output = T 67 (418 + i.val) ∧
      (entry0943 i).charge = charge 66 (418 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings02.S_eq_root67).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow067.block0959_value ⟨16, by decide⟩).symm, rfl⟩

theorem step0943 (i : Fin 17) :
    forwardStepOK (-768) (charge 66 (418 + i.val)) shift
      (S (418 + i.val + 1)) (S 67) (T 66 (418 + i.val + 1))
      (T 66 (418 + i.val)) (T 67 (418 + i.val))
      (OriginalRow227Roots.root_pos 67 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 66 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0943.entries OriginalRow227TriangleForward0943.checked
    ⟨i.val, by rw [size0943]; exact i.isLt⟩
  change (entry0943 i).check = true at h
  rcases fields0943 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 66 ≤ d) (hhi : d < 435) :
    forwardStepOK (-768) (charge 66 d) shift (S (d + 1)) (S 67)
      (T 66 (d + 1)) (T 66 d) (T 67 d)
      (OriginalRow227Roots.root_pos 67 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 66 (by decide)) = true := by
  by_cases h258 : d < 258
  ·
    by_cases h162 : d < 162
    ·
      by_cases h98 : d < 98
      ·
        have hi : d - 66 < 32 := by omega
        have heq : 66 + (d - 66) = d := by omega
        simpa only [heq] using step0932 ⟨d - 66, hi⟩
      ·
        by_cases h130 : d < 130
        ·
          have hi : d - 98 < 32 := by omega
          have heq : 98 + (d - 98) = d := by omega
          simpa only [heq] using step0933 ⟨d - 98, hi⟩
        ·
          have hi : d - 130 < 32 := by omega
          have heq : 130 + (d - 130) = d := by omega
          simpa only [heq] using step0934 ⟨d - 130, hi⟩
    ·
      by_cases h194 : d < 194
      ·
        have hi : d - 162 < 32 := by omega
        have heq : 162 + (d - 162) = d := by omega
        simpa only [heq] using step0935 ⟨d - 162, hi⟩
      ·
        by_cases h226 : d < 226
        ·
          have hi : d - 194 < 32 := by omega
          have heq : 194 + (d - 194) = d := by omega
          simpa only [heq] using step0936 ⟨d - 194, hi⟩
        ·
          have hi : d - 226 < 32 := by omega
          have heq : 226 + (d - 226) = d := by omega
          simpa only [heq] using step0937 ⟨d - 226, hi⟩
  ·
    by_cases h354 : d < 354
    ·
      by_cases h290 : d < 290
      ·
        have hi : d - 258 < 32 := by omega
        have heq : 258 + (d - 258) = d := by omega
        simpa only [heq] using step0938 ⟨d - 258, hi⟩
      ·
        by_cases h322 : d < 322
        ·
          have hi : d - 290 < 32 := by omega
          have heq : 290 + (d - 290) = d := by omega
          simpa only [heq] using step0939 ⟨d - 290, hi⟩
        ·
          have hi : d - 322 < 32 := by omega
          have heq : 322 + (d - 322) = d := by omega
          simpa only [heq] using step0940 ⟨d - 322, hi⟩
    ·
      by_cases h386 : d < 386
      ·
        have hi : d - 354 < 32 := by omega
        have heq : 354 + (d - 354) = d := by omega
        simpa only [heq] using step0941 ⟨d - 354, hi⟩
      ·
        by_cases h418 : d < 418
        ·
          have hi : d - 386 < 32 := by omega
          have heq : 386 + (d - 386) = d := by omega
          simpa only [heq] using step0942 ⟨d - 386, hi⟩
        ·
          have hi : d - 418 < 17 := by omega
          have heq : 418 + (d - 418) = d := by omega
          simpa only [heq] using step0943 ⟨d - 418, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.fields0932,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.step0932,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.fields0933,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.step0933,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.fields0934,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.step0934,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.fields0935,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.step0935,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.fields0936,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.step0936,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.fields0937,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.step0937,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.fields0938,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.step0938,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.fields0939,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.step0939,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.fields0940,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.step0940,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.fields0941,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.step0941,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.fields0942,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.step0942,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.fields0943,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.step0943,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow067
