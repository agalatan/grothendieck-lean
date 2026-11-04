import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow118
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119
import Grothe.UpperChaos.OriginalRow227TriangleForward1475
import Grothe.UpperChaos.OriginalRow227TriangleForward1476
import Grothe.UpperChaos.OriginalRow227TriangleForward1477
import Grothe.UpperChaos.OriginalRow227TriangleForward1478
import Grothe.UpperChaos.OriginalRow227TriangleForward1479
import Grothe.UpperChaos.OriginalRow227TriangleForward1480
import Grothe.UpperChaos.OriginalRow227TriangleForward1481
import Grothe.UpperChaos.OriginalRow227TriangleForward1482
import Grothe.UpperChaos.OriginalRow227TriangleForward1483

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1475 : OriginalRow227TriangleForward1475.entries.size = 32 := rfl

def entry1475 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1475.entries[i.val]'(by rw [size1475]; exact i.isLt)

theorem fields1475 (i : Fin 32) :
    (entry1475 i).IA = shift ∧ (entry1475 i).ID = S (118 + i.val + 1) ∧
      (entry1475 i).IC = S 119 ∧ (entry1475 i).Inext = T 118 (118 + i.val + 1) ∧
      (entry1475 i).Icur = T 118 (118 + i.val) ∧
      (entry1475 i).output = T 119 (118 + i.val) ∧
      (entry1475 i).charge = charge 118 (118 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1482_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1475 (i : Fin 32) :
    forwardStepOK (-768) (charge 118 (118 + i.val)) shift
      (S (118 + i.val + 1)) (S 119) (T 118 (118 + i.val + 1))
      (T 118 (118 + i.val)) (T 119 (118 + i.val))
      (OriginalRow227Roots.root_pos 119 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 118 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1475.entries OriginalRow227TriangleForward1475.checked
    ⟨i.val, by rw [size1475]; exact i.isLt⟩
  change (entry1475 i).check = true at h
  rcases fields1475 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1476 : OriginalRow227TriangleForward1476.entries.size = 32 := rfl

def entry1476 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1476.entries[i.val]'(by rw [size1476]; exact i.isLt)

theorem fields1476 (i : Fin 32) :
    (entry1476 i).IA = shift ∧ (entry1476 i).ID = S (150 + i.val + 1) ∧
      (entry1476 i).IC = S 119 ∧ (entry1476 i).Inext = T 118 (150 + i.val + 1) ∧
      (entry1476 i).Icur = T 118 (150 + i.val) ∧
      (entry1476 i).output = T 119 (150 + i.val) ∧
      (entry1476 i).charge = charge 118 (150 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1483_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1476 (i : Fin 32) :
    forwardStepOK (-768) (charge 118 (150 + i.val)) shift
      (S (150 + i.val + 1)) (S 119) (T 118 (150 + i.val + 1))
      (T 118 (150 + i.val)) (T 119 (150 + i.val))
      (OriginalRow227Roots.root_pos 119 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 118 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1476.entries OriginalRow227TriangleForward1476.checked
    ⟨i.val, by rw [size1476]; exact i.isLt⟩
  change (entry1476 i).check = true at h
  rcases fields1476 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1477 : OriginalRow227TriangleForward1477.entries.size = 32 := rfl

def entry1477 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1477.entries[i.val]'(by rw [size1477]; exact i.isLt)

theorem fields1477 (i : Fin 32) :
    (entry1477 i).IA = shift ∧ (entry1477 i).ID = S (182 + i.val + 1) ∧
      (entry1477 i).IC = S 119 ∧ (entry1477 i).Inext = T 118 (182 + i.val + 1) ∧
      (entry1477 i).Icur = T 118 (182 + i.val) ∧
      (entry1477 i).output = T 119 (182 + i.val) ∧
      (entry1477 i).charge = charge 118 (182 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1484_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1477 (i : Fin 32) :
    forwardStepOK (-768) (charge 118 (182 + i.val)) shift
      (S (182 + i.val + 1)) (S 119) (T 118 (182 + i.val + 1))
      (T 118 (182 + i.val)) (T 119 (182 + i.val))
      (OriginalRow227Roots.root_pos 119 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 118 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1477.entries OriginalRow227TriangleForward1477.checked
    ⟨i.val, by rw [size1477]; exact i.isLt⟩
  change (entry1477 i).check = true at h
  rcases fields1477 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1478 : OriginalRow227TriangleForward1478.entries.size = 32 := rfl

def entry1478 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1478.entries[i.val]'(by rw [size1478]; exact i.isLt)

theorem fields1478 (i : Fin 32) :
    (entry1478 i).IA = shift ∧ (entry1478 i).ID = S (214 + i.val + 1) ∧
      (entry1478 i).IC = S 119 ∧ (entry1478 i).Inext = T 118 (214 + i.val + 1) ∧
      (entry1478 i).Icur = T 118 (214 + i.val) ∧
      (entry1478 i).output = T 119 (214 + i.val) ∧
      (entry1478 i).charge = charge 118 (214 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1485_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1478 (i : Fin 32) :
    forwardStepOK (-768) (charge 118 (214 + i.val)) shift
      (S (214 + i.val + 1)) (S 119) (T 118 (214 + i.val + 1))
      (T 118 (214 + i.val)) (T 119 (214 + i.val))
      (OriginalRow227Roots.root_pos 119 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 118 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1478.entries OriginalRow227TriangleForward1478.checked
    ⟨i.val, by rw [size1478]; exact i.isLt⟩
  change (entry1478 i).check = true at h
  rcases fields1478 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1479 : OriginalRow227TriangleForward1479.entries.size = 32 := rfl

def entry1479 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1479.entries[i.val]'(by rw [size1479]; exact i.isLt)

theorem fields1479 (i : Fin 32) :
    (entry1479 i).IA = shift ∧ (entry1479 i).ID = S (246 + i.val + 1) ∧
      (entry1479 i).IC = S 119 ∧ (entry1479 i).Inext = T 118 (246 + i.val + 1) ∧
      (entry1479 i).Icur = T 118 (246 + i.val) ∧
      (entry1479 i).output = T 119 (246 + i.val) ∧
      (entry1479 i).charge = charge 118 (246 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1486_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1479 (i : Fin 32) :
    forwardStepOK (-768) (charge 118 (246 + i.val)) shift
      (S (246 + i.val + 1)) (S 119) (T 118 (246 + i.val + 1))
      (T 118 (246 + i.val)) (T 119 (246 + i.val))
      (OriginalRow227Roots.root_pos 119 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 118 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1479.entries OriginalRow227TriangleForward1479.checked
    ⟨i.val, by rw [size1479]; exact i.isLt⟩
  change (entry1479 i).check = true at h
  rcases fields1479 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1480 : OriginalRow227TriangleForward1480.entries.size = 32 := rfl

def entry1480 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1480.entries[i.val]'(by rw [size1480]; exact i.isLt)

theorem fields1480 (i : Fin 32) :
    (entry1480 i).IA = shift ∧ (entry1480 i).ID = S (278 + i.val + 1) ∧
      (entry1480 i).IC = S 119 ∧ (entry1480 i).Inext = T 118 (278 + i.val + 1) ∧
      (entry1480 i).Icur = T 118 (278 + i.val) ∧
      (entry1480 i).output = T 119 (278 + i.val) ∧
      (entry1480 i).charge = charge 118 (278 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1487_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1480 (i : Fin 32) :
    forwardStepOK (-768) (charge 118 (278 + i.val)) shift
      (S (278 + i.val + 1)) (S 119) (T 118 (278 + i.val + 1))
      (T 118 (278 + i.val)) (T 119 (278 + i.val))
      (OriginalRow227Roots.root_pos 119 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 118 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1480.entries OriginalRow227TriangleForward1480.checked
    ⟨i.val, by rw [size1480]; exact i.isLt⟩
  change (entry1480 i).check = true at h
  rcases fields1480 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1481 : OriginalRow227TriangleForward1481.entries.size = 32 := rfl

def entry1481 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1481.entries[i.val]'(by rw [size1481]; exact i.isLt)

theorem fields1481 (i : Fin 32) :
    (entry1481 i).IA = shift ∧ (entry1481 i).ID = S (310 + i.val + 1) ∧
      (entry1481 i).IC = S 119 ∧ (entry1481 i).Inext = T 118 (310 + i.val + 1) ∧
      (entry1481 i).Icur = T 118 (310 + i.val) ∧
      (entry1481 i).output = T 119 (310 + i.val) ∧
      (entry1481 i).charge = charge 118 (310 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1488_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1481 (i : Fin 32) :
    forwardStepOK (-768) (charge 118 (310 + i.val)) shift
      (S (310 + i.val + 1)) (S 119) (T 118 (310 + i.val + 1))
      (T 118 (310 + i.val)) (T 119 (310 + i.val))
      (OriginalRow227Roots.root_pos 119 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 118 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1481.entries OriginalRow227TriangleForward1481.checked
    ⟨i.val, by rw [size1481]; exact i.isLt⟩
  change (entry1481 i).check = true at h
  rcases fields1481 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1482 : OriginalRow227TriangleForward1482.entries.size = 32 := rfl

def entry1482 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1482.entries[i.val]'(by rw [size1482]; exact i.isLt)

theorem fields1482 (i : Fin 32) :
    (entry1482 i).IA = shift ∧ (entry1482 i).ID = S (342 + i.val + 1) ∧
      (entry1482 i).IC = S 119 ∧ (entry1482 i).Inext = T 118 (342 + i.val + 1) ∧
      (entry1482 i).Icur = T 118 (342 + i.val) ∧
      (entry1482 i).output = T 119 (342 + i.val) ∧
      (entry1482 i).charge = charge 118 (342 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1489_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1482 (i : Fin 32) :
    forwardStepOK (-768) (charge 118 (342 + i.val)) shift
      (S (342 + i.val + 1)) (S 119) (T 118 (342 + i.val + 1))
      (T 118 (342 + i.val)) (T 119 (342 + i.val))
      (OriginalRow227Roots.root_pos 119 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 118 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1482.entries OriginalRow227TriangleForward1482.checked
    ⟨i.val, by rw [size1482]; exact i.isLt⟩
  change (entry1482 i).check = true at h
  rcases fields1482 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1483 : OriginalRow227TriangleForward1483.entries.size = 9 := rfl

def entry1483 (i : Fin 9) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1483.entries[i.val]'(by rw [size1483]; exact i.isLt)

theorem fields1483 (i : Fin 9) :
    (entry1483 i).IA = shift ∧ (entry1483 i).ID = S (374 + i.val + 1) ∧
      (entry1483 i).IC = S 119 ∧ (entry1483 i).Inext = T 118 (374 + i.val + 1) ∧
      (entry1483 i).Icur = T 118 (374 + i.val) ∧
      (entry1483 i).output = T 119 (374 + i.val) ∧
      (entry1483 i).charge = charge 118 (374 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings03.S_eq_root119).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow118.block1490_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨8, by decide⟩).symm, rfl⟩

theorem step1483 (i : Fin 9) :
    forwardStepOK (-768) (charge 118 (374 + i.val)) shift
      (S (374 + i.val + 1)) (S 119) (T 118 (374 + i.val + 1))
      (T 118 (374 + i.val)) (T 119 (374 + i.val))
      (OriginalRow227Roots.root_pos 119 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 118 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1483.entries OriginalRow227TriangleForward1483.checked
    ⟨i.val, by rw [size1483]; exact i.isLt⟩
  change (entry1483 i).check = true at h
  rcases fields1483 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 118 ≤ d) (hhi : d < 383) :
    forwardStepOK (-768) (charge 118 d) shift (S (d + 1)) (S 119)
      (T 118 (d + 1)) (T 118 d) (T 119 d)
      (OriginalRow227Roots.root_pos 119 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 118 (by decide)) = true := by
  by_cases h246 : d < 246
  ·
    by_cases h182 : d < 182
    ·
      by_cases h150 : d < 150
      ·
        have hi : d - 118 < 32 := by omega
        have heq : 118 + (d - 118) = d := by omega
        simpa only [heq] using step1475 ⟨d - 118, hi⟩
      ·
        have hi : d - 150 < 32 := by omega
        have heq : 150 + (d - 150) = d := by omega
        simpa only [heq] using step1476 ⟨d - 150, hi⟩
    ·
      by_cases h214 : d < 214
      ·
        have hi : d - 182 < 32 := by omega
        have heq : 182 + (d - 182) = d := by omega
        simpa only [heq] using step1477 ⟨d - 182, hi⟩
      ·
        have hi : d - 214 < 32 := by omega
        have heq : 214 + (d - 214) = d := by omega
        simpa only [heq] using step1478 ⟨d - 214, hi⟩
  ·
    by_cases h310 : d < 310
    ·
      by_cases h278 : d < 278
      ·
        have hi : d - 246 < 32 := by omega
        have heq : 246 + (d - 246) = d := by omega
        simpa only [heq] using step1479 ⟨d - 246, hi⟩
      ·
        have hi : d - 278 < 32 := by omega
        have heq : 278 + (d - 278) = d := by omega
        simpa only [heq] using step1480 ⟨d - 278, hi⟩
    ·
      by_cases h342 : d < 342
      ·
        have hi : d - 310 < 32 := by omega
        have heq : 310 + (d - 310) = d := by omega
        simpa only [heq] using step1481 ⟨d - 310, hi⟩
      ·
        by_cases h374 : d < 374
        ·
          have hi : d - 342 < 32 := by omega
          have heq : 342 + (d - 342) = d := by omega
          simpa only [heq] using step1482 ⟨d - 342, hi⟩
        ·
          have hi : d - 374 < 9 := by omega
          have heq : 374 + (d - 374) = d := by omega
          simpa only [heq] using step1483 ⟨d - 374, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119.fields1475,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119.step1475,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119.fields1476,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119.step1476,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119.fields1477,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119.step1477,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119.fields1478,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119.step1478,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119.fields1479,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119.step1479,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119.fields1480,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119.step1480,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119.fields1481,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119.step1481,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119.fields1482,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119.step1482,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119.fields1483,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119.step1483,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow119
