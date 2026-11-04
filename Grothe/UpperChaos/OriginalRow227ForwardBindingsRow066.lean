import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow065
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow066
import Grothe.UpperChaos.OriginalRow227TriangleForward0920
import Grothe.UpperChaos.OriginalRow227TriangleForward0921
import Grothe.UpperChaos.OriginalRow227TriangleForward0922
import Grothe.UpperChaos.OriginalRow227TriangleForward0923
import Grothe.UpperChaos.OriginalRow227TriangleForward0924
import Grothe.UpperChaos.OriginalRow227TriangleForward0925
import Grothe.UpperChaos.OriginalRow227TriangleForward0926
import Grothe.UpperChaos.OriginalRow227TriangleForward0927
import Grothe.UpperChaos.OriginalRow227TriangleForward0928
import Grothe.UpperChaos.OriginalRow227TriangleForward0929
import Grothe.UpperChaos.OriginalRow227TriangleForward0930
import Grothe.UpperChaos.OriginalRow227TriangleForward0931

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0920 : OriginalRow227TriangleForward0920.entries.size = 32 := rfl

def entry0920 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0920.entries[i.val]'(by rw [size0920]; exact i.isLt)

theorem fields0920 (i : Fin 32) :
    (entry0920 i).IA = shift ∧ (entry0920 i).ID = S (65 + i.val + 1) ∧
      (entry0920 i).IC = S 66 ∧ (entry0920 i).Inext = T 65 (65 + i.val + 1) ∧
      (entry0920 i).Icur = T 65 (65 + i.val) ∧
      (entry0920 i).output = T 66 (65 + i.val) ∧
      (entry0920 i).charge = charge 65 (65 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0924_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0936_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0920 (i : Fin 32) :
    forwardStepOK (-768) (charge 65 (65 + i.val)) shift
      (S (65 + i.val + 1)) (S 66) (T 65 (65 + i.val + 1))
      (T 65 (65 + i.val)) (T 66 (65 + i.val))
      (OriginalRow227Roots.root_pos 66 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 65 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0920.entries OriginalRow227TriangleForward0920.checked
    ⟨i.val, by rw [size0920]; exact i.isLt⟩
  change (entry0920 i).check = true at h
  rcases fields0920 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0921 : OriginalRow227TriangleForward0921.entries.size = 32 := rfl

def entry0921 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0921.entries[i.val]'(by rw [size0921]; exact i.isLt)

theorem fields0921 (i : Fin 32) :
    (entry0921 i).IA = shift ∧ (entry0921 i).ID = S (97 + i.val + 1) ∧
      (entry0921 i).IC = S 66 ∧ (entry0921 i).Inext = T 65 (97 + i.val + 1) ∧
      (entry0921 i).Icur = T 65 (97 + i.val) ∧
      (entry0921 i).output = T 66 (97 + i.val) ∧
      (entry0921 i).charge = charge 65 (97 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0925_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0937_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0921 (i : Fin 32) :
    forwardStepOK (-768) (charge 65 (97 + i.val)) shift
      (S (97 + i.val + 1)) (S 66) (T 65 (97 + i.val + 1))
      (T 65 (97 + i.val)) (T 66 (97 + i.val))
      (OriginalRow227Roots.root_pos 66 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 65 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0921.entries OriginalRow227TriangleForward0921.checked
    ⟨i.val, by rw [size0921]; exact i.isLt⟩
  change (entry0921 i).check = true at h
  rcases fields0921 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0922 : OriginalRow227TriangleForward0922.entries.size = 32 := rfl

def entry0922 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0922.entries[i.val]'(by rw [size0922]; exact i.isLt)

theorem fields0922 (i : Fin 32) :
    (entry0922 i).IA = shift ∧ (entry0922 i).ID = S (129 + i.val + 1) ∧
      (entry0922 i).IC = S 66 ∧ (entry0922 i).Inext = T 65 (129 + i.val + 1) ∧
      (entry0922 i).Icur = T 65 (129 + i.val) ∧
      (entry0922 i).output = T 66 (129 + i.val) ∧
      (entry0922 i).charge = charge 65 (129 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0926_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0938_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0922 (i : Fin 32) :
    forwardStepOK (-768) (charge 65 (129 + i.val)) shift
      (S (129 + i.val + 1)) (S 66) (T 65 (129 + i.val + 1))
      (T 65 (129 + i.val)) (T 66 (129 + i.val))
      (OriginalRow227Roots.root_pos 66 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 65 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0922.entries OriginalRow227TriangleForward0922.checked
    ⟨i.val, by rw [size0922]; exact i.isLt⟩
  change (entry0922 i).check = true at h
  rcases fields0922 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0923 : OriginalRow227TriangleForward0923.entries.size = 32 := rfl

def entry0923 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0923.entries[i.val]'(by rw [size0923]; exact i.isLt)

theorem fields0923 (i : Fin 32) :
    (entry0923 i).IA = shift ∧ (entry0923 i).ID = S (161 + i.val + 1) ∧
      (entry0923 i).IC = S 66 ∧ (entry0923 i).Inext = T 65 (161 + i.val + 1) ∧
      (entry0923 i).Icur = T 65 (161 + i.val) ∧
      (entry0923 i).output = T 66 (161 + i.val) ∧
      (entry0923 i).charge = charge 65 (161 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0927_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0939_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0923 (i : Fin 32) :
    forwardStepOK (-768) (charge 65 (161 + i.val)) shift
      (S (161 + i.val + 1)) (S 66) (T 65 (161 + i.val + 1))
      (T 65 (161 + i.val)) (T 66 (161 + i.val))
      (OriginalRow227Roots.root_pos 66 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 65 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0923.entries OriginalRow227TriangleForward0923.checked
    ⟨i.val, by rw [size0923]; exact i.isLt⟩
  change (entry0923 i).check = true at h
  rcases fields0923 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0924 : OriginalRow227TriangleForward0924.entries.size = 32 := rfl

def entry0924 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0924.entries[i.val]'(by rw [size0924]; exact i.isLt)

theorem fields0924 (i : Fin 32) :
    (entry0924 i).IA = shift ∧ (entry0924 i).ID = S (193 + i.val + 1) ∧
      (entry0924 i).IC = S 66 ∧ (entry0924 i).Inext = T 65 (193 + i.val + 1) ∧
      (entry0924 i).Icur = T 65 (193 + i.val) ∧
      (entry0924 i).output = T 66 (193 + i.val) ∧
      (entry0924 i).charge = charge 65 (193 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0928_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0940_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0924 (i : Fin 32) :
    forwardStepOK (-768) (charge 65 (193 + i.val)) shift
      (S (193 + i.val + 1)) (S 66) (T 65 (193 + i.val + 1))
      (T 65 (193 + i.val)) (T 66 (193 + i.val))
      (OriginalRow227Roots.root_pos 66 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 65 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0924.entries OriginalRow227TriangleForward0924.checked
    ⟨i.val, by rw [size0924]; exact i.isLt⟩
  change (entry0924 i).check = true at h
  rcases fields0924 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0925 : OriginalRow227TriangleForward0925.entries.size = 32 := rfl

def entry0925 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0925.entries[i.val]'(by rw [size0925]; exact i.isLt)

theorem fields0925 (i : Fin 32) :
    (entry0925 i).IA = shift ∧ (entry0925 i).ID = S (225 + i.val + 1) ∧
      (entry0925 i).IC = S 66 ∧ (entry0925 i).Inext = T 65 (225 + i.val + 1) ∧
      (entry0925 i).Icur = T 65 (225 + i.val) ∧
      (entry0925 i).output = T 66 (225 + i.val) ∧
      (entry0925 i).charge = charge 65 (225 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0929_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0941_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0925 (i : Fin 32) :
    forwardStepOK (-768) (charge 65 (225 + i.val)) shift
      (S (225 + i.val + 1)) (S 66) (T 65 (225 + i.val + 1))
      (T 65 (225 + i.val)) (T 66 (225 + i.val))
      (OriginalRow227Roots.root_pos 66 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 65 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0925.entries OriginalRow227TriangleForward0925.checked
    ⟨i.val, by rw [size0925]; exact i.isLt⟩
  change (entry0925 i).check = true at h
  rcases fields0925 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0926 : OriginalRow227TriangleForward0926.entries.size = 32 := rfl

def entry0926 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0926.entries[i.val]'(by rw [size0926]; exact i.isLt)

theorem fields0926 (i : Fin 32) :
    (entry0926 i).IA = shift ∧ (entry0926 i).ID = S (257 + i.val + 1) ∧
      (entry0926 i).IC = S 66 ∧ (entry0926 i).Inext = T 65 (257 + i.val + 1) ∧
      (entry0926 i).Icur = T 65 (257 + i.val) ∧
      (entry0926 i).output = T 66 (257 + i.val) ∧
      (entry0926 i).charge = charge 65 (257 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0930_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0942_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0926 (i : Fin 32) :
    forwardStepOK (-768) (charge 65 (257 + i.val)) shift
      (S (257 + i.val + 1)) (S 66) (T 65 (257 + i.val + 1))
      (T 65 (257 + i.val)) (T 66 (257 + i.val))
      (OriginalRow227Roots.root_pos 66 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 65 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0926.entries OriginalRow227TriangleForward0926.checked
    ⟨i.val, by rw [size0926]; exact i.isLt⟩
  change (entry0926 i).check = true at h
  rcases fields0926 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0927 : OriginalRow227TriangleForward0927.entries.size = 32 := rfl

def entry0927 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0927.entries[i.val]'(by rw [size0927]; exact i.isLt)

theorem fields0927 (i : Fin 32) :
    (entry0927 i).IA = shift ∧ (entry0927 i).ID = S (289 + i.val + 1) ∧
      (entry0927 i).IC = S 66 ∧ (entry0927 i).Inext = T 65 (289 + i.val + 1) ∧
      (entry0927 i).Icur = T 65 (289 + i.val) ∧
      (entry0927 i).output = T 66 (289 + i.val) ∧
      (entry0927 i).charge = charge 65 (289 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0931_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0943_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0927 (i : Fin 32) :
    forwardStepOK (-768) (charge 65 (289 + i.val)) shift
      (S (289 + i.val + 1)) (S 66) (T 65 (289 + i.val + 1))
      (T 65 (289 + i.val)) (T 66 (289 + i.val))
      (OriginalRow227Roots.root_pos 66 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 65 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0927.entries OriginalRow227TriangleForward0927.checked
    ⟨i.val, by rw [size0927]; exact i.isLt⟩
  change (entry0927 i).check = true at h
  rcases fields0927 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0928 : OriginalRow227TriangleForward0928.entries.size = 32 := rfl

def entry0928 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0928.entries[i.val]'(by rw [size0928]; exact i.isLt)

theorem fields0928 (i : Fin 32) :
    (entry0928 i).IA = shift ∧ (entry0928 i).ID = S (321 + i.val + 1) ∧
      (entry0928 i).IC = S 66 ∧ (entry0928 i).Inext = T 65 (321 + i.val + 1) ∧
      (entry0928 i).Icur = T 65 (321 + i.val) ∧
      (entry0928 i).output = T 66 (321 + i.val) ∧
      (entry0928 i).charge = charge 65 (321 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0932_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0944_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0928 (i : Fin 32) :
    forwardStepOK (-768) (charge 65 (321 + i.val)) shift
      (S (321 + i.val + 1)) (S 66) (T 65 (321 + i.val + 1))
      (T 65 (321 + i.val)) (T 66 (321 + i.val))
      (OriginalRow227Roots.root_pos 66 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 65 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0928.entries OriginalRow227TriangleForward0928.checked
    ⟨i.val, by rw [size0928]; exact i.isLt⟩
  change (entry0928 i).check = true at h
  rcases fields0928 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0929 : OriginalRow227TriangleForward0929.entries.size = 32 := rfl

def entry0929 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0929.entries[i.val]'(by rw [size0929]; exact i.isLt)

theorem fields0929 (i : Fin 32) :
    (entry0929 i).IA = shift ∧ (entry0929 i).ID = S (353 + i.val + 1) ∧
      (entry0929 i).IC = S 66 ∧ (entry0929 i).Inext = T 65 (353 + i.val + 1) ∧
      (entry0929 i).Icur = T 65 (353 + i.val) ∧
      (entry0929 i).output = T 66 (353 + i.val) ∧
      (entry0929 i).charge = charge 65 (353 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0933_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0945_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0929 (i : Fin 32) :
    forwardStepOK (-768) (charge 65 (353 + i.val)) shift
      (S (353 + i.val + 1)) (S 66) (T 65 (353 + i.val + 1))
      (T 65 (353 + i.val)) (T 66 (353 + i.val))
      (OriginalRow227Roots.root_pos 66 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 65 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0929.entries OriginalRow227TriangleForward0929.checked
    ⟨i.val, by rw [size0929]; exact i.isLt⟩
  change (entry0929 i).check = true at h
  rcases fields0929 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0930 : OriginalRow227TriangleForward0930.entries.size = 32 := rfl

def entry0930 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0930.entries[i.val]'(by rw [size0930]; exact i.isLt)

theorem fields0930 (i : Fin 32) :
    (entry0930 i).IA = shift ∧ (entry0930 i).ID = S (385 + i.val + 1) ∧
      (entry0930 i).IC = S 66 ∧ (entry0930 i).Inext = T 65 (385 + i.val + 1) ∧
      (entry0930 i).Icur = T 65 (385 + i.val) ∧
      (entry0930 i).output = T 66 (385 + i.val) ∧
      (entry0930 i).charge = charge 65 (385 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0934_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0946_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0930 (i : Fin 32) :
    forwardStepOK (-768) (charge 65 (385 + i.val)) shift
      (S (385 + i.val + 1)) (S 66) (T 65 (385 + i.val + 1))
      (T 65 (385 + i.val)) (T 66 (385 + i.val))
      (OriginalRow227Roots.root_pos 66 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 65 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0930.entries OriginalRow227TriangleForward0930.checked
    ⟨i.val, by rw [size0930]; exact i.isLt⟩
  change (entry0930 i).check = true at h
  rcases fields0930 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0931 : OriginalRow227TriangleForward0931.entries.size = 19 := rfl

def entry0931 (i : Fin 19) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0931.entries[i.val]'(by rw [size0931]; exact i.isLt)

theorem fields0931 (i : Fin 19) :
    (entry0931 i).IA = shift ∧ (entry0931 i).ID = S (417 + i.val + 1) ∧
      (entry0931 i).IC = S 66 ∧ (entry0931 i).Inext = T 65 (417 + i.val + 1) ∧
      (entry0931 i).Icur = T 65 (417 + i.val) ∧
      (entry0931 i).output = T 66 (417 + i.val) ∧
      (entry0931 i).charge = charge 65 (417 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings02.S_eq_root66).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow065.block0935_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow066.block0947_value ⟨18, by decide⟩).symm, rfl⟩

theorem step0931 (i : Fin 19) :
    forwardStepOK (-768) (charge 65 (417 + i.val)) shift
      (S (417 + i.val + 1)) (S 66) (T 65 (417 + i.val + 1))
      (T 65 (417 + i.val)) (T 66 (417 + i.val))
      (OriginalRow227Roots.root_pos 66 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 65 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0931.entries OriginalRow227TriangleForward0931.checked
    ⟨i.val, by rw [size0931]; exact i.isLt⟩
  change (entry0931 i).check = true at h
  rcases fields0931 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 65 ≤ d) (hhi : d < 436) :
    forwardStepOK (-768) (charge 65 d) shift (S (d + 1)) (S 66)
      (T 65 (d + 1)) (T 65 d) (T 66 d)
      (OriginalRow227Roots.root_pos 66 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 65 (by decide)) = true := by
  by_cases h257 : d < 257
  ·
    by_cases h161 : d < 161
    ·
      by_cases h97 : d < 97
      ·
        have hi : d - 65 < 32 := by omega
        have heq : 65 + (d - 65) = d := by omega
        simpa only [heq] using step0920 ⟨d - 65, hi⟩
      ·
        by_cases h129 : d < 129
        ·
          have hi : d - 97 < 32 := by omega
          have heq : 97 + (d - 97) = d := by omega
          simpa only [heq] using step0921 ⟨d - 97, hi⟩
        ·
          have hi : d - 129 < 32 := by omega
          have heq : 129 + (d - 129) = d := by omega
          simpa only [heq] using step0922 ⟨d - 129, hi⟩
    ·
      by_cases h193 : d < 193
      ·
        have hi : d - 161 < 32 := by omega
        have heq : 161 + (d - 161) = d := by omega
        simpa only [heq] using step0923 ⟨d - 161, hi⟩
      ·
        by_cases h225 : d < 225
        ·
          have hi : d - 193 < 32 := by omega
          have heq : 193 + (d - 193) = d := by omega
          simpa only [heq] using step0924 ⟨d - 193, hi⟩
        ·
          have hi : d - 225 < 32 := by omega
          have heq : 225 + (d - 225) = d := by omega
          simpa only [heq] using step0925 ⟨d - 225, hi⟩
  ·
    by_cases h353 : d < 353
    ·
      by_cases h289 : d < 289
      ·
        have hi : d - 257 < 32 := by omega
        have heq : 257 + (d - 257) = d := by omega
        simpa only [heq] using step0926 ⟨d - 257, hi⟩
      ·
        by_cases h321 : d < 321
        ·
          have hi : d - 289 < 32 := by omega
          have heq : 289 + (d - 289) = d := by omega
          simpa only [heq] using step0927 ⟨d - 289, hi⟩
        ·
          have hi : d - 321 < 32 := by omega
          have heq : 321 + (d - 321) = d := by omega
          simpa only [heq] using step0928 ⟨d - 321, hi⟩
    ·
      by_cases h385 : d < 385
      ·
        have hi : d - 353 < 32 := by omega
        have heq : 353 + (d - 353) = d := by omega
        simpa only [heq] using step0929 ⟨d - 353, hi⟩
      ·
        by_cases h417 : d < 417
        ·
          have hi : d - 385 < 32 := by omega
          have heq : 385 + (d - 385) = d := by omega
          simpa only [heq] using step0930 ⟨d - 385, hi⟩
        ·
          have hi : d - 417 < 19 := by omega
          have heq : 417 + (d - 417) = d := by omega
          simpa only [heq] using step0931 ⟨d - 417, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.fields0920,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.step0920,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.fields0921,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.step0921,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.fields0922,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.step0922,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.fields0923,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.step0923,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.fields0924,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.step0924,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.fields0925,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.step0925,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.fields0926,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.step0926,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.fields0927,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.step0927,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.fields0928,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.step0928,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.fields0929,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.step0929,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.fields0930,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.step0930,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.fields0931,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.step0931,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow066
