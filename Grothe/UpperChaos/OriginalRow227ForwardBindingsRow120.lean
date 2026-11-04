import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow119
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow120
import Grothe.UpperChaos.OriginalRow227TriangleForward1484
import Grothe.UpperChaos.OriginalRow227TriangleForward1485
import Grothe.UpperChaos.OriginalRow227TriangleForward1486
import Grothe.UpperChaos.OriginalRow227TriangleForward1487
import Grothe.UpperChaos.OriginalRow227TriangleForward1488
import Grothe.UpperChaos.OriginalRow227TriangleForward1489
import Grothe.UpperChaos.OriginalRow227TriangleForward1490
import Grothe.UpperChaos.OriginalRow227TriangleForward1491
import Grothe.UpperChaos.OriginalRow227TriangleForward1492

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1484 : OriginalRow227TriangleForward1484.entries.size = 32 := rfl

def entry1484 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1484.entries[i.val]'(by rw [size1484]; exact i.isLt)

theorem fields1484 (i : Fin 32) :
    (entry1484 i).IA = shift ∧ (entry1484 i).ID = S (119 + i.val + 1) ∧
      (entry1484 i).IC = S 120 ∧ (entry1484 i).Inext = T 119 (119 + i.val + 1) ∧
      (entry1484 i).Icur = T 119 (119 + i.val) ∧
      (entry1484 i).output = T 120 (119 + i.val) ∧
      (entry1484 i).charge = charge 119 (119 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1491_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1500_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1484 (i : Fin 32) :
    forwardStepOK (-768) (charge 119 (119 + i.val)) shift
      (S (119 + i.val + 1)) (S 120) (T 119 (119 + i.val + 1))
      (T 119 (119 + i.val)) (T 120 (119 + i.val))
      (OriginalRow227Roots.root_pos 120 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 119 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1484.entries OriginalRow227TriangleForward1484.checked
    ⟨i.val, by rw [size1484]; exact i.isLt⟩
  change (entry1484 i).check = true at h
  rcases fields1484 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1485 : OriginalRow227TriangleForward1485.entries.size = 32 := rfl

def entry1485 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1485.entries[i.val]'(by rw [size1485]; exact i.isLt)

theorem fields1485 (i : Fin 32) :
    (entry1485 i).IA = shift ∧ (entry1485 i).ID = S (151 + i.val + 1) ∧
      (entry1485 i).IC = S 120 ∧ (entry1485 i).Inext = T 119 (151 + i.val + 1) ∧
      (entry1485 i).Icur = T 119 (151 + i.val) ∧
      (entry1485 i).output = T 120 (151 + i.val) ∧
      (entry1485 i).charge = charge 119 (151 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1492_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1501_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1485 (i : Fin 32) :
    forwardStepOK (-768) (charge 119 (151 + i.val)) shift
      (S (151 + i.val + 1)) (S 120) (T 119 (151 + i.val + 1))
      (T 119 (151 + i.val)) (T 120 (151 + i.val))
      (OriginalRow227Roots.root_pos 120 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 119 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1485.entries OriginalRow227TriangleForward1485.checked
    ⟨i.val, by rw [size1485]; exact i.isLt⟩
  change (entry1485 i).check = true at h
  rcases fields1485 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1486 : OriginalRow227TriangleForward1486.entries.size = 32 := rfl

def entry1486 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1486.entries[i.val]'(by rw [size1486]; exact i.isLt)

theorem fields1486 (i : Fin 32) :
    (entry1486 i).IA = shift ∧ (entry1486 i).ID = S (183 + i.val + 1) ∧
      (entry1486 i).IC = S 120 ∧ (entry1486 i).Inext = T 119 (183 + i.val + 1) ∧
      (entry1486 i).Icur = T 119 (183 + i.val) ∧
      (entry1486 i).output = T 120 (183 + i.val) ∧
      (entry1486 i).charge = charge 119 (183 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1493_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1502_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1486 (i : Fin 32) :
    forwardStepOK (-768) (charge 119 (183 + i.val)) shift
      (S (183 + i.val + 1)) (S 120) (T 119 (183 + i.val + 1))
      (T 119 (183 + i.val)) (T 120 (183 + i.val))
      (OriginalRow227Roots.root_pos 120 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 119 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1486.entries OriginalRow227TriangleForward1486.checked
    ⟨i.val, by rw [size1486]; exact i.isLt⟩
  change (entry1486 i).check = true at h
  rcases fields1486 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1487 : OriginalRow227TriangleForward1487.entries.size = 32 := rfl

def entry1487 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1487.entries[i.val]'(by rw [size1487]; exact i.isLt)

theorem fields1487 (i : Fin 32) :
    (entry1487 i).IA = shift ∧ (entry1487 i).ID = S (215 + i.val + 1) ∧
      (entry1487 i).IC = S 120 ∧ (entry1487 i).Inext = T 119 (215 + i.val + 1) ∧
      (entry1487 i).Icur = T 119 (215 + i.val) ∧
      (entry1487 i).output = T 120 (215 + i.val) ∧
      (entry1487 i).charge = charge 119 (215 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1494_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1503_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1487 (i : Fin 32) :
    forwardStepOK (-768) (charge 119 (215 + i.val)) shift
      (S (215 + i.val + 1)) (S 120) (T 119 (215 + i.val + 1))
      (T 119 (215 + i.val)) (T 120 (215 + i.val))
      (OriginalRow227Roots.root_pos 120 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 119 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1487.entries OriginalRow227TriangleForward1487.checked
    ⟨i.val, by rw [size1487]; exact i.isLt⟩
  change (entry1487 i).check = true at h
  rcases fields1487 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1488 : OriginalRow227TriangleForward1488.entries.size = 32 := rfl

def entry1488 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1488.entries[i.val]'(by rw [size1488]; exact i.isLt)

theorem fields1488 (i : Fin 32) :
    (entry1488 i).IA = shift ∧ (entry1488 i).ID = S (247 + i.val + 1) ∧
      (entry1488 i).IC = S 120 ∧ (entry1488 i).Inext = T 119 (247 + i.val + 1) ∧
      (entry1488 i).Icur = T 119 (247 + i.val) ∧
      (entry1488 i).output = T 120 (247 + i.val) ∧
      (entry1488 i).charge = charge 119 (247 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1495_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1504_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1488 (i : Fin 32) :
    forwardStepOK (-768) (charge 119 (247 + i.val)) shift
      (S (247 + i.val + 1)) (S 120) (T 119 (247 + i.val + 1))
      (T 119 (247 + i.val)) (T 120 (247 + i.val))
      (OriginalRow227Roots.root_pos 120 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 119 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1488.entries OriginalRow227TriangleForward1488.checked
    ⟨i.val, by rw [size1488]; exact i.isLt⟩
  change (entry1488 i).check = true at h
  rcases fields1488 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1489 : OriginalRow227TriangleForward1489.entries.size = 32 := rfl

def entry1489 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1489.entries[i.val]'(by rw [size1489]; exact i.isLt)

theorem fields1489 (i : Fin 32) :
    (entry1489 i).IA = shift ∧ (entry1489 i).ID = S (279 + i.val + 1) ∧
      (entry1489 i).IC = S 120 ∧ (entry1489 i).Inext = T 119 (279 + i.val + 1) ∧
      (entry1489 i).Icur = T 119 (279 + i.val) ∧
      (entry1489 i).output = T 120 (279 + i.val) ∧
      (entry1489 i).charge = charge 119 (279 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1496_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1505_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1489 (i : Fin 32) :
    forwardStepOK (-768) (charge 119 (279 + i.val)) shift
      (S (279 + i.val + 1)) (S 120) (T 119 (279 + i.val + 1))
      (T 119 (279 + i.val)) (T 120 (279 + i.val))
      (OriginalRow227Roots.root_pos 120 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 119 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1489.entries OriginalRow227TriangleForward1489.checked
    ⟨i.val, by rw [size1489]; exact i.isLt⟩
  change (entry1489 i).check = true at h
  rcases fields1489 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1490 : OriginalRow227TriangleForward1490.entries.size = 32 := rfl

def entry1490 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1490.entries[i.val]'(by rw [size1490]; exact i.isLt)

theorem fields1490 (i : Fin 32) :
    (entry1490 i).IA = shift ∧ (entry1490 i).ID = S (311 + i.val + 1) ∧
      (entry1490 i).IC = S 120 ∧ (entry1490 i).Inext = T 119 (311 + i.val + 1) ∧
      (entry1490 i).Icur = T 119 (311 + i.val) ∧
      (entry1490 i).output = T 120 (311 + i.val) ∧
      (entry1490 i).charge = charge 119 (311 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1497_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1506_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1490 (i : Fin 32) :
    forwardStepOK (-768) (charge 119 (311 + i.val)) shift
      (S (311 + i.val + 1)) (S 120) (T 119 (311 + i.val + 1))
      (T 119 (311 + i.val)) (T 120 (311 + i.val))
      (OriginalRow227Roots.root_pos 120 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 119 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1490.entries OriginalRow227TriangleForward1490.checked
    ⟨i.val, by rw [size1490]; exact i.isLt⟩
  change (entry1490 i).check = true at h
  rcases fields1490 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1491 : OriginalRow227TriangleForward1491.entries.size = 32 := rfl

def entry1491 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1491.entries[i.val]'(by rw [size1491]; exact i.isLt)

theorem fields1491 (i : Fin 32) :
    (entry1491 i).IA = shift ∧ (entry1491 i).ID = S (343 + i.val + 1) ∧
      (entry1491 i).IC = S 120 ∧ (entry1491 i).Inext = T 119 (343 + i.val + 1) ∧
      (entry1491 i).Icur = T 119 (343 + i.val) ∧
      (entry1491 i).output = T 120 (343 + i.val) ∧
      (entry1491 i).charge = charge 119 (343 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1498_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1507_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1491 (i : Fin 32) :
    forwardStepOK (-768) (charge 119 (343 + i.val)) shift
      (S (343 + i.val + 1)) (S 120) (T 119 (343 + i.val + 1))
      (T 119 (343 + i.val)) (T 120 (343 + i.val))
      (OriginalRow227Roots.root_pos 120 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 119 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1491.entries OriginalRow227TriangleForward1491.checked
    ⟨i.val, by rw [size1491]; exact i.isLt⟩
  change (entry1491 i).check = true at h
  rcases fields1491 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1492 : OriginalRow227TriangleForward1492.entries.size = 7 := rfl

def entry1492 (i : Fin 7) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1492.entries[i.val]'(by rw [size1492]; exact i.isLt)

theorem fields1492 (i : Fin 7) :
    (entry1492 i).IA = shift ∧ (entry1492 i).ID = S (375 + i.val + 1) ∧
      (entry1492 i).IC = S 120 ∧ (entry1492 i).Inext = T 119 (375 + i.val + 1) ∧
      (entry1492 i).Icur = T 119 (375 + i.val) ∧
      (entry1492 i).output = T 120 (375 + i.val) ∧
      (entry1492 i).charge = charge 119 (375 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings03.S_eq_root120).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow119.block1499_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow120.block1508_value ⟨6, by decide⟩).symm, rfl⟩

theorem step1492 (i : Fin 7) :
    forwardStepOK (-768) (charge 119 (375 + i.val)) shift
      (S (375 + i.val + 1)) (S 120) (T 119 (375 + i.val + 1))
      (T 119 (375 + i.val)) (T 120 (375 + i.val))
      (OriginalRow227Roots.root_pos 120 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 119 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1492.entries OriginalRow227TriangleForward1492.checked
    ⟨i.val, by rw [size1492]; exact i.isLt⟩
  change (entry1492 i).check = true at h
  rcases fields1492 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 119 ≤ d) (hhi : d < 382) :
    forwardStepOK (-768) (charge 119 d) shift (S (d + 1)) (S 120)
      (T 119 (d + 1)) (T 119 d) (T 120 d)
      (OriginalRow227Roots.root_pos 120 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 119 (by decide)) = true := by
  by_cases h247 : d < 247
  ·
    by_cases h183 : d < 183
    ·
      by_cases h151 : d < 151
      ·
        have hi : d - 119 < 32 := by omega
        have heq : 119 + (d - 119) = d := by omega
        simpa only [heq] using step1484 ⟨d - 119, hi⟩
      ·
        have hi : d - 151 < 32 := by omega
        have heq : 151 + (d - 151) = d := by omega
        simpa only [heq] using step1485 ⟨d - 151, hi⟩
    ·
      by_cases h215 : d < 215
      ·
        have hi : d - 183 < 32 := by omega
        have heq : 183 + (d - 183) = d := by omega
        simpa only [heq] using step1486 ⟨d - 183, hi⟩
      ·
        have hi : d - 215 < 32 := by omega
        have heq : 215 + (d - 215) = d := by omega
        simpa only [heq] using step1487 ⟨d - 215, hi⟩
  ·
    by_cases h311 : d < 311
    ·
      by_cases h279 : d < 279
      ·
        have hi : d - 247 < 32 := by omega
        have heq : 247 + (d - 247) = d := by omega
        simpa only [heq] using step1488 ⟨d - 247, hi⟩
      ·
        have hi : d - 279 < 32 := by omega
        have heq : 279 + (d - 279) = d := by omega
        simpa only [heq] using step1489 ⟨d - 279, hi⟩
    ·
      by_cases h343 : d < 343
      ·
        have hi : d - 311 < 32 := by omega
        have heq : 311 + (d - 311) = d := by omega
        simpa only [heq] using step1490 ⟨d - 311, hi⟩
      ·
        by_cases h375 : d < 375
        ·
          have hi : d - 343 < 32 := by omega
          have heq : 343 + (d - 343) = d := by omega
          simpa only [heq] using step1491 ⟨d - 343, hi⟩
        ·
          have hi : d - 375 < 7 := by omega
          have heq : 375 + (d - 375) = d := by omega
          simpa only [heq] using step1492 ⟨d - 375, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120.fields1484,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120.step1484,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120.fields1485,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120.step1485,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120.fields1486,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120.step1486,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120.fields1487,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120.step1487,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120.fields1488,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120.step1488,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120.fields1489,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120.step1489,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120.fields1490,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120.step1490,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120.fields1491,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120.step1491,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120.fields1492,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120.step1492,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow120
