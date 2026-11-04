import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065
import Grothe.UpperChaos.OriginalRow227TriangleForward0908
import Grothe.UpperChaos.OriginalRow227TriangleForward0909
import Grothe.UpperChaos.OriginalRow227TriangleForward0910
import Grothe.UpperChaos.OriginalRow227TriangleForward0911
import Grothe.UpperChaos.OriginalRow227TriangleForward0912
import Grothe.UpperChaos.OriginalRow227TriangleForward0913
import Grothe.UpperChaos.OriginalRow227TriangleForward0914
import Grothe.UpperChaos.OriginalRow227TriangleForward0915
import Grothe.UpperChaos.OriginalRow227TriangleForward0916
import Grothe.UpperChaos.OriginalRow227TriangleForward0917
import Grothe.UpperChaos.OriginalRow227TriangleForward0918
import Grothe.UpperChaos.OriginalRow227TriangleForward0919

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0908 : OriginalRow227TriangleForward0908.entries.size = 32 := rfl

def entry0908 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0908.entries[i.val]'(by rw [size0908]; exact i.isLt)

theorem fields0908 (i : Fin 32) :
    (entry0908 i).IA = shift ∧ (entry0908 i).ID = S (64 + i.val + 1) ∧
      (entry0908 i).IC = S 65 ∧ (entry0908 i).Inext = T 64 (64 + i.val + 1) ∧
      (entry0908 i).Icur = T 64 (64 + i.val) ∧
      (entry0908 i).output = T 65 (64 + i.val) ∧
      (entry0908 i).charge = charge 64 (64 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0908 (i : Fin 32) :
    forwardStepOK (-768) (charge 64 (64 + i.val)) shift
      (S (64 + i.val + 1)) (S 65) (T 64 (64 + i.val + 1))
      (T 64 (64 + i.val)) (T 65 (64 + i.val))
      (OriginalRow227Roots.root_pos 65 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 64 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0908.entries OriginalRow227TriangleForward0908.checked
    ⟨i.val, by rw [size0908]; exact i.isLt⟩
  change (entry0908 i).check = true at h
  rcases fields0908 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0909 : OriginalRow227TriangleForward0909.entries.size = 32 := rfl

def entry0909 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0909.entries[i.val]'(by rw [size0909]; exact i.isLt)

theorem fields0909 (i : Fin 32) :
    (entry0909 i).IA = shift ∧ (entry0909 i).ID = S (96 + i.val + 1) ∧
      (entry0909 i).IC = S 65 ∧ (entry0909 i).Inext = T 64 (96 + i.val + 1) ∧
      (entry0909 i).Icur = T 64 (96 + i.val) ∧
      (entry0909 i).output = T 65 (96 + i.val) ∧
      (entry0909 i).charge = charge 64 (96 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0909 (i : Fin 32) :
    forwardStepOK (-768) (charge 64 (96 + i.val)) shift
      (S (96 + i.val + 1)) (S 65) (T 64 (96 + i.val + 1))
      (T 64 (96 + i.val)) (T 65 (96 + i.val))
      (OriginalRow227Roots.root_pos 65 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 64 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0909.entries OriginalRow227TriangleForward0909.checked
    ⟨i.val, by rw [size0909]; exact i.isLt⟩
  change (entry0909 i).check = true at h
  rcases fields0909 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0910 : OriginalRow227TriangleForward0910.entries.size = 32 := rfl

def entry0910 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0910.entries[i.val]'(by rw [size0910]; exact i.isLt)

theorem fields0910 (i : Fin 32) :
    (entry0910 i).IA = shift ∧ (entry0910 i).ID = S (128 + i.val + 1) ∧
      (entry0910 i).IC = S 65 ∧ (entry0910 i).Inext = T 64 (128 + i.val + 1) ∧
      (entry0910 i).Icur = T 64 (128 + i.val) ∧
      (entry0910 i).output = T 65 (128 + i.val) ∧
      (entry0910 i).charge = charge 64 (128 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0910 (i : Fin 32) :
    forwardStepOK (-768) (charge 64 (128 + i.val)) shift
      (S (128 + i.val + 1)) (S 65) (T 64 (128 + i.val + 1))
      (T 64 (128 + i.val)) (T 65 (128 + i.val))
      (OriginalRow227Roots.root_pos 65 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 64 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0910.entries OriginalRow227TriangleForward0910.checked
    ⟨i.val, by rw [size0910]; exact i.isLt⟩
  change (entry0910 i).check = true at h
  rcases fields0910 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0911 : OriginalRow227TriangleForward0911.entries.size = 32 := rfl

def entry0911 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0911.entries[i.val]'(by rw [size0911]; exact i.isLt)

theorem fields0911 (i : Fin 32) :
    (entry0911 i).IA = shift ∧ (entry0911 i).ID = S (160 + i.val + 1) ∧
      (entry0911 i).IC = S 65 ∧ (entry0911 i).Inext = T 64 (160 + i.val + 1) ∧
      (entry0911 i).Icur = T 64 (160 + i.val) ∧
      (entry0911 i).output = T 65 (160 + i.val) ∧
      (entry0911 i).charge = charge 64 (160 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0911 (i : Fin 32) :
    forwardStepOK (-768) (charge 64 (160 + i.val)) shift
      (S (160 + i.val + 1)) (S 65) (T 64 (160 + i.val + 1))
      (T 64 (160 + i.val)) (T 65 (160 + i.val))
      (OriginalRow227Roots.root_pos 65 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 64 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0911.entries OriginalRow227TriangleForward0911.checked
    ⟨i.val, by rw [size0911]; exact i.isLt⟩
  change (entry0911 i).check = true at h
  rcases fields0911 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0912 : OriginalRow227TriangleForward0912.entries.size = 32 := rfl

def entry0912 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0912.entries[i.val]'(by rw [size0912]; exact i.isLt)

theorem fields0912 (i : Fin 32) :
    (entry0912 i).IA = shift ∧ (entry0912 i).ID = S (192 + i.val + 1) ∧
      (entry0912 i).IC = S 65 ∧ (entry0912 i).Inext = T 64 (192 + i.val + 1) ∧
      (entry0912 i).Icur = T 64 (192 + i.val) ∧
      (entry0912 i).output = T 65 (192 + i.val) ∧
      (entry0912 i).charge = charge 64 (192 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0912 (i : Fin 32) :
    forwardStepOK (-768) (charge 64 (192 + i.val)) shift
      (S (192 + i.val + 1)) (S 65) (T 64 (192 + i.val + 1))
      (T 64 (192 + i.val)) (T 65 (192 + i.val))
      (OriginalRow227Roots.root_pos 65 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 64 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0912.entries OriginalRow227TriangleForward0912.checked
    ⟨i.val, by rw [size0912]; exact i.isLt⟩
  change (entry0912 i).check = true at h
  rcases fields0912 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0913 : OriginalRow227TriangleForward0913.entries.size = 32 := rfl

def entry0913 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0913.entries[i.val]'(by rw [size0913]; exact i.isLt)

theorem fields0913 (i : Fin 32) :
    (entry0913 i).IA = shift ∧ (entry0913 i).ID = S (224 + i.val + 1) ∧
      (entry0913 i).IC = S 65 ∧ (entry0913 i).Inext = T 64 (224 + i.val + 1) ∧
      (entry0913 i).Icur = T 64 (224 + i.val) ∧
      (entry0913 i).output = T 65 (224 + i.val) ∧
      (entry0913 i).charge = charge 64 (224 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0913 (i : Fin 32) :
    forwardStepOK (-768) (charge 64 (224 + i.val)) shift
      (S (224 + i.val + 1)) (S 65) (T 64 (224 + i.val + 1))
      (T 64 (224 + i.val)) (T 65 (224 + i.val))
      (OriginalRow227Roots.root_pos 65 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 64 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0913.entries OriginalRow227TriangleForward0913.checked
    ⟨i.val, by rw [size0913]; exact i.isLt⟩
  change (entry0913 i).check = true at h
  rcases fields0913 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0914 : OriginalRow227TriangleForward0914.entries.size = 32 := rfl

def entry0914 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0914.entries[i.val]'(by rw [size0914]; exact i.isLt)

theorem fields0914 (i : Fin 32) :
    (entry0914 i).IA = shift ∧ (entry0914 i).ID = S (256 + i.val + 1) ∧
      (entry0914 i).IC = S 65 ∧ (entry0914 i).Inext = T 64 (256 + i.val + 1) ∧
      (entry0914 i).Icur = T 64 (256 + i.val) ∧
      (entry0914 i).output = T 65 (256 + i.val) ∧
      (entry0914 i).charge = charge 64 (256 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0914 (i : Fin 32) :
    forwardStepOK (-768) (charge 64 (256 + i.val)) shift
      (S (256 + i.val + 1)) (S 65) (T 64 (256 + i.val + 1))
      (T 64 (256 + i.val)) (T 65 (256 + i.val))
      (OriginalRow227Roots.root_pos 65 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 64 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0914.entries OriginalRow227TriangleForward0914.checked
    ⟨i.val, by rw [size0914]; exact i.isLt⟩
  change (entry0914 i).check = true at h
  rcases fields0914 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0915 : OriginalRow227TriangleForward0915.entries.size = 32 := rfl

def entry0915 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0915.entries[i.val]'(by rw [size0915]; exact i.isLt)

theorem fields0915 (i : Fin 32) :
    (entry0915 i).IA = shift ∧ (entry0915 i).ID = S (288 + i.val + 1) ∧
      (entry0915 i).IC = S 65 ∧ (entry0915 i).Inext = T 64 (288 + i.val + 1) ∧
      (entry0915 i).Icur = T 64 (288 + i.val) ∧
      (entry0915 i).output = T 65 (288 + i.val) ∧
      (entry0915 i).charge = charge 64 (288 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0915 (i : Fin 32) :
    forwardStepOK (-768) (charge 64 (288 + i.val)) shift
      (S (288 + i.val + 1)) (S 65) (T 64 (288 + i.val + 1))
      (T 64 (288 + i.val)) (T 65 (288 + i.val))
      (OriginalRow227Roots.root_pos 65 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 64 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0915.entries OriginalRow227TriangleForward0915.checked
    ⟨i.val, by rw [size0915]; exact i.isLt⟩
  change (entry0915 i).check = true at h
  rcases fields0915 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0916 : OriginalRow227TriangleForward0916.entries.size = 32 := rfl

def entry0916 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0916.entries[i.val]'(by rw [size0916]; exact i.isLt)

theorem fields0916 (i : Fin 32) :
    (entry0916 i).IA = shift ∧ (entry0916 i).ID = S (320 + i.val + 1) ∧
      (entry0916 i).IC = S 65 ∧ (entry0916 i).Inext = T 64 (320 + i.val + 1) ∧
      (entry0916 i).Icur = T 64 (320 + i.val) ∧
      (entry0916 i).output = T 65 (320 + i.val) ∧
      (entry0916 i).charge = charge 64 (320 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0916 (i : Fin 32) :
    forwardStepOK (-768) (charge 64 (320 + i.val)) shift
      (S (320 + i.val + 1)) (S 65) (T 64 (320 + i.val + 1))
      (T 64 (320 + i.val)) (T 65 (320 + i.val))
      (OriginalRow227Roots.root_pos 65 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 64 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0916.entries OriginalRow227TriangleForward0916.checked
    ⟨i.val, by rw [size0916]; exact i.isLt⟩
  change (entry0916 i).check = true at h
  rcases fields0916 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0917 : OriginalRow227TriangleForward0917.entries.size = 32 := rfl

def entry0917 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0917.entries[i.val]'(by rw [size0917]; exact i.isLt)

theorem fields0917 (i : Fin 32) :
    (entry0917 i).IA = shift ∧ (entry0917 i).ID = S (352 + i.val + 1) ∧
      (entry0917 i).IC = S 65 ∧ (entry0917 i).Inext = T 64 (352 + i.val + 1) ∧
      (entry0917 i).Icur = T 64 (352 + i.val) ∧
      (entry0917 i).output = T 65 (352 + i.val) ∧
      (entry0917 i).charge = charge 64 (352 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0917 (i : Fin 32) :
    forwardStepOK (-768) (charge 64 (352 + i.val)) shift
      (S (352 + i.val + 1)) (S 65) (T 64 (352 + i.val + 1))
      (T 64 (352 + i.val)) (T 65 (352 + i.val))
      (OriginalRow227Roots.root_pos 65 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 64 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0917.entries OriginalRow227TriangleForward0917.checked
    ⟨i.val, by rw [size0917]; exact i.isLt⟩
  change (entry0917 i).check = true at h
  rcases fields0917 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0918 : OriginalRow227TriangleForward0918.entries.size = 32 := rfl

def entry0918 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0918.entries[i.val]'(by rw [size0918]; exact i.isLt)

theorem fields0918 (i : Fin 32) :
    (entry0918 i).IA = shift ∧ (entry0918 i).ID = S (384 + i.val + 1) ∧
      (entry0918 i).IC = S 65 ∧ (entry0918 i).Inext = T 64 (384 + i.val + 1) ∧
      (entry0918 i).Icur = T 64 (384 + i.val) ∧
      (entry0918 i).output = T 65 (384 + i.val) ∧
      (entry0918 i).charge = charge 64 (384 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0918 (i : Fin 32) :
    forwardStepOK (-768) (charge 64 (384 + i.val)) shift
      (S (384 + i.val + 1)) (S 65) (T 64 (384 + i.val + 1))
      (T 64 (384 + i.val)) (T 65 (384 + i.val))
      (OriginalRow227Roots.root_pos 65 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 64 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0918.entries OriginalRow227TriangleForward0918.checked
    ⟨i.val, by rw [size0918]; exact i.isLt⟩
  change (entry0918 i).check = true at h
  rcases fields0918 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0919 : OriginalRow227TriangleForward0919.entries.size = 21 := rfl

def entry0919 (i : Fin 21) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0919.entries[i.val]'(by rw [size0919]; exact i.isLt)

theorem fields0919 (i : Fin 21) :
    (entry0919 i).IA = shift ∧ (entry0919 i).ID = S (416 + i.val + 1) ∧
      (entry0919 i).IC = S 65 ∧ (entry0919 i).Inext = T 64 (416 + i.val + 1) ∧
      (entry0919 i).Icur = T 64 (416 + i.val) ∧
      (entry0919 i).output = T 65 (416 + i.val) ∧
      (entry0919 i).charge = charge 64 (416 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings02.S_eq_root65).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨20, by decide⟩).symm, rfl⟩

theorem step0919 (i : Fin 21) :
    forwardStepOK (-768) (charge 64 (416 + i.val)) shift
      (S (416 + i.val + 1)) (S 65) (T 64 (416 + i.val + 1))
      (T 64 (416 + i.val)) (T 65 (416 + i.val))
      (OriginalRow227Roots.root_pos 65 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 64 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0919.entries OriginalRow227TriangleForward0919.checked
    ⟨i.val, by rw [size0919]; exact i.isLt⟩
  change (entry0919 i).check = true at h
  rcases fields0919 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 64 ≤ d) (hhi : d < 437) :
    forwardStepOK (-768) (charge 64 d) shift (S (d + 1)) (S 65)
      (T 64 (d + 1)) (T 64 d) (T 65 d)
      (OriginalRow227Roots.root_pos 65 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 64 (by decide)) = true := by
  by_cases h256 : d < 256
  ·
    by_cases h160 : d < 160
    ·
      by_cases h96 : d < 96
      ·
        have hi : d - 64 < 32 := by omega
        have heq : 64 + (d - 64) = d := by omega
        simpa only [heq] using step0908 ⟨d - 64, hi⟩
      ·
        by_cases h128 : d < 128
        ·
          have hi : d - 96 < 32 := by omega
          have heq : 96 + (d - 96) = d := by omega
          simpa only [heq] using step0909 ⟨d - 96, hi⟩
        ·
          have hi : d - 128 < 32 := by omega
          have heq : 128 + (d - 128) = d := by omega
          simpa only [heq] using step0910 ⟨d - 128, hi⟩
    ·
      by_cases h192 : d < 192
      ·
        have hi : d - 160 < 32 := by omega
        have heq : 160 + (d - 160) = d := by omega
        simpa only [heq] using step0911 ⟨d - 160, hi⟩
      ·
        by_cases h224 : d < 224
        ·
          have hi : d - 192 < 32 := by omega
          have heq : 192 + (d - 192) = d := by omega
          simpa only [heq] using step0912 ⟨d - 192, hi⟩
        ·
          have hi : d - 224 < 32 := by omega
          have heq : 224 + (d - 224) = d := by omega
          simpa only [heq] using step0913 ⟨d - 224, hi⟩
  ·
    by_cases h352 : d < 352
    ·
      by_cases h288 : d < 288
      ·
        have hi : d - 256 < 32 := by omega
        have heq : 256 + (d - 256) = d := by omega
        simpa only [heq] using step0914 ⟨d - 256, hi⟩
      ·
        by_cases h320 : d < 320
        ·
          have hi : d - 288 < 32 := by omega
          have heq : 288 + (d - 288) = d := by omega
          simpa only [heq] using step0915 ⟨d - 288, hi⟩
        ·
          have hi : d - 320 < 32 := by omega
          have heq : 320 + (d - 320) = d := by omega
          simpa only [heq] using step0916 ⟨d - 320, hi⟩
    ·
      by_cases h384 : d < 384
      ·
        have hi : d - 352 < 32 := by omega
        have heq : 352 + (d - 352) = d := by omega
        simpa only [heq] using step0917 ⟨d - 352, hi⟩
      ·
        by_cases h416 : d < 416
        ·
          have hi : d - 384 < 32 := by omega
          have heq : 384 + (d - 384) = d := by omega
          simpa only [heq] using step0918 ⟨d - 384, hi⟩
        ·
          have hi : d - 416 < 21 := by omega
          have heq : 416 + (d - 416) = d := by omega
          simpa only [heq] using step0919 ⟨d - 416, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.fields0908,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.step0908,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.fields0909,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.step0909,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.fields0910,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.step0910,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.fields0911,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.step0911,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.fields0912,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.step0912,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.fields0913,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.step0913,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.fields0914,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.step0914,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.fields0915,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.step0915,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.fields0916,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.step0916,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.fields0917,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.step0917,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.fields0918,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.step0918,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.fields0919,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.step0919,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow065
