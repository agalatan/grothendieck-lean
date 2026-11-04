import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow125
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126
import Grothe.UpperChaos.OriginalRow227TriangleForward1536
import Grothe.UpperChaos.OriginalRow227TriangleForward1537
import Grothe.UpperChaos.OriginalRow227TriangleForward1538
import Grothe.UpperChaos.OriginalRow227TriangleForward1539
import Grothe.UpperChaos.OriginalRow227TriangleForward1540
import Grothe.UpperChaos.OriginalRow227TriangleForward1541
import Grothe.UpperChaos.OriginalRow227TriangleForward1542
import Grothe.UpperChaos.OriginalRow227TriangleForward1543

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow126

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1536 : OriginalRow227TriangleForward1536.entries.size = 32 := rfl

def entry1536 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1536.entries[i.val]'(by rw [size1536]; exact i.isLt)

theorem fields1536 (i : Fin 32) :
    (entry1536 i).IA = shift ∧ (entry1536 i).ID = S (125 + i.val + 1) ∧
      (entry1536 i).IC = S 126 ∧ (entry1536 i).Inext = T 125 (125 + i.val + 1) ∧
      (entry1536 i).Icur = T 125 (125 + i.val) ∧
      (entry1536 i).output = T 126 (125 + i.val) ∧
      (entry1536 i).charge = charge 125 (125 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1544_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1536 (i : Fin 32) :
    forwardStepOK (-768) (charge 125 (125 + i.val)) shift
      (S (125 + i.val + 1)) (S 126) (T 125 (125 + i.val + 1))
      (T 125 (125 + i.val)) (T 126 (125 + i.val))
      (OriginalRow227Roots.root_pos 126 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 125 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1536.entries OriginalRow227TriangleForward1536.checked
    ⟨i.val, by rw [size1536]; exact i.isLt⟩
  change (entry1536 i).check = true at h
  rcases fields1536 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1537 : OriginalRow227TriangleForward1537.entries.size = 32 := rfl

def entry1537 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1537.entries[i.val]'(by rw [size1537]; exact i.isLt)

theorem fields1537 (i : Fin 32) :
    (entry1537 i).IA = shift ∧ (entry1537 i).ID = S (157 + i.val + 1) ∧
      (entry1537 i).IC = S 126 ∧ (entry1537 i).Inext = T 125 (157 + i.val + 1) ∧
      (entry1537 i).Icur = T 125 (157 + i.val) ∧
      (entry1537 i).output = T 126 (157 + i.val) ∧
      (entry1537 i).charge = charge 125 (157 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1545_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1537 (i : Fin 32) :
    forwardStepOK (-768) (charge 125 (157 + i.val)) shift
      (S (157 + i.val + 1)) (S 126) (T 125 (157 + i.val + 1))
      (T 125 (157 + i.val)) (T 126 (157 + i.val))
      (OriginalRow227Roots.root_pos 126 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 125 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1537.entries OriginalRow227TriangleForward1537.checked
    ⟨i.val, by rw [size1537]; exact i.isLt⟩
  change (entry1537 i).check = true at h
  rcases fields1537 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1538 : OriginalRow227TriangleForward1538.entries.size = 32 := rfl

def entry1538 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1538.entries[i.val]'(by rw [size1538]; exact i.isLt)

theorem fields1538 (i : Fin 32) :
    (entry1538 i).IA = shift ∧ (entry1538 i).ID = S (189 + i.val + 1) ∧
      (entry1538 i).IC = S 126 ∧ (entry1538 i).Inext = T 125 (189 + i.val + 1) ∧
      (entry1538 i).Icur = T 125 (189 + i.val) ∧
      (entry1538 i).output = T 126 (189 + i.val) ∧
      (entry1538 i).charge = charge 125 (189 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1546_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1538 (i : Fin 32) :
    forwardStepOK (-768) (charge 125 (189 + i.val)) shift
      (S (189 + i.val + 1)) (S 126) (T 125 (189 + i.val + 1))
      (T 125 (189 + i.val)) (T 126 (189 + i.val))
      (OriginalRow227Roots.root_pos 126 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 125 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1538.entries OriginalRow227TriangleForward1538.checked
    ⟨i.val, by rw [size1538]; exact i.isLt⟩
  change (entry1538 i).check = true at h
  rcases fields1538 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1539 : OriginalRow227TriangleForward1539.entries.size = 32 := rfl

def entry1539 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1539.entries[i.val]'(by rw [size1539]; exact i.isLt)

theorem fields1539 (i : Fin 32) :
    (entry1539 i).IA = shift ∧ (entry1539 i).ID = S (221 + i.val + 1) ∧
      (entry1539 i).IC = S 126 ∧ (entry1539 i).Inext = T 125 (221 + i.val + 1) ∧
      (entry1539 i).Icur = T 125 (221 + i.val) ∧
      (entry1539 i).output = T 126 (221 + i.val) ∧
      (entry1539 i).charge = charge 125 (221 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1547_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1539 (i : Fin 32) :
    forwardStepOK (-768) (charge 125 (221 + i.val)) shift
      (S (221 + i.val + 1)) (S 126) (T 125 (221 + i.val + 1))
      (T 125 (221 + i.val)) (T 126 (221 + i.val))
      (OriginalRow227Roots.root_pos 126 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 125 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1539.entries OriginalRow227TriangleForward1539.checked
    ⟨i.val, by rw [size1539]; exact i.isLt⟩
  change (entry1539 i).check = true at h
  rcases fields1539 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1540 : OriginalRow227TriangleForward1540.entries.size = 32 := rfl

def entry1540 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1540.entries[i.val]'(by rw [size1540]; exact i.isLt)

theorem fields1540 (i : Fin 32) :
    (entry1540 i).IA = shift ∧ (entry1540 i).ID = S (253 + i.val + 1) ∧
      (entry1540 i).IC = S 126 ∧ (entry1540 i).Inext = T 125 (253 + i.val + 1) ∧
      (entry1540 i).Icur = T 125 (253 + i.val) ∧
      (entry1540 i).output = T 126 (253 + i.val) ∧
      (entry1540 i).charge = charge 125 (253 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1548_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1540 (i : Fin 32) :
    forwardStepOK (-768) (charge 125 (253 + i.val)) shift
      (S (253 + i.val + 1)) (S 126) (T 125 (253 + i.val + 1))
      (T 125 (253 + i.val)) (T 126 (253 + i.val))
      (OriginalRow227Roots.root_pos 126 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 125 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1540.entries OriginalRow227TriangleForward1540.checked
    ⟨i.val, by rw [size1540]; exact i.isLt⟩
  change (entry1540 i).check = true at h
  rcases fields1540 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1541 : OriginalRow227TriangleForward1541.entries.size = 32 := rfl

def entry1541 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1541.entries[i.val]'(by rw [size1541]; exact i.isLt)

theorem fields1541 (i : Fin 32) :
    (entry1541 i).IA = shift ∧ (entry1541 i).ID = S (285 + i.val + 1) ∧
      (entry1541 i).IC = S 126 ∧ (entry1541 i).Inext = T 125 (285 + i.val + 1) ∧
      (entry1541 i).Icur = T 125 (285 + i.val) ∧
      (entry1541 i).output = T 126 (285 + i.val) ∧
      (entry1541 i).charge = charge 125 (285 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1549_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1541 (i : Fin 32) :
    forwardStepOK (-768) (charge 125 (285 + i.val)) shift
      (S (285 + i.val + 1)) (S 126) (T 125 (285 + i.val + 1))
      (T 125 (285 + i.val)) (T 126 (285 + i.val))
      (OriginalRow227Roots.root_pos 126 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 125 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1541.entries OriginalRow227TriangleForward1541.checked
    ⟨i.val, by rw [size1541]; exact i.isLt⟩
  change (entry1541 i).check = true at h
  rcases fields1541 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1542 : OriginalRow227TriangleForward1542.entries.size = 32 := rfl

def entry1542 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1542.entries[i.val]'(by rw [size1542]; exact i.isLt)

theorem fields1542 (i : Fin 32) :
    (entry1542 i).IA = shift ∧ (entry1542 i).ID = S (317 + i.val + 1) ∧
      (entry1542 i).IC = S 126 ∧ (entry1542 i).Inext = T 125 (317 + i.val + 1) ∧
      (entry1542 i).Icur = T 125 (317 + i.val) ∧
      (entry1542 i).output = T 126 (317 + i.val) ∧
      (entry1542 i).charge = charge 125 (317 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1550_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1542 (i : Fin 32) :
    forwardStepOK (-768) (charge 125 (317 + i.val)) shift
      (S (317 + i.val + 1)) (S 126) (T 125 (317 + i.val + 1))
      (T 125 (317 + i.val)) (T 126 (317 + i.val))
      (OriginalRow227Roots.root_pos 126 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 125 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1542.entries OriginalRow227TriangleForward1542.checked
    ⟨i.val, by rw [size1542]; exact i.isLt⟩
  change (entry1542 i).check = true at h
  rcases fields1542 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1543 : OriginalRow227TriangleForward1543.entries.size = 27 := rfl

def entry1543 (i : Fin 27) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1543.entries[i.val]'(by rw [size1543]; exact i.isLt)

theorem fields1543 (i : Fin 27) :
    (entry1543 i).IA = shift ∧ (entry1543 i).ID = S (349 + i.val + 1) ∧
      (entry1543 i).IC = S 126 ∧ (entry1543 i).Inext = T 125 (349 + i.val + 1) ∧
      (entry1543 i).Icur = T 125 (349 + i.val) ∧
      (entry1543 i).output = T 126 (349 + i.val) ∧
      (entry1543 i).charge = charge 125 (349 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root126).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow125.block1551_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨26, by decide⟩).symm, rfl⟩

theorem step1543 (i : Fin 27) :
    forwardStepOK (-768) (charge 125 (349 + i.val)) shift
      (S (349 + i.val + 1)) (S 126) (T 125 (349 + i.val + 1))
      (T 125 (349 + i.val)) (T 126 (349 + i.val))
      (OriginalRow227Roots.root_pos 126 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 125 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1543.entries OriginalRow227TriangleForward1543.checked
    ⟨i.val, by rw [size1543]; exact i.isLt⟩
  change (entry1543 i).check = true at h
  rcases fields1543 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 125 ≤ d) (hhi : d < 376) :
    forwardStepOK (-768) (charge 125 d) shift (S (d + 1)) (S 126)
      (T 125 (d + 1)) (T 125 d) (T 126 d)
      (OriginalRow227Roots.root_pos 126 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 125 (by decide)) = true := by
  by_cases h253 : d < 253
  ·
    by_cases h189 : d < 189
    ·
      by_cases h157 : d < 157
      ·
        have hi : d - 125 < 32 := by omega
        have heq : 125 + (d - 125) = d := by omega
        simpa only [heq] using step1536 ⟨d - 125, hi⟩
      ·
        have hi : d - 157 < 32 := by omega
        have heq : 157 + (d - 157) = d := by omega
        simpa only [heq] using step1537 ⟨d - 157, hi⟩
    ·
      by_cases h221 : d < 221
      ·
        have hi : d - 189 < 32 := by omega
        have heq : 189 + (d - 189) = d := by omega
        simpa only [heq] using step1538 ⟨d - 189, hi⟩
      ·
        have hi : d - 221 < 32 := by omega
        have heq : 221 + (d - 221) = d := by omega
        simpa only [heq] using step1539 ⟨d - 221, hi⟩
  ·
    by_cases h317 : d < 317
    ·
      by_cases h285 : d < 285
      ·
        have hi : d - 253 < 32 := by omega
        have heq : 253 + (d - 253) = d := by omega
        simpa only [heq] using step1540 ⟨d - 253, hi⟩
      ·
        have hi : d - 285 < 32 := by omega
        have heq : 285 + (d - 285) = d := by omega
        simpa only [heq] using step1541 ⟨d - 285, hi⟩
    ·
      by_cases h349 : d < 349
      ·
        have hi : d - 317 < 32 := by omega
        have heq : 317 + (d - 317) = d := by omega
        simpa only [heq] using step1542 ⟨d - 317, hi⟩
      ·
        have hi : d - 349 < 27 := by omega
        have heq : 349 + (d - 349) = d := by omega
        simpa only [heq] using step1543 ⟨d - 349, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow126.fields1536,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow126.step1536,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow126.fields1537,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow126.step1537,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow126.fields1538,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow126.step1538,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow126.fields1539,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow126.step1539,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow126.fields1540,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow126.step1540,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow126.fields1541,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow126.step1541,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow126.fields1542,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow126.step1542,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow126.fields1543,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow126.step1543,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow126.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow126
