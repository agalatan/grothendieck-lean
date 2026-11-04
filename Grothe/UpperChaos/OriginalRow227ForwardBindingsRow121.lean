import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121
import Grothe.UpperChaos.OriginalRow227TriangleForward1493
import Grothe.UpperChaos.OriginalRow227TriangleForward1494
import Grothe.UpperChaos.OriginalRow227TriangleForward1495
import Grothe.UpperChaos.OriginalRow227TriangleForward1496
import Grothe.UpperChaos.OriginalRow227TriangleForward1497
import Grothe.UpperChaos.OriginalRow227TriangleForward1498
import Grothe.UpperChaos.OriginalRow227TriangleForward1499
import Grothe.UpperChaos.OriginalRow227TriangleForward1500
import Grothe.UpperChaos.OriginalRow227TriangleForward1501

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1493 : OriginalRow227TriangleForward1493.entries.size = 32 := rfl

def entry1493 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1493.entries[i.val]'(by rw [size1493]; exact i.isLt)

theorem fields1493 (i : Fin 32) :
    (entry1493 i).IA = shift ∧ (entry1493 i).ID = S (120 + i.val + 1) ∧
      (entry1493 i).IC = S 121 ∧ (entry1493 i).Inext = T 120 (120 + i.val + 1) ∧
      (entry1493 i).Icur = T 120 (120 + i.val) ∧
      (entry1493 i).output = T 121 (120 + i.val) ∧
      (entry1493 i).charge = charge 120 (120 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1493 (i : Fin 32) :
    forwardStepOK (-768) (charge 120 (120 + i.val)) shift
      (S (120 + i.val + 1)) (S 121) (T 120 (120 + i.val + 1))
      (T 120 (120 + i.val)) (T 121 (120 + i.val))
      (OriginalRow227Roots.root_pos 121 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 120 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1493.entries OriginalRow227TriangleForward1493.checked
    ⟨i.val, by rw [size1493]; exact i.isLt⟩
  change (entry1493 i).check = true at h
  rcases fields1493 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1494 : OriginalRow227TriangleForward1494.entries.size = 32 := rfl

def entry1494 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1494.entries[i.val]'(by rw [size1494]; exact i.isLt)

theorem fields1494 (i : Fin 32) :
    (entry1494 i).IA = shift ∧ (entry1494 i).ID = S (152 + i.val + 1) ∧
      (entry1494 i).IC = S 121 ∧ (entry1494 i).Inext = T 120 (152 + i.val + 1) ∧
      (entry1494 i).Icur = T 120 (152 + i.val) ∧
      (entry1494 i).output = T 121 (152 + i.val) ∧
      (entry1494 i).charge = charge 120 (152 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1494 (i : Fin 32) :
    forwardStepOK (-768) (charge 120 (152 + i.val)) shift
      (S (152 + i.val + 1)) (S 121) (T 120 (152 + i.val + 1))
      (T 120 (152 + i.val)) (T 121 (152 + i.val))
      (OriginalRow227Roots.root_pos 121 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 120 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1494.entries OriginalRow227TriangleForward1494.checked
    ⟨i.val, by rw [size1494]; exact i.isLt⟩
  change (entry1494 i).check = true at h
  rcases fields1494 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1495 : OriginalRow227TriangleForward1495.entries.size = 32 := rfl

def entry1495 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1495.entries[i.val]'(by rw [size1495]; exact i.isLt)

theorem fields1495 (i : Fin 32) :
    (entry1495 i).IA = shift ∧ (entry1495 i).ID = S (184 + i.val + 1) ∧
      (entry1495 i).IC = S 121 ∧ (entry1495 i).Inext = T 120 (184 + i.val + 1) ∧
      (entry1495 i).Icur = T 120 (184 + i.val) ∧
      (entry1495 i).output = T 121 (184 + i.val) ∧
      (entry1495 i).charge = charge 120 (184 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1495 (i : Fin 32) :
    forwardStepOK (-768) (charge 120 (184 + i.val)) shift
      (S (184 + i.val + 1)) (S 121) (T 120 (184 + i.val + 1))
      (T 120 (184 + i.val)) (T 121 (184 + i.val))
      (OriginalRow227Roots.root_pos 121 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 120 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1495.entries OriginalRow227TriangleForward1495.checked
    ⟨i.val, by rw [size1495]; exact i.isLt⟩
  change (entry1495 i).check = true at h
  rcases fields1495 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1496 : OriginalRow227TriangleForward1496.entries.size = 32 := rfl

def entry1496 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1496.entries[i.val]'(by rw [size1496]; exact i.isLt)

theorem fields1496 (i : Fin 32) :
    (entry1496 i).IA = shift ∧ (entry1496 i).ID = S (216 + i.val + 1) ∧
      (entry1496 i).IC = S 121 ∧ (entry1496 i).Inext = T 120 (216 + i.val + 1) ∧
      (entry1496 i).Icur = T 120 (216 + i.val) ∧
      (entry1496 i).output = T 121 (216 + i.val) ∧
      (entry1496 i).charge = charge 120 (216 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1496 (i : Fin 32) :
    forwardStepOK (-768) (charge 120 (216 + i.val)) shift
      (S (216 + i.val + 1)) (S 121) (T 120 (216 + i.val + 1))
      (T 120 (216 + i.val)) (T 121 (216 + i.val))
      (OriginalRow227Roots.root_pos 121 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 120 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1496.entries OriginalRow227TriangleForward1496.checked
    ⟨i.val, by rw [size1496]; exact i.isLt⟩
  change (entry1496 i).check = true at h
  rcases fields1496 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1497 : OriginalRow227TriangleForward1497.entries.size = 32 := rfl

def entry1497 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1497.entries[i.val]'(by rw [size1497]; exact i.isLt)

theorem fields1497 (i : Fin 32) :
    (entry1497 i).IA = shift ∧ (entry1497 i).ID = S (248 + i.val + 1) ∧
      (entry1497 i).IC = S 121 ∧ (entry1497 i).Inext = T 120 (248 + i.val + 1) ∧
      (entry1497 i).Icur = T 120 (248 + i.val) ∧
      (entry1497 i).output = T 121 (248 + i.val) ∧
      (entry1497 i).charge = charge 120 (248 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1497 (i : Fin 32) :
    forwardStepOK (-768) (charge 120 (248 + i.val)) shift
      (S (248 + i.val + 1)) (S 121) (T 120 (248 + i.val + 1))
      (T 120 (248 + i.val)) (T 121 (248 + i.val))
      (OriginalRow227Roots.root_pos 121 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 120 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1497.entries OriginalRow227TriangleForward1497.checked
    ⟨i.val, by rw [size1497]; exact i.isLt⟩
  change (entry1497 i).check = true at h
  rcases fields1497 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1498 : OriginalRow227TriangleForward1498.entries.size = 32 := rfl

def entry1498 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1498.entries[i.val]'(by rw [size1498]; exact i.isLt)

theorem fields1498 (i : Fin 32) :
    (entry1498 i).IA = shift ∧ (entry1498 i).ID = S (280 + i.val + 1) ∧
      (entry1498 i).IC = S 121 ∧ (entry1498 i).Inext = T 120 (280 + i.val + 1) ∧
      (entry1498 i).Icur = T 120 (280 + i.val) ∧
      (entry1498 i).output = T 121 (280 + i.val) ∧
      (entry1498 i).charge = charge 120 (280 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1498 (i : Fin 32) :
    forwardStepOK (-768) (charge 120 (280 + i.val)) shift
      (S (280 + i.val + 1)) (S 121) (T 120 (280 + i.val + 1))
      (T 120 (280 + i.val)) (T 121 (280 + i.val))
      (OriginalRow227Roots.root_pos 121 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 120 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1498.entries OriginalRow227TriangleForward1498.checked
    ⟨i.val, by rw [size1498]; exact i.isLt⟩
  change (entry1498 i).check = true at h
  rcases fields1498 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1499 : OriginalRow227TriangleForward1499.entries.size = 32 := rfl

def entry1499 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1499.entries[i.val]'(by rw [size1499]; exact i.isLt)

theorem fields1499 (i : Fin 32) :
    (entry1499 i).IA = shift ∧ (entry1499 i).ID = S (312 + i.val + 1) ∧
      (entry1499 i).IC = S 121 ∧ (entry1499 i).Inext = T 120 (312 + i.val + 1) ∧
      (entry1499 i).Icur = T 120 (312 + i.val) ∧
      (entry1499 i).output = T 121 (312 + i.val) ∧
      (entry1499 i).charge = charge 120 (312 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1499 (i : Fin 32) :
    forwardStepOK (-768) (charge 120 (312 + i.val)) shift
      (S (312 + i.val + 1)) (S 121) (T 120 (312 + i.val + 1))
      (T 120 (312 + i.val)) (T 121 (312 + i.val))
      (OriginalRow227Roots.root_pos 121 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 120 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1499.entries OriginalRow227TriangleForward1499.checked
    ⟨i.val, by rw [size1499]; exact i.isLt⟩
  change (entry1499 i).check = true at h
  rcases fields1499 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1500 : OriginalRow227TriangleForward1500.entries.size = 32 := rfl

def entry1500 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1500.entries[i.val]'(by rw [size1500]; exact i.isLt)

theorem fields1500 (i : Fin 32) :
    (entry1500 i).IA = shift ∧ (entry1500 i).ID = S (344 + i.val + 1) ∧
      (entry1500 i).IC = S 121 ∧ (entry1500 i).Inext = T 120 (344 + i.val + 1) ∧
      (entry1500 i).Icur = T 120 (344 + i.val) ∧
      (entry1500 i).output = T 121 (344 + i.val) ∧
      (entry1500 i).charge = charge 120 (344 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1500 (i : Fin 32) :
    forwardStepOK (-768) (charge 120 (344 + i.val)) shift
      (S (344 + i.val + 1)) (S 121) (T 120 (344 + i.val + 1))
      (T 120 (344 + i.val)) (T 121 (344 + i.val))
      (OriginalRow227Roots.root_pos 121 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 120 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1500.entries OriginalRow227TriangleForward1500.checked
    ⟨i.val, by rw [size1500]; exact i.isLt⟩
  change (entry1500 i).check = true at h
  rcases fields1500 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1501 : OriginalRow227TriangleForward1501.entries.size = 5 := rfl

def entry1501 (i : Fin 5) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1501.entries[i.val]'(by rw [size1501]; exact i.isLt)

theorem fields1501 (i : Fin 5) :
    (entry1501 i).IA = shift ∧ (entry1501 i).ID = S (376 + i.val + 1) ∧
      (entry1501 i).IC = S 121 ∧ (entry1501 i).Inext = T 120 (376 + i.val + 1) ∧
      (entry1501 i).Icur = T 120 (376 + i.val) ∧
      (entry1501 i).output = T 121 (376 + i.val) ∧
      (entry1501 i).charge = charge 120 (376 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1517_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1517_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1517_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1517_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root121).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1517_value ⟨4, by decide⟩).symm, rfl⟩

theorem step1501 (i : Fin 5) :
    forwardStepOK (-768) (charge 120 (376 + i.val)) shift
      (S (376 + i.val + 1)) (S 121) (T 120 (376 + i.val + 1))
      (T 120 (376 + i.val)) (T 121 (376 + i.val))
      (OriginalRow227Roots.root_pos 121 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 120 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1501.entries OriginalRow227TriangleForward1501.checked
    ⟨i.val, by rw [size1501]; exact i.isLt⟩
  change (entry1501 i).check = true at h
  rcases fields1501 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 120 ≤ d) (hhi : d < 381) :
    forwardStepOK (-768) (charge 120 d) shift (S (d + 1)) (S 121)
      (T 120 (d + 1)) (T 120 d) (T 121 d)
      (OriginalRow227Roots.root_pos 121 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 120 (by decide)) = true := by
  by_cases h248 : d < 248
  ·
    by_cases h184 : d < 184
    ·
      by_cases h152 : d < 152
      ·
        have hi : d - 120 < 32 := by omega
        have heq : 120 + (d - 120) = d := by omega
        simpa only [heq] using step1493 ⟨d - 120, hi⟩
      ·
        have hi : d - 152 < 32 := by omega
        have heq : 152 + (d - 152) = d := by omega
        simpa only [heq] using step1494 ⟨d - 152, hi⟩
    ·
      by_cases h216 : d < 216
      ·
        have hi : d - 184 < 32 := by omega
        have heq : 184 + (d - 184) = d := by omega
        simpa only [heq] using step1495 ⟨d - 184, hi⟩
      ·
        have hi : d - 216 < 32 := by omega
        have heq : 216 + (d - 216) = d := by omega
        simpa only [heq] using step1496 ⟨d - 216, hi⟩
  ·
    by_cases h312 : d < 312
    ·
      by_cases h280 : d < 280
      ·
        have hi : d - 248 < 32 := by omega
        have heq : 248 + (d - 248) = d := by omega
        simpa only [heq] using step1497 ⟨d - 248, hi⟩
      ·
        have hi : d - 280 < 32 := by omega
        have heq : 280 + (d - 280) = d := by omega
        simpa only [heq] using step1498 ⟨d - 280, hi⟩
    ·
      by_cases h344 : d < 344
      ·
        have hi : d - 312 < 32 := by omega
        have heq : 312 + (d - 312) = d := by omega
        simpa only [heq] using step1499 ⟨d - 312, hi⟩
      ·
        by_cases h376 : d < 376
        ·
          have hi : d - 344 < 32 := by omega
          have heq : 344 + (d - 344) = d := by omega
          simpa only [heq] using step1500 ⟨d - 344, hi⟩
        ·
          have hi : d - 376 < 5 := by omega
          have heq : 376 + (d - 376) = d := by omega
          simpa only [heq] using step1501 ⟨d - 376, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121.fields1493,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121.step1493,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121.fields1494,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121.step1494,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121.fields1495,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121.step1495,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121.fields1496,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121.step1496,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121.fields1497,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121.step1497,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121.fields1498,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121.step1498,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121.fields1499,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121.step1499,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121.fields1500,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121.step1500,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121.fields1501,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121.step1501,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow121
