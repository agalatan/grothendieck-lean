import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow117
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118
import Grothe.UpperChaos.OriginalRow227TriangleForward1466
import Grothe.UpperChaos.OriginalRow227TriangleForward1467
import Grothe.UpperChaos.OriginalRow227TriangleForward1468
import Grothe.UpperChaos.OriginalRow227TriangleForward1469
import Grothe.UpperChaos.OriginalRow227TriangleForward1470
import Grothe.UpperChaos.OriginalRow227TriangleForward1471
import Grothe.UpperChaos.OriginalRow227TriangleForward1472
import Grothe.UpperChaos.OriginalRow227TriangleForward1473
import Grothe.UpperChaos.OriginalRow227TriangleForward1474

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1466 : OriginalRow227TriangleForward1466.entries.size = 32 := rfl

def entry1466 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1466.entries[i.val]'(by rw [size1466]; exact i.isLt)

theorem fields1466 (i : Fin 32) :
    (entry1466 i).IA = shift ∧ (entry1466 i).ID = S (117 + i.val + 1) ∧
      (entry1466 i).IC = S 118 ∧ (entry1466 i).Inext = T 117 (117 + i.val + 1) ∧
      (entry1466 i).Icur = T 117 (117 + i.val) ∧
      (entry1466 i).output = T 118 (117 + i.val) ∧
      (entry1466 i).charge = charge 117 (117 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1473_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1466 (i : Fin 32) :
    forwardStepOK (-768) (charge 117 (117 + i.val)) shift
      (S (117 + i.val + 1)) (S 118) (T 117 (117 + i.val + 1))
      (T 117 (117 + i.val)) (T 118 (117 + i.val))
      (OriginalRow227Roots.root_pos 118 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 117 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1466.entries OriginalRow227TriangleForward1466.checked
    ⟨i.val, by rw [size1466]; exact i.isLt⟩
  change (entry1466 i).check = true at h
  rcases fields1466 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1467 : OriginalRow227TriangleForward1467.entries.size = 32 := rfl

def entry1467 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1467.entries[i.val]'(by rw [size1467]; exact i.isLt)

theorem fields1467 (i : Fin 32) :
    (entry1467 i).IA = shift ∧ (entry1467 i).ID = S (149 + i.val + 1) ∧
      (entry1467 i).IC = S 118 ∧ (entry1467 i).Inext = T 117 (149 + i.val + 1) ∧
      (entry1467 i).Icur = T 117 (149 + i.val) ∧
      (entry1467 i).output = T 118 (149 + i.val) ∧
      (entry1467 i).charge = charge 117 (149 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1474_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1467 (i : Fin 32) :
    forwardStepOK (-768) (charge 117 (149 + i.val)) shift
      (S (149 + i.val + 1)) (S 118) (T 117 (149 + i.val + 1))
      (T 117 (149 + i.val)) (T 118 (149 + i.val))
      (OriginalRow227Roots.root_pos 118 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 117 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1467.entries OriginalRow227TriangleForward1467.checked
    ⟨i.val, by rw [size1467]; exact i.isLt⟩
  change (entry1467 i).check = true at h
  rcases fields1467 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1468 : OriginalRow227TriangleForward1468.entries.size = 32 := rfl

def entry1468 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1468.entries[i.val]'(by rw [size1468]; exact i.isLt)

theorem fields1468 (i : Fin 32) :
    (entry1468 i).IA = shift ∧ (entry1468 i).ID = S (181 + i.val + 1) ∧
      (entry1468 i).IC = S 118 ∧ (entry1468 i).Inext = T 117 (181 + i.val + 1) ∧
      (entry1468 i).Icur = T 117 (181 + i.val) ∧
      (entry1468 i).output = T 118 (181 + i.val) ∧
      (entry1468 i).charge = charge 117 (181 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1475_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1468 (i : Fin 32) :
    forwardStepOK (-768) (charge 117 (181 + i.val)) shift
      (S (181 + i.val + 1)) (S 118) (T 117 (181 + i.val + 1))
      (T 117 (181 + i.val)) (T 118 (181 + i.val))
      (OriginalRow227Roots.root_pos 118 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 117 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1468.entries OriginalRow227TriangleForward1468.checked
    ⟨i.val, by rw [size1468]; exact i.isLt⟩
  change (entry1468 i).check = true at h
  rcases fields1468 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1469 : OriginalRow227TriangleForward1469.entries.size = 32 := rfl

def entry1469 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1469.entries[i.val]'(by rw [size1469]; exact i.isLt)

theorem fields1469 (i : Fin 32) :
    (entry1469 i).IA = shift ∧ (entry1469 i).ID = S (213 + i.val + 1) ∧
      (entry1469 i).IC = S 118 ∧ (entry1469 i).Inext = T 117 (213 + i.val + 1) ∧
      (entry1469 i).Icur = T 117 (213 + i.val) ∧
      (entry1469 i).output = T 118 (213 + i.val) ∧
      (entry1469 i).charge = charge 117 (213 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1476_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1469 (i : Fin 32) :
    forwardStepOK (-768) (charge 117 (213 + i.val)) shift
      (S (213 + i.val + 1)) (S 118) (T 117 (213 + i.val + 1))
      (T 117 (213 + i.val)) (T 118 (213 + i.val))
      (OriginalRow227Roots.root_pos 118 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 117 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1469.entries OriginalRow227TriangleForward1469.checked
    ⟨i.val, by rw [size1469]; exact i.isLt⟩
  change (entry1469 i).check = true at h
  rcases fields1469 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1470 : OriginalRow227TriangleForward1470.entries.size = 32 := rfl

def entry1470 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1470.entries[i.val]'(by rw [size1470]; exact i.isLt)

theorem fields1470 (i : Fin 32) :
    (entry1470 i).IA = shift ∧ (entry1470 i).ID = S (245 + i.val + 1) ∧
      (entry1470 i).IC = S 118 ∧ (entry1470 i).Inext = T 117 (245 + i.val + 1) ∧
      (entry1470 i).Icur = T 117 (245 + i.val) ∧
      (entry1470 i).output = T 118 (245 + i.val) ∧
      (entry1470 i).charge = charge 117 (245 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1477_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1470 (i : Fin 32) :
    forwardStepOK (-768) (charge 117 (245 + i.val)) shift
      (S (245 + i.val + 1)) (S 118) (T 117 (245 + i.val + 1))
      (T 117 (245 + i.val)) (T 118 (245 + i.val))
      (OriginalRow227Roots.root_pos 118 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 117 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1470.entries OriginalRow227TriangleForward1470.checked
    ⟨i.val, by rw [size1470]; exact i.isLt⟩
  change (entry1470 i).check = true at h
  rcases fields1470 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1471 : OriginalRow227TriangleForward1471.entries.size = 32 := rfl

def entry1471 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1471.entries[i.val]'(by rw [size1471]; exact i.isLt)

theorem fields1471 (i : Fin 32) :
    (entry1471 i).IA = shift ∧ (entry1471 i).ID = S (277 + i.val + 1) ∧
      (entry1471 i).IC = S 118 ∧ (entry1471 i).Inext = T 117 (277 + i.val + 1) ∧
      (entry1471 i).Icur = T 117 (277 + i.val) ∧
      (entry1471 i).output = T 118 (277 + i.val) ∧
      (entry1471 i).charge = charge 117 (277 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1478_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1471 (i : Fin 32) :
    forwardStepOK (-768) (charge 117 (277 + i.val)) shift
      (S (277 + i.val + 1)) (S 118) (T 117 (277 + i.val + 1))
      (T 117 (277 + i.val)) (T 118 (277 + i.val))
      (OriginalRow227Roots.root_pos 118 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 117 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1471.entries OriginalRow227TriangleForward1471.checked
    ⟨i.val, by rw [size1471]; exact i.isLt⟩
  change (entry1471 i).check = true at h
  rcases fields1471 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1472 : OriginalRow227TriangleForward1472.entries.size = 32 := rfl

def entry1472 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1472.entries[i.val]'(by rw [size1472]; exact i.isLt)

theorem fields1472 (i : Fin 32) :
    (entry1472 i).IA = shift ∧ (entry1472 i).ID = S (309 + i.val + 1) ∧
      (entry1472 i).IC = S 118 ∧ (entry1472 i).Inext = T 117 (309 + i.val + 1) ∧
      (entry1472 i).Icur = T 117 (309 + i.val) ∧
      (entry1472 i).output = T 118 (309 + i.val) ∧
      (entry1472 i).charge = charge 117 (309 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1479_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1472 (i : Fin 32) :
    forwardStepOK (-768) (charge 117 (309 + i.val)) shift
      (S (309 + i.val + 1)) (S 118) (T 117 (309 + i.val + 1))
      (T 117 (309 + i.val)) (T 118 (309 + i.val))
      (OriginalRow227Roots.root_pos 118 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 117 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1472.entries OriginalRow227TriangleForward1472.checked
    ⟨i.val, by rw [size1472]; exact i.isLt⟩
  change (entry1472 i).check = true at h
  rcases fields1472 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1473 : OriginalRow227TriangleForward1473.entries.size = 32 := rfl

def entry1473 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1473.entries[i.val]'(by rw [size1473]; exact i.isLt)

theorem fields1473 (i : Fin 32) :
    (entry1473 i).IA = shift ∧ (entry1473 i).ID = S (341 + i.val + 1) ∧
      (entry1473 i).IC = S 118 ∧ (entry1473 i).Inext = T 117 (341 + i.val + 1) ∧
      (entry1473 i).Icur = T 117 (341 + i.val) ∧
      (entry1473 i).output = T 118 (341 + i.val) ∧
      (entry1473 i).charge = charge 117 (341 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1480_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1473 (i : Fin 32) :
    forwardStepOK (-768) (charge 117 (341 + i.val)) shift
      (S (341 + i.val + 1)) (S 118) (T 117 (341 + i.val + 1))
      (T 117 (341 + i.val)) (T 118 (341 + i.val))
      (OriginalRow227Roots.root_pos 118 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 117 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1473.entries OriginalRow227TriangleForward1473.checked
    ⟨i.val, by rw [size1473]; exact i.isLt⟩
  change (entry1473 i).check = true at h
  rcases fields1473 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1474 : OriginalRow227TriangleForward1474.entries.size = 11 := rfl

def entry1474 (i : Fin 11) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1474.entries[i.val]'(by rw [size1474]; exact i.isLt)

theorem fields1474 (i : Fin 11) :
    (entry1474 i).IA = shift ∧ (entry1474 i).ID = S (373 + i.val + 1) ∧
      (entry1474 i).IC = S 118 ∧ (entry1474 i).Inext = T 117 (373 + i.val + 1) ∧
      (entry1474 i).Icur = T 117 (373 + i.val) ∧
      (entry1474 i).output = T 118 (373 + i.val) ∧
      (entry1474 i).charge = charge 117 (373 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings03.S_eq_root118).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow117.block1481_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨10, by decide⟩).symm, rfl⟩

theorem step1474 (i : Fin 11) :
    forwardStepOK (-768) (charge 117 (373 + i.val)) shift
      (S (373 + i.val + 1)) (S 118) (T 117 (373 + i.val + 1))
      (T 117 (373 + i.val)) (T 118 (373 + i.val))
      (OriginalRow227Roots.root_pos 118 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 117 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1474.entries OriginalRow227TriangleForward1474.checked
    ⟨i.val, by rw [size1474]; exact i.isLt⟩
  change (entry1474 i).check = true at h
  rcases fields1474 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 117 ≤ d) (hhi : d < 384) :
    forwardStepOK (-768) (charge 117 d) shift (S (d + 1)) (S 118)
      (T 117 (d + 1)) (T 117 d) (T 118 d)
      (OriginalRow227Roots.root_pos 118 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 117 (by decide)) = true := by
  by_cases h245 : d < 245
  ·
    by_cases h181 : d < 181
    ·
      by_cases h149 : d < 149
      ·
        have hi : d - 117 < 32 := by omega
        have heq : 117 + (d - 117) = d := by omega
        simpa only [heq] using step1466 ⟨d - 117, hi⟩
      ·
        have hi : d - 149 < 32 := by omega
        have heq : 149 + (d - 149) = d := by omega
        simpa only [heq] using step1467 ⟨d - 149, hi⟩
    ·
      by_cases h213 : d < 213
      ·
        have hi : d - 181 < 32 := by omega
        have heq : 181 + (d - 181) = d := by omega
        simpa only [heq] using step1468 ⟨d - 181, hi⟩
      ·
        have hi : d - 213 < 32 := by omega
        have heq : 213 + (d - 213) = d := by omega
        simpa only [heq] using step1469 ⟨d - 213, hi⟩
  ·
    by_cases h309 : d < 309
    ·
      by_cases h277 : d < 277
      ·
        have hi : d - 245 < 32 := by omega
        have heq : 245 + (d - 245) = d := by omega
        simpa only [heq] using step1470 ⟨d - 245, hi⟩
      ·
        have hi : d - 277 < 32 := by omega
        have heq : 277 + (d - 277) = d := by omega
        simpa only [heq] using step1471 ⟨d - 277, hi⟩
    ·
      by_cases h341 : d < 341
      ·
        have hi : d - 309 < 32 := by omega
        have heq : 309 + (d - 309) = d := by omega
        simpa only [heq] using step1472 ⟨d - 309, hi⟩
      ·
        by_cases h373 : d < 373
        ·
          have hi : d - 341 < 32 := by omega
          have heq : 341 + (d - 341) = d := by omega
          simpa only [heq] using step1473 ⟨d - 341, hi⟩
        ·
          have hi : d - 373 < 11 := by omega
          have heq : 373 + (d - 373) = d := by omega
          simpa only [heq] using step1474 ⟨d - 373, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118.fields1466,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118.step1466,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118.fields1467,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118.step1467,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118.fields1468,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118.step1468,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118.fields1469,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118.step1469,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118.fields1470,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118.step1470,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118.fields1471,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118.step1471,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118.fields1472,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118.step1472,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118.fields1473,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118.step1473,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118.fields1474,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118.step1474,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow118
