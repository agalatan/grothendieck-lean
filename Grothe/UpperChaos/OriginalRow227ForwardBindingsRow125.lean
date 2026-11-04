import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125
import Grothe.UpperChaos.OriginalRow227TriangleForward1528
import Grothe.UpperChaos.OriginalRow227TriangleForward1529
import Grothe.UpperChaos.OriginalRow227TriangleForward1530
import Grothe.UpperChaos.OriginalRow227TriangleForward1531
import Grothe.UpperChaos.OriginalRow227TriangleForward1532
import Grothe.UpperChaos.OriginalRow227TriangleForward1533
import Grothe.UpperChaos.OriginalRow227TriangleForward1534
import Grothe.UpperChaos.OriginalRow227TriangleForward1535

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow125

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1528 : OriginalRow227TriangleForward1528.entries.size = 32 := rfl

def entry1528 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1528.entries[i.val]'(by rw [size1528]; exact i.isLt)

theorem fields1528 (i : Fin 32) :
    (entry1528 i).IA = shift ∧ (entry1528 i).ID = S (124 + i.val + 1) ∧
      (entry1528 i).IC = S 125 ∧ (entry1528 i).Inext = T 124 (124 + i.val + 1) ∧
      (entry1528 i).Icur = T 124 (124 + i.val) ∧
      (entry1528 i).output = T 125 (124 + i.val) ∧
      (entry1528 i).charge = charge 124 (124 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1528 (i : Fin 32) :
    forwardStepOK (-768) (charge 124 (124 + i.val)) shift
      (S (124 + i.val + 1)) (S 125) (T 124 (124 + i.val + 1))
      (T 124 (124 + i.val)) (T 125 (124 + i.val))
      (OriginalRow227Roots.root_pos 125 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 124 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1528.entries OriginalRow227TriangleForward1528.checked
    ⟨i.val, by rw [size1528]; exact i.isLt⟩
  change (entry1528 i).check = true at h
  rcases fields1528 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1529 : OriginalRow227TriangleForward1529.entries.size = 32 := rfl

def entry1529 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1529.entries[i.val]'(by rw [size1529]; exact i.isLt)

theorem fields1529 (i : Fin 32) :
    (entry1529 i).IA = shift ∧ (entry1529 i).ID = S (156 + i.val + 1) ∧
      (entry1529 i).IC = S 125 ∧ (entry1529 i).Inext = T 124 (156 + i.val + 1) ∧
      (entry1529 i).Icur = T 124 (156 + i.val) ∧
      (entry1529 i).output = T 125 (156 + i.val) ∧
      (entry1529 i).charge = charge 124 (156 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1529 (i : Fin 32) :
    forwardStepOK (-768) (charge 124 (156 + i.val)) shift
      (S (156 + i.val + 1)) (S 125) (T 124 (156 + i.val + 1))
      (T 124 (156 + i.val)) (T 125 (156 + i.val))
      (OriginalRow227Roots.root_pos 125 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 124 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1529.entries OriginalRow227TriangleForward1529.checked
    ⟨i.val, by rw [size1529]; exact i.isLt⟩
  change (entry1529 i).check = true at h
  rcases fields1529 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1530 : OriginalRow227TriangleForward1530.entries.size = 32 := rfl

def entry1530 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1530.entries[i.val]'(by rw [size1530]; exact i.isLt)

theorem fields1530 (i : Fin 32) :
    (entry1530 i).IA = shift ∧ (entry1530 i).ID = S (188 + i.val + 1) ∧
      (entry1530 i).IC = S 125 ∧ (entry1530 i).Inext = T 124 (188 + i.val + 1) ∧
      (entry1530 i).Icur = T 124 (188 + i.val) ∧
      (entry1530 i).output = T 125 (188 + i.val) ∧
      (entry1530 i).charge = charge 124 (188 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1530 (i : Fin 32) :
    forwardStepOK (-768) (charge 124 (188 + i.val)) shift
      (S (188 + i.val + 1)) (S 125) (T 124 (188 + i.val + 1))
      (T 124 (188 + i.val)) (T 125 (188 + i.val))
      (OriginalRow227Roots.root_pos 125 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 124 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1530.entries OriginalRow227TriangleForward1530.checked
    ⟨i.val, by rw [size1530]; exact i.isLt⟩
  change (entry1530 i).check = true at h
  rcases fields1530 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1531 : OriginalRow227TriangleForward1531.entries.size = 32 := rfl

def entry1531 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1531.entries[i.val]'(by rw [size1531]; exact i.isLt)

theorem fields1531 (i : Fin 32) :
    (entry1531 i).IA = shift ∧ (entry1531 i).ID = S (220 + i.val + 1) ∧
      (entry1531 i).IC = S 125 ∧ (entry1531 i).Inext = T 124 (220 + i.val + 1) ∧
      (entry1531 i).Icur = T 124 (220 + i.val) ∧
      (entry1531 i).output = T 125 (220 + i.val) ∧
      (entry1531 i).charge = charge 124 (220 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1531 (i : Fin 32) :
    forwardStepOK (-768) (charge 124 (220 + i.val)) shift
      (S (220 + i.val + 1)) (S 125) (T 124 (220 + i.val + 1))
      (T 124 (220 + i.val)) (T 125 (220 + i.val))
      (OriginalRow227Roots.root_pos 125 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 124 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1531.entries OriginalRow227TriangleForward1531.checked
    ⟨i.val, by rw [size1531]; exact i.isLt⟩
  change (entry1531 i).check = true at h
  rcases fields1531 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1532 : OriginalRow227TriangleForward1532.entries.size = 32 := rfl

def entry1532 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1532.entries[i.val]'(by rw [size1532]; exact i.isLt)

theorem fields1532 (i : Fin 32) :
    (entry1532 i).IA = shift ∧ (entry1532 i).ID = S (252 + i.val + 1) ∧
      (entry1532 i).IC = S 125 ∧ (entry1532 i).Inext = T 124 (252 + i.val + 1) ∧
      (entry1532 i).Icur = T 124 (252 + i.val) ∧
      (entry1532 i).output = T 125 (252 + i.val) ∧
      (entry1532 i).charge = charge 124 (252 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1532 (i : Fin 32) :
    forwardStepOK (-768) (charge 124 (252 + i.val)) shift
      (S (252 + i.val + 1)) (S 125) (T 124 (252 + i.val + 1))
      (T 124 (252 + i.val)) (T 125 (252 + i.val))
      (OriginalRow227Roots.root_pos 125 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 124 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1532.entries OriginalRow227TriangleForward1532.checked
    ⟨i.val, by rw [size1532]; exact i.isLt⟩
  change (entry1532 i).check = true at h
  rcases fields1532 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1533 : OriginalRow227TriangleForward1533.entries.size = 32 := rfl

def entry1533 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1533.entries[i.val]'(by rw [size1533]; exact i.isLt)

theorem fields1533 (i : Fin 32) :
    (entry1533 i).IA = shift ∧ (entry1533 i).ID = S (284 + i.val + 1) ∧
      (entry1533 i).IC = S 125 ∧ (entry1533 i).Inext = T 124 (284 + i.val + 1) ∧
      (entry1533 i).Icur = T 124 (284 + i.val) ∧
      (entry1533 i).output = T 125 (284 + i.val) ∧
      (entry1533 i).charge = charge 124 (284 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1533 (i : Fin 32) :
    forwardStepOK (-768) (charge 124 (284 + i.val)) shift
      (S (284 + i.val + 1)) (S 125) (T 124 (284 + i.val + 1))
      (T 124 (284 + i.val)) (T 125 (284 + i.val))
      (OriginalRow227Roots.root_pos 125 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 124 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1533.entries OriginalRow227TriangleForward1533.checked
    ⟨i.val, by rw [size1533]; exact i.isLt⟩
  change (entry1533 i).check = true at h
  rcases fields1533 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1534 : OriginalRow227TriangleForward1534.entries.size = 32 := rfl

def entry1534 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1534.entries[i.val]'(by rw [size1534]; exact i.isLt)

theorem fields1534 (i : Fin 32) :
    (entry1534 i).IA = shift ∧ (entry1534 i).ID = S (316 + i.val + 1) ∧
      (entry1534 i).IC = S 125 ∧ (entry1534 i).Inext = T 124 (316 + i.val + 1) ∧
      (entry1534 i).Icur = T 124 (316 + i.val) ∧
      (entry1534 i).output = T 125 (316 + i.val) ∧
      (entry1534 i).charge = charge 124 (316 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1534 (i : Fin 32) :
    forwardStepOK (-768) (charge 124 (316 + i.val)) shift
      (S (316 + i.val + 1)) (S 125) (T 124 (316 + i.val + 1))
      (T 124 (316 + i.val)) (T 125 (316 + i.val))
      (OriginalRow227Roots.root_pos 125 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 124 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1534.entries OriginalRow227TriangleForward1534.checked
    ⟨i.val, by rw [size1534]; exact i.isLt⟩
  change (entry1534 i).check = true at h
  rcases fields1534 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1535 : OriginalRow227TriangleForward1535.entries.size = 29 := rfl

def entry1535 (i : Fin 29) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1535.entries[i.val]'(by rw [size1535]; exact i.isLt)

theorem fields1535 (i : Fin 29) :
    (entry1535 i).IA = shift ∧ (entry1535 i).ID = S (348 + i.val + 1) ∧
      (entry1535 i).IC = S 125 ∧ (entry1535 i).Inext = T 124 (348 + i.val + 1) ∧
      (entry1535 i).Icur = T 124 (348 + i.val) ∧
      (entry1535 i).output = T 125 (348 + i.val) ∧
      (entry1535 i).charge = charge 124 (348 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root125).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨28, by decide⟩).symm, rfl⟩

theorem step1535 (i : Fin 29) :
    forwardStepOK (-768) (charge 124 (348 + i.val)) shift
      (S (348 + i.val + 1)) (S 125) (T 124 (348 + i.val + 1))
      (T 124 (348 + i.val)) (T 125 (348 + i.val))
      (OriginalRow227Roots.root_pos 125 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 124 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1535.entries OriginalRow227TriangleForward1535.checked
    ⟨i.val, by rw [size1535]; exact i.isLt⟩
  change (entry1535 i).check = true at h
  rcases fields1535 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 124 ≤ d) (hhi : d < 377) :
    forwardStepOK (-768) (charge 124 d) shift (S (d + 1)) (S 125)
      (T 124 (d + 1)) (T 124 d) (T 125 d)
      (OriginalRow227Roots.root_pos 125 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 124 (by decide)) = true := by
  by_cases h252 : d < 252
  ·
    by_cases h188 : d < 188
    ·
      by_cases h156 : d < 156
      ·
        have hi : d - 124 < 32 := by omega
        have heq : 124 + (d - 124) = d := by omega
        simpa only [heq] using step1528 ⟨d - 124, hi⟩
      ·
        have hi : d - 156 < 32 := by omega
        have heq : 156 + (d - 156) = d := by omega
        simpa only [heq] using step1529 ⟨d - 156, hi⟩
    ·
      by_cases h220 : d < 220
      ·
        have hi : d - 188 < 32 := by omega
        have heq : 188 + (d - 188) = d := by omega
        simpa only [heq] using step1530 ⟨d - 188, hi⟩
      ·
        have hi : d - 220 < 32 := by omega
        have heq : 220 + (d - 220) = d := by omega
        simpa only [heq] using step1531 ⟨d - 220, hi⟩
  ·
    by_cases h316 : d < 316
    ·
      by_cases h284 : d < 284
      ·
        have hi : d - 252 < 32 := by omega
        have heq : 252 + (d - 252) = d := by omega
        simpa only [heq] using step1532 ⟨d - 252, hi⟩
      ·
        have hi : d - 284 < 32 := by omega
        have heq : 284 + (d - 284) = d := by omega
        simpa only [heq] using step1533 ⟨d - 284, hi⟩
    ·
      by_cases h348 : d < 348
      ·
        have hi : d - 316 < 32 := by omega
        have heq : 316 + (d - 316) = d := by omega
        simpa only [heq] using step1534 ⟨d - 316, hi⟩
      ·
        have hi : d - 348 < 29 := by omega
        have heq : 348 + (d - 348) = d := by omega
        simpa only [heq] using step1535 ⟨d - 348, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow125.fields1528,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow125.step1528,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow125.fields1529,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow125.step1529,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow125.fields1530,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow125.step1530,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow125.fields1531,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow125.step1531,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow125.fields1532,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow125.step1532,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow125.fields1533,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow125.step1533,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow125.fields1534,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow125.step1534,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow125.fields1535,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow125.step1535,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow125.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow125
