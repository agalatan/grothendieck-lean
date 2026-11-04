import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow114
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow115
import Grothe.UpperChaos.OriginalRow227TriangleForward1439
import Grothe.UpperChaos.OriginalRow227TriangleForward1440
import Grothe.UpperChaos.OriginalRow227TriangleForward1441
import Grothe.UpperChaos.OriginalRow227TriangleForward1442
import Grothe.UpperChaos.OriginalRow227TriangleForward1443
import Grothe.UpperChaos.OriginalRow227TriangleForward1444
import Grothe.UpperChaos.OriginalRow227TriangleForward1445
import Grothe.UpperChaos.OriginalRow227TriangleForward1446
import Grothe.UpperChaos.OriginalRow227TriangleForward1447

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1439 : OriginalRow227TriangleForward1439.entries.size = 32 := rfl

def entry1439 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1439.entries[i.val]'(by rw [size1439]; exact i.isLt)

theorem fields1439 (i : Fin 32) :
    (entry1439 i).IA = shift ∧ (entry1439 i).ID = S (114 + i.val + 1) ∧
      (entry1439 i).IC = S 115 ∧ (entry1439 i).Inext = T 114 (114 + i.val + 1) ∧
      (entry1439 i).Icur = T 114 (114 + i.val) ∧
      (entry1439 i).output = T 115 (114 + i.val) ∧
      (entry1439 i).charge = charge 114 (114 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1446_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1455_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1439 (i : Fin 32) :
    forwardStepOK (-768) (charge 114 (114 + i.val)) shift
      (S (114 + i.val + 1)) (S 115) (T 114 (114 + i.val + 1))
      (T 114 (114 + i.val)) (T 115 (114 + i.val))
      (OriginalRow227Roots.root_pos 115 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 114 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1439.entries OriginalRow227TriangleForward1439.checked
    ⟨i.val, by rw [size1439]; exact i.isLt⟩
  change (entry1439 i).check = true at h
  rcases fields1439 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1440 : OriginalRow227TriangleForward1440.entries.size = 32 := rfl

def entry1440 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1440.entries[i.val]'(by rw [size1440]; exact i.isLt)

theorem fields1440 (i : Fin 32) :
    (entry1440 i).IA = shift ∧ (entry1440 i).ID = S (146 + i.val + 1) ∧
      (entry1440 i).IC = S 115 ∧ (entry1440 i).Inext = T 114 (146 + i.val + 1) ∧
      (entry1440 i).Icur = T 114 (146 + i.val) ∧
      (entry1440 i).output = T 115 (146 + i.val) ∧
      (entry1440 i).charge = charge 114 (146 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1447_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1456_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1440 (i : Fin 32) :
    forwardStepOK (-768) (charge 114 (146 + i.val)) shift
      (S (146 + i.val + 1)) (S 115) (T 114 (146 + i.val + 1))
      (T 114 (146 + i.val)) (T 115 (146 + i.val))
      (OriginalRow227Roots.root_pos 115 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 114 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1440.entries OriginalRow227TriangleForward1440.checked
    ⟨i.val, by rw [size1440]; exact i.isLt⟩
  change (entry1440 i).check = true at h
  rcases fields1440 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1441 : OriginalRow227TriangleForward1441.entries.size = 32 := rfl

def entry1441 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1441.entries[i.val]'(by rw [size1441]; exact i.isLt)

theorem fields1441 (i : Fin 32) :
    (entry1441 i).IA = shift ∧ (entry1441 i).ID = S (178 + i.val + 1) ∧
      (entry1441 i).IC = S 115 ∧ (entry1441 i).Inext = T 114 (178 + i.val + 1) ∧
      (entry1441 i).Icur = T 114 (178 + i.val) ∧
      (entry1441 i).output = T 115 (178 + i.val) ∧
      (entry1441 i).charge = charge 114 (178 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1448_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1457_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1441 (i : Fin 32) :
    forwardStepOK (-768) (charge 114 (178 + i.val)) shift
      (S (178 + i.val + 1)) (S 115) (T 114 (178 + i.val + 1))
      (T 114 (178 + i.val)) (T 115 (178 + i.val))
      (OriginalRow227Roots.root_pos 115 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 114 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1441.entries OriginalRow227TriangleForward1441.checked
    ⟨i.val, by rw [size1441]; exact i.isLt⟩
  change (entry1441 i).check = true at h
  rcases fields1441 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1442 : OriginalRow227TriangleForward1442.entries.size = 32 := rfl

def entry1442 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1442.entries[i.val]'(by rw [size1442]; exact i.isLt)

theorem fields1442 (i : Fin 32) :
    (entry1442 i).IA = shift ∧ (entry1442 i).ID = S (210 + i.val + 1) ∧
      (entry1442 i).IC = S 115 ∧ (entry1442 i).Inext = T 114 (210 + i.val + 1) ∧
      (entry1442 i).Icur = T 114 (210 + i.val) ∧
      (entry1442 i).output = T 115 (210 + i.val) ∧
      (entry1442 i).charge = charge 114 (210 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1449_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1458_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1442 (i : Fin 32) :
    forwardStepOK (-768) (charge 114 (210 + i.val)) shift
      (S (210 + i.val + 1)) (S 115) (T 114 (210 + i.val + 1))
      (T 114 (210 + i.val)) (T 115 (210 + i.val))
      (OriginalRow227Roots.root_pos 115 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 114 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1442.entries OriginalRow227TriangleForward1442.checked
    ⟨i.val, by rw [size1442]; exact i.isLt⟩
  change (entry1442 i).check = true at h
  rcases fields1442 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1443 : OriginalRow227TriangleForward1443.entries.size = 32 := rfl

def entry1443 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1443.entries[i.val]'(by rw [size1443]; exact i.isLt)

theorem fields1443 (i : Fin 32) :
    (entry1443 i).IA = shift ∧ (entry1443 i).ID = S (242 + i.val + 1) ∧
      (entry1443 i).IC = S 115 ∧ (entry1443 i).Inext = T 114 (242 + i.val + 1) ∧
      (entry1443 i).Icur = T 114 (242 + i.val) ∧
      (entry1443 i).output = T 115 (242 + i.val) ∧
      (entry1443 i).charge = charge 114 (242 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1450_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1459_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1443 (i : Fin 32) :
    forwardStepOK (-768) (charge 114 (242 + i.val)) shift
      (S (242 + i.val + 1)) (S 115) (T 114 (242 + i.val + 1))
      (T 114 (242 + i.val)) (T 115 (242 + i.val))
      (OriginalRow227Roots.root_pos 115 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 114 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1443.entries OriginalRow227TriangleForward1443.checked
    ⟨i.val, by rw [size1443]; exact i.isLt⟩
  change (entry1443 i).check = true at h
  rcases fields1443 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1444 : OriginalRow227TriangleForward1444.entries.size = 32 := rfl

def entry1444 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1444.entries[i.val]'(by rw [size1444]; exact i.isLt)

theorem fields1444 (i : Fin 32) :
    (entry1444 i).IA = shift ∧ (entry1444 i).ID = S (274 + i.val + 1) ∧
      (entry1444 i).IC = S 115 ∧ (entry1444 i).Inext = T 114 (274 + i.val + 1) ∧
      (entry1444 i).Icur = T 114 (274 + i.val) ∧
      (entry1444 i).output = T 115 (274 + i.val) ∧
      (entry1444 i).charge = charge 114 (274 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1451_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1460_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1444 (i : Fin 32) :
    forwardStepOK (-768) (charge 114 (274 + i.val)) shift
      (S (274 + i.val + 1)) (S 115) (T 114 (274 + i.val + 1))
      (T 114 (274 + i.val)) (T 115 (274 + i.val))
      (OriginalRow227Roots.root_pos 115 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 114 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1444.entries OriginalRow227TriangleForward1444.checked
    ⟨i.val, by rw [size1444]; exact i.isLt⟩
  change (entry1444 i).check = true at h
  rcases fields1444 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1445 : OriginalRow227TriangleForward1445.entries.size = 32 := rfl

def entry1445 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1445.entries[i.val]'(by rw [size1445]; exact i.isLt)

theorem fields1445 (i : Fin 32) :
    (entry1445 i).IA = shift ∧ (entry1445 i).ID = S (306 + i.val + 1) ∧
      (entry1445 i).IC = S 115 ∧ (entry1445 i).Inext = T 114 (306 + i.val + 1) ∧
      (entry1445 i).Icur = T 114 (306 + i.val) ∧
      (entry1445 i).output = T 115 (306 + i.val) ∧
      (entry1445 i).charge = charge 114 (306 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1452_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1461_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1445 (i : Fin 32) :
    forwardStepOK (-768) (charge 114 (306 + i.val)) shift
      (S (306 + i.val + 1)) (S 115) (T 114 (306 + i.val + 1))
      (T 114 (306 + i.val)) (T 115 (306 + i.val))
      (OriginalRow227Roots.root_pos 115 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 114 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1445.entries OriginalRow227TriangleForward1445.checked
    ⟨i.val, by rw [size1445]; exact i.isLt⟩
  change (entry1445 i).check = true at h
  rcases fields1445 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1446 : OriginalRow227TriangleForward1446.entries.size = 32 := rfl

def entry1446 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1446.entries[i.val]'(by rw [size1446]; exact i.isLt)

theorem fields1446 (i : Fin 32) :
    (entry1446 i).IA = shift ∧ (entry1446 i).ID = S (338 + i.val + 1) ∧
      (entry1446 i).IC = S 115 ∧ (entry1446 i).Inext = T 114 (338 + i.val + 1) ∧
      (entry1446 i).Icur = T 114 (338 + i.val) ∧
      (entry1446 i).output = T 115 (338 + i.val) ∧
      (entry1446 i).charge = charge 114 (338 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1453_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1462_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1446 (i : Fin 32) :
    forwardStepOK (-768) (charge 114 (338 + i.val)) shift
      (S (338 + i.val + 1)) (S 115) (T 114 (338 + i.val + 1))
      (T 114 (338 + i.val)) (T 115 (338 + i.val))
      (OriginalRow227Roots.root_pos 115 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 114 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1446.entries OriginalRow227TriangleForward1446.checked
    ⟨i.val, by rw [size1446]; exact i.isLt⟩
  change (entry1446 i).check = true at h
  rcases fields1446 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1447 : OriginalRow227TriangleForward1447.entries.size = 17 := rfl

def entry1447 (i : Fin 17) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1447.entries[i.val]'(by rw [size1447]; exact i.isLt)

theorem fields1447 (i : Fin 17) :
    (entry1447 i).IA = shift ∧ (entry1447 i).ID = S (370 + i.val + 1) ∧
      (entry1447 i).IC = S 115 ∧ (entry1447 i).Inext = T 114 (370 + i.val + 1) ∧
      (entry1447 i).Icur = T 114 (370 + i.val) ∧
      (entry1447 i).output = T 115 (370 + i.val) ∧
      (entry1447 i).charge = charge 114 (370 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings03.S_eq_root115).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow114.block1454_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow115.block1463_value ⟨16, by decide⟩).symm, rfl⟩

theorem step1447 (i : Fin 17) :
    forwardStepOK (-768) (charge 114 (370 + i.val)) shift
      (S (370 + i.val + 1)) (S 115) (T 114 (370 + i.val + 1))
      (T 114 (370 + i.val)) (T 115 (370 + i.val))
      (OriginalRow227Roots.root_pos 115 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 114 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1447.entries OriginalRow227TriangleForward1447.checked
    ⟨i.val, by rw [size1447]; exact i.isLt⟩
  change (entry1447 i).check = true at h
  rcases fields1447 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 114 ≤ d) (hhi : d < 387) :
    forwardStepOK (-768) (charge 114 d) shift (S (d + 1)) (S 115)
      (T 114 (d + 1)) (T 114 d) (T 115 d)
      (OriginalRow227Roots.root_pos 115 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 114 (by decide)) = true := by
  by_cases h242 : d < 242
  ·
    by_cases h178 : d < 178
    ·
      by_cases h146 : d < 146
      ·
        have hi : d - 114 < 32 := by omega
        have heq : 114 + (d - 114) = d := by omega
        simpa only [heq] using step1439 ⟨d - 114, hi⟩
      ·
        have hi : d - 146 < 32 := by omega
        have heq : 146 + (d - 146) = d := by omega
        simpa only [heq] using step1440 ⟨d - 146, hi⟩
    ·
      by_cases h210 : d < 210
      ·
        have hi : d - 178 < 32 := by omega
        have heq : 178 + (d - 178) = d := by omega
        simpa only [heq] using step1441 ⟨d - 178, hi⟩
      ·
        have hi : d - 210 < 32 := by omega
        have heq : 210 + (d - 210) = d := by omega
        simpa only [heq] using step1442 ⟨d - 210, hi⟩
  ·
    by_cases h306 : d < 306
    ·
      by_cases h274 : d < 274
      ·
        have hi : d - 242 < 32 := by omega
        have heq : 242 + (d - 242) = d := by omega
        simpa only [heq] using step1443 ⟨d - 242, hi⟩
      ·
        have hi : d - 274 < 32 := by omega
        have heq : 274 + (d - 274) = d := by omega
        simpa only [heq] using step1444 ⟨d - 274, hi⟩
    ·
      by_cases h338 : d < 338
      ·
        have hi : d - 306 < 32 := by omega
        have heq : 306 + (d - 306) = d := by omega
        simpa only [heq] using step1445 ⟨d - 306, hi⟩
      ·
        by_cases h370 : d < 370
        ·
          have hi : d - 338 < 32 := by omega
          have heq : 338 + (d - 338) = d := by omega
          simpa only [heq] using step1446 ⟨d - 338, hi⟩
        ·
          have hi : d - 370 < 17 := by omega
          have heq : 370 + (d - 370) = d := by omega
          simpa only [heq] using step1447 ⟨d - 370, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115.fields1439,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115.step1439,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115.fields1440,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115.step1440,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115.fields1441,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115.step1441,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115.fields1442,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115.step1442,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115.fields1443,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115.step1443,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115.fields1444,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115.step1444,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115.fields1445,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115.step1445,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115.fields1446,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115.step1446,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115.fields1447,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115.step1447,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow115
