import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042
import Grothe.UpperChaos.OriginalRow227TriangleForward0612
import Grothe.UpperChaos.OriginalRow227TriangleForward0613
import Grothe.UpperChaos.OriginalRow227TriangleForward0614
import Grothe.UpperChaos.OriginalRow227TriangleForward0615
import Grothe.UpperChaos.OriginalRow227TriangleForward0616
import Grothe.UpperChaos.OriginalRow227TriangleForward0617
import Grothe.UpperChaos.OriginalRow227TriangleForward0618
import Grothe.UpperChaos.OriginalRow227TriangleForward0619
import Grothe.UpperChaos.OriginalRow227TriangleForward0620
import Grothe.UpperChaos.OriginalRow227TriangleForward0621
import Grothe.UpperChaos.OriginalRow227TriangleForward0622
import Grothe.UpperChaos.OriginalRow227TriangleForward0623
import Grothe.UpperChaos.OriginalRow227TriangleForward0624
import Grothe.UpperChaos.OriginalRow227TriangleForward0625

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0612 : OriginalRow227TriangleForward0612.entries.size = 32 := rfl

def entry0612 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0612.entries[i.val]'(by rw [size0612]; exact i.isLt)

theorem fields0612 (i : Fin 32) :
    (entry0612 i).IA = shift ∧ (entry0612 i).ID = S (41 + i.val + 1) ∧
      (entry0612 i).IC = S 42 ∧ (entry0612 i).Inext = T 41 (41 + i.val + 1) ∧
      (entry0612 i).Icur = T 41 (41 + i.val) ∧
      (entry0612 i).output = T 42 (41 + i.val) ∧
      (entry0612 i).charge = charge 41 (41 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0612 (i : Fin 32) :
    forwardStepOK (-768) (charge 41 (41 + i.val)) shift
      (S (41 + i.val + 1)) (S 42) (T 41 (41 + i.val + 1))
      (T 41 (41 + i.val)) (T 42 (41 + i.val))
      (OriginalRow227Roots.root_pos 42 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 41 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0612.entries OriginalRow227TriangleForward0612.checked
    ⟨i.val, by rw [size0612]; exact i.isLt⟩
  change (entry0612 i).check = true at h
  rcases fields0612 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0613 : OriginalRow227TriangleForward0613.entries.size = 32 := rfl

def entry0613 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0613.entries[i.val]'(by rw [size0613]; exact i.isLt)

theorem fields0613 (i : Fin 32) :
    (entry0613 i).IA = shift ∧ (entry0613 i).ID = S (73 + i.val + 1) ∧
      (entry0613 i).IC = S 42 ∧ (entry0613 i).Inext = T 41 (73 + i.val + 1) ∧
      (entry0613 i).Icur = T 41 (73 + i.val) ∧
      (entry0613 i).output = T 42 (73 + i.val) ∧
      (entry0613 i).charge = charge 41 (73 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0613 (i : Fin 32) :
    forwardStepOK (-768) (charge 41 (73 + i.val)) shift
      (S (73 + i.val + 1)) (S 42) (T 41 (73 + i.val + 1))
      (T 41 (73 + i.val)) (T 42 (73 + i.val))
      (OriginalRow227Roots.root_pos 42 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 41 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0613.entries OriginalRow227TriangleForward0613.checked
    ⟨i.val, by rw [size0613]; exact i.isLt⟩
  change (entry0613 i).check = true at h
  rcases fields0613 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0614 : OriginalRow227TriangleForward0614.entries.size = 32 := rfl

def entry0614 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0614.entries[i.val]'(by rw [size0614]; exact i.isLt)

theorem fields0614 (i : Fin 32) :
    (entry0614 i).IA = shift ∧ (entry0614 i).ID = S (105 + i.val + 1) ∧
      (entry0614 i).IC = S 42 ∧ (entry0614 i).Inext = T 41 (105 + i.val + 1) ∧
      (entry0614 i).Icur = T 41 (105 + i.val) ∧
      (entry0614 i).output = T 42 (105 + i.val) ∧
      (entry0614 i).charge = charge 41 (105 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0614 (i : Fin 32) :
    forwardStepOK (-768) (charge 41 (105 + i.val)) shift
      (S (105 + i.val + 1)) (S 42) (T 41 (105 + i.val + 1))
      (T 41 (105 + i.val)) (T 42 (105 + i.val))
      (OriginalRow227Roots.root_pos 42 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 41 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0614.entries OriginalRow227TriangleForward0614.checked
    ⟨i.val, by rw [size0614]; exact i.isLt⟩
  change (entry0614 i).check = true at h
  rcases fields0614 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0615 : OriginalRow227TriangleForward0615.entries.size = 32 := rfl

def entry0615 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0615.entries[i.val]'(by rw [size0615]; exact i.isLt)

theorem fields0615 (i : Fin 32) :
    (entry0615 i).IA = shift ∧ (entry0615 i).ID = S (137 + i.val + 1) ∧
      (entry0615 i).IC = S 42 ∧ (entry0615 i).Inext = T 41 (137 + i.val + 1) ∧
      (entry0615 i).Icur = T 41 (137 + i.val) ∧
      (entry0615 i).output = T 42 (137 + i.val) ∧
      (entry0615 i).charge = charge 41 (137 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0615 (i : Fin 32) :
    forwardStepOK (-768) (charge 41 (137 + i.val)) shift
      (S (137 + i.val + 1)) (S 42) (T 41 (137 + i.val + 1))
      (T 41 (137 + i.val)) (T 42 (137 + i.val))
      (OriginalRow227Roots.root_pos 42 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 41 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0615.entries OriginalRow227TriangleForward0615.checked
    ⟨i.val, by rw [size0615]; exact i.isLt⟩
  change (entry0615 i).check = true at h
  rcases fields0615 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0616 : OriginalRow227TriangleForward0616.entries.size = 32 := rfl

def entry0616 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0616.entries[i.val]'(by rw [size0616]; exact i.isLt)

theorem fields0616 (i : Fin 32) :
    (entry0616 i).IA = shift ∧ (entry0616 i).ID = S (169 + i.val + 1) ∧
      (entry0616 i).IC = S 42 ∧ (entry0616 i).Inext = T 41 (169 + i.val + 1) ∧
      (entry0616 i).Icur = T 41 (169 + i.val) ∧
      (entry0616 i).output = T 42 (169 + i.val) ∧
      (entry0616 i).charge = charge 41 (169 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0616 (i : Fin 32) :
    forwardStepOK (-768) (charge 41 (169 + i.val)) shift
      (S (169 + i.val + 1)) (S 42) (T 41 (169 + i.val + 1))
      (T 41 (169 + i.val)) (T 42 (169 + i.val))
      (OriginalRow227Roots.root_pos 42 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 41 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0616.entries OriginalRow227TriangleForward0616.checked
    ⟨i.val, by rw [size0616]; exact i.isLt⟩
  change (entry0616 i).check = true at h
  rcases fields0616 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0617 : OriginalRow227TriangleForward0617.entries.size = 32 := rfl

def entry0617 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0617.entries[i.val]'(by rw [size0617]; exact i.isLt)

theorem fields0617 (i : Fin 32) :
    (entry0617 i).IA = shift ∧ (entry0617 i).ID = S (201 + i.val + 1) ∧
      (entry0617 i).IC = S 42 ∧ (entry0617 i).Inext = T 41 (201 + i.val + 1) ∧
      (entry0617 i).Icur = T 41 (201 + i.val) ∧
      (entry0617 i).output = T 42 (201 + i.val) ∧
      (entry0617 i).charge = charge 41 (201 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0617 (i : Fin 32) :
    forwardStepOK (-768) (charge 41 (201 + i.val)) shift
      (S (201 + i.val + 1)) (S 42) (T 41 (201 + i.val + 1))
      (T 41 (201 + i.val)) (T 42 (201 + i.val))
      (OriginalRow227Roots.root_pos 42 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 41 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0617.entries OriginalRow227TriangleForward0617.checked
    ⟨i.val, by rw [size0617]; exact i.isLt⟩
  change (entry0617 i).check = true at h
  rcases fields0617 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0618 : OriginalRow227TriangleForward0618.entries.size = 32 := rfl

def entry0618 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0618.entries[i.val]'(by rw [size0618]; exact i.isLt)

theorem fields0618 (i : Fin 32) :
    (entry0618 i).IA = shift ∧ (entry0618 i).ID = S (233 + i.val + 1) ∧
      (entry0618 i).IC = S 42 ∧ (entry0618 i).Inext = T 41 (233 + i.val + 1) ∧
      (entry0618 i).Icur = T 41 (233 + i.val) ∧
      (entry0618 i).output = T 42 (233 + i.val) ∧
      (entry0618 i).charge = charge 41 (233 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0618 (i : Fin 32) :
    forwardStepOK (-768) (charge 41 (233 + i.val)) shift
      (S (233 + i.val + 1)) (S 42) (T 41 (233 + i.val + 1))
      (T 41 (233 + i.val)) (T 42 (233 + i.val))
      (OriginalRow227Roots.root_pos 42 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 41 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0618.entries OriginalRow227TriangleForward0618.checked
    ⟨i.val, by rw [size0618]; exact i.isLt⟩
  change (entry0618 i).check = true at h
  rcases fields0618 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0619 : OriginalRow227TriangleForward0619.entries.size = 32 := rfl

def entry0619 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0619.entries[i.val]'(by rw [size0619]; exact i.isLt)

theorem fields0619 (i : Fin 32) :
    (entry0619 i).IA = shift ∧ (entry0619 i).ID = S (265 + i.val + 1) ∧
      (entry0619 i).IC = S 42 ∧ (entry0619 i).Inext = T 41 (265 + i.val + 1) ∧
      (entry0619 i).Icur = T 41 (265 + i.val) ∧
      (entry0619 i).output = T 42 (265 + i.val) ∧
      (entry0619 i).charge = charge 41 (265 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0619 (i : Fin 32) :
    forwardStepOK (-768) (charge 41 (265 + i.val)) shift
      (S (265 + i.val + 1)) (S 42) (T 41 (265 + i.val + 1))
      (T 41 (265 + i.val)) (T 42 (265 + i.val))
      (OriginalRow227Roots.root_pos 42 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 41 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0619.entries OriginalRow227TriangleForward0619.checked
    ⟨i.val, by rw [size0619]; exact i.isLt⟩
  change (entry0619 i).check = true at h
  rcases fields0619 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0620 : OriginalRow227TriangleForward0620.entries.size = 32 := rfl

def entry0620 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0620.entries[i.val]'(by rw [size0620]; exact i.isLt)

theorem fields0620 (i : Fin 32) :
    (entry0620 i).IA = shift ∧ (entry0620 i).ID = S (297 + i.val + 1) ∧
      (entry0620 i).IC = S 42 ∧ (entry0620 i).Inext = T 41 (297 + i.val + 1) ∧
      (entry0620 i).Icur = T 41 (297 + i.val) ∧
      (entry0620 i).output = T 42 (297 + i.val) ∧
      (entry0620 i).charge = charge 41 (297 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0620 (i : Fin 32) :
    forwardStepOK (-768) (charge 41 (297 + i.val)) shift
      (S (297 + i.val + 1)) (S 42) (T 41 (297 + i.val + 1))
      (T 41 (297 + i.val)) (T 42 (297 + i.val))
      (OriginalRow227Roots.root_pos 42 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 41 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0620.entries OriginalRow227TriangleForward0620.checked
    ⟨i.val, by rw [size0620]; exact i.isLt⟩
  change (entry0620 i).check = true at h
  rcases fields0620 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0621 : OriginalRow227TriangleForward0621.entries.size = 32 := rfl

def entry0621 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0621.entries[i.val]'(by rw [size0621]; exact i.isLt)

theorem fields0621 (i : Fin 32) :
    (entry0621 i).IA = shift ∧ (entry0621 i).ID = S (329 + i.val + 1) ∧
      (entry0621 i).IC = S 42 ∧ (entry0621 i).Inext = T 41 (329 + i.val + 1) ∧
      (entry0621 i).Icur = T 41 (329 + i.val) ∧
      (entry0621 i).output = T 42 (329 + i.val) ∧
      (entry0621 i).charge = charge 41 (329 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0621 (i : Fin 32) :
    forwardStepOK (-768) (charge 41 (329 + i.val)) shift
      (S (329 + i.val + 1)) (S 42) (T 41 (329 + i.val + 1))
      (T 41 (329 + i.val)) (T 42 (329 + i.val))
      (OriginalRow227Roots.root_pos 42 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 41 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0621.entries OriginalRow227TriangleForward0621.checked
    ⟨i.val, by rw [size0621]; exact i.isLt⟩
  change (entry0621 i).check = true at h
  rcases fields0621 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0622 : OriginalRow227TriangleForward0622.entries.size = 32 := rfl

def entry0622 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0622.entries[i.val]'(by rw [size0622]; exact i.isLt)

theorem fields0622 (i : Fin 32) :
    (entry0622 i).IA = shift ∧ (entry0622 i).ID = S (361 + i.val + 1) ∧
      (entry0622 i).IC = S 42 ∧ (entry0622 i).Inext = T 41 (361 + i.val + 1) ∧
      (entry0622 i).Icur = T 41 (361 + i.val) ∧
      (entry0622 i).output = T 42 (361 + i.val) ∧
      (entry0622 i).charge = charge 41 (361 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0622 (i : Fin 32) :
    forwardStepOK (-768) (charge 41 (361 + i.val)) shift
      (S (361 + i.val + 1)) (S 42) (T 41 (361 + i.val + 1))
      (T 41 (361 + i.val)) (T 42 (361 + i.val))
      (OriginalRow227Roots.root_pos 42 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 41 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0622.entries OriginalRow227TriangleForward0622.checked
    ⟨i.val, by rw [size0622]; exact i.isLt⟩
  change (entry0622 i).check = true at h
  rcases fields0622 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0623 : OriginalRow227TriangleForward0623.entries.size = 32 := rfl

def entry0623 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0623.entries[i.val]'(by rw [size0623]; exact i.isLt)

theorem fields0623 (i : Fin 32) :
    (entry0623 i).IA = shift ∧ (entry0623 i).ID = S (393 + i.val + 1) ∧
      (entry0623 i).IC = S 42 ∧ (entry0623 i).Inext = T 41 (393 + i.val + 1) ∧
      (entry0623 i).Icur = T 41 (393 + i.val) ∧
      (entry0623 i).output = T 42 (393 + i.val) ∧
      (entry0623 i).charge = charge 41 (393 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0623 (i : Fin 32) :
    forwardStepOK (-768) (charge 41 (393 + i.val)) shift
      (S (393 + i.val + 1)) (S 42) (T 41 (393 + i.val + 1))
      (T 41 (393 + i.val)) (T 42 (393 + i.val))
      (OriginalRow227Roots.root_pos 42 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 41 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0623.entries OriginalRow227TriangleForward0623.checked
    ⟨i.val, by rw [size0623]; exact i.isLt⟩
  change (entry0623 i).check = true at h
  rcases fields0623 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0624 : OriginalRow227TriangleForward0624.entries.size = 32 := rfl

def entry0624 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0624.entries[i.val]'(by rw [size0624]; exact i.isLt)

theorem fields0624 (i : Fin 32) :
    (entry0624 i).IA = shift ∧ (entry0624 i).ID = S (425 + i.val + 1) ∧
      (entry0624 i).IC = S 42 ∧ (entry0624 i).Inext = T 41 (425 + i.val + 1) ∧
      (entry0624 i).Icur = T 41 (425 + i.val) ∧
      (entry0624 i).output = T 42 (425 + i.val) ∧
      (entry0624 i).charge = charge 41 (425 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0627_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0627_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0627_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0624 (i : Fin 32) :
    forwardStepOK (-768) (charge 41 (425 + i.val)) shift
      (S (425 + i.val + 1)) (S 42) (T 41 (425 + i.val + 1))
      (T 41 (425 + i.val)) (T 42 (425 + i.val))
      (OriginalRow227Roots.root_pos 42 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 41 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0624.entries OriginalRow227TriangleForward0624.checked
    ⟨i.val, by rw [size0624]; exact i.isLt⟩
  change (entry0624 i).check = true at h
  rcases fields0624 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0625 : OriginalRow227TriangleForward0625.entries.size = 3 := rfl

def entry0625 (i : Fin 3) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0625.entries[i.val]'(by rw [size0625]; exact i.isLt)

theorem fields0625 (i : Fin 3) :
    (entry0625 i).IA = shift ∧ (entry0625 i).ID = S (457 + i.val + 1) ∧
      (entry0625 i).IC = S 42 ∧ (entry0625 i).Inext = T 41 (457 + i.val + 1) ∧
      (entry0625 i).Icur = T 41 (457 + i.val) ∧
      (entry0625 i).output = T 42 (457 + i.val) ∧
      (entry0625 i).charge = charge 41 (457 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0627_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0627_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0641_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0627_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0627_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0641_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings01.S_eq_root42).symm,
      (OriginalRow227TriangleBindingsRow041.block0627_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0627_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0641_value ⟨2, by decide⟩).symm, rfl⟩

theorem step0625 (i : Fin 3) :
    forwardStepOK (-768) (charge 41 (457 + i.val)) shift
      (S (457 + i.val + 1)) (S 42) (T 41 (457 + i.val + 1))
      (T 41 (457 + i.val)) (T 42 (457 + i.val))
      (OriginalRow227Roots.root_pos 42 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 41 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0625.entries OriginalRow227TriangleForward0625.checked
    ⟨i.val, by rw [size0625]; exact i.isLt⟩
  change (entry0625 i).check = true at h
  rcases fields0625 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 41 ≤ d) (hhi : d < 460) :
    forwardStepOK (-768) (charge 41 d) shift (S (d + 1)) (S 42)
      (T 41 (d + 1)) (T 41 d) (T 42 d)
      (OriginalRow227Roots.root_pos 42 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 41 (by decide)) = true := by
  by_cases h265 : d < 265
  ·
    by_cases h137 : d < 137
    ·
      by_cases h73 : d < 73
      ·
        have hi : d - 41 < 32 := by omega
        have heq : 41 + (d - 41) = d := by omega
        simpa only [heq] using step0612 ⟨d - 41, hi⟩
      ·
        by_cases h105 : d < 105
        ·
          have hi : d - 73 < 32 := by omega
          have heq : 73 + (d - 73) = d := by omega
          simpa only [heq] using step0613 ⟨d - 73, hi⟩
        ·
          have hi : d - 105 < 32 := by omega
          have heq : 105 + (d - 105) = d := by omega
          simpa only [heq] using step0614 ⟨d - 105, hi⟩
    ·
      by_cases h201 : d < 201
      ·
        by_cases h169 : d < 169
        ·
          have hi : d - 137 < 32 := by omega
          have heq : 137 + (d - 137) = d := by omega
          simpa only [heq] using step0615 ⟨d - 137, hi⟩
        ·
          have hi : d - 169 < 32 := by omega
          have heq : 169 + (d - 169) = d := by omega
          simpa only [heq] using step0616 ⟨d - 169, hi⟩
      ·
        by_cases h233 : d < 233
        ·
          have hi : d - 201 < 32 := by omega
          have heq : 201 + (d - 201) = d := by omega
          simpa only [heq] using step0617 ⟨d - 201, hi⟩
        ·
          have hi : d - 233 < 32 := by omega
          have heq : 233 + (d - 233) = d := by omega
          simpa only [heq] using step0618 ⟨d - 233, hi⟩
  ·
    by_cases h361 : d < 361
    ·
      by_cases h297 : d < 297
      ·
        have hi : d - 265 < 32 := by omega
        have heq : 265 + (d - 265) = d := by omega
        simpa only [heq] using step0619 ⟨d - 265, hi⟩
      ·
        by_cases h329 : d < 329
        ·
          have hi : d - 297 < 32 := by omega
          have heq : 297 + (d - 297) = d := by omega
          simpa only [heq] using step0620 ⟨d - 297, hi⟩
        ·
          have hi : d - 329 < 32 := by omega
          have heq : 329 + (d - 329) = d := by omega
          simpa only [heq] using step0621 ⟨d - 329, hi⟩
    ·
      by_cases h425 : d < 425
      ·
        by_cases h393 : d < 393
        ·
          have hi : d - 361 < 32 := by omega
          have heq : 361 + (d - 361) = d := by omega
          simpa only [heq] using step0622 ⟨d - 361, hi⟩
        ·
          have hi : d - 393 < 32 := by omega
          have heq : 393 + (d - 393) = d := by omega
          simpa only [heq] using step0623 ⟨d - 393, hi⟩
      ·
        by_cases h457 : d < 457
        ·
          have hi : d - 425 < 32 := by omega
          have heq : 425 + (d - 425) = d := by omega
          simpa only [heq] using step0624 ⟨d - 425, hi⟩
        ·
          have hi : d - 457 < 3 := by omega
          have heq : 457 + (d - 457) = d := by omega
          simpa only [heq] using step0625 ⟨d - 457, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.fields0612,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.step0612,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.fields0613,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.step0613,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.fields0614,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.step0614,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.fields0615,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.step0615,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.fields0616,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.step0616,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.fields0617,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.step0617,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.fields0618,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.step0618,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.fields0619,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.step0619,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.fields0620,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.step0620,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.fields0621,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.step0621,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.fields0622,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.step0622,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.fields0623,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.step0623,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.fields0624,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.step0624,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.fields0625,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.step0625,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow042
