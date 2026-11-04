import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow126
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127
import Grothe.UpperChaos.OriginalRow227TriangleForward1544
import Grothe.UpperChaos.OriginalRow227TriangleForward1545
import Grothe.UpperChaos.OriginalRow227TriangleForward1546
import Grothe.UpperChaos.OriginalRow227TriangleForward1547
import Grothe.UpperChaos.OriginalRow227TriangleForward1548
import Grothe.UpperChaos.OriginalRow227TriangleForward1549
import Grothe.UpperChaos.OriginalRow227TriangleForward1550
import Grothe.UpperChaos.OriginalRow227TriangleForward1551

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow127

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1544 : OriginalRow227TriangleForward1544.entries.size = 32 := rfl

def entry1544 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1544.entries[i.val]'(by rw [size1544]; exact i.isLt)

theorem fields1544 (i : Fin 32) :
    (entry1544 i).IA = shift ∧ (entry1544 i).ID = S (126 + i.val + 1) ∧
      (entry1544 i).IC = S 127 ∧ (entry1544 i).Inext = T 126 (126 + i.val + 1) ∧
      (entry1544 i).Icur = T 126 (126 + i.val) ∧
      (entry1544 i).output = T 127 (126 + i.val) ∧
      (entry1544 i).charge = charge 126 (126 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1552_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1544 (i : Fin 32) :
    forwardStepOK (-768) (charge 126 (126 + i.val)) shift
      (S (126 + i.val + 1)) (S 127) (T 126 (126 + i.val + 1))
      (T 126 (126 + i.val)) (T 127 (126 + i.val))
      (OriginalRow227Roots.root_pos 127 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 126 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1544.entries OriginalRow227TriangleForward1544.checked
    ⟨i.val, by rw [size1544]; exact i.isLt⟩
  change (entry1544 i).check = true at h
  rcases fields1544 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1545 : OriginalRow227TriangleForward1545.entries.size = 32 := rfl

def entry1545 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1545.entries[i.val]'(by rw [size1545]; exact i.isLt)

theorem fields1545 (i : Fin 32) :
    (entry1545 i).IA = shift ∧ (entry1545 i).ID = S (158 + i.val + 1) ∧
      (entry1545 i).IC = S 127 ∧ (entry1545 i).Inext = T 126 (158 + i.val + 1) ∧
      (entry1545 i).Icur = T 126 (158 + i.val) ∧
      (entry1545 i).output = T 127 (158 + i.val) ∧
      (entry1545 i).charge = charge 126 (158 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1553_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1545 (i : Fin 32) :
    forwardStepOK (-768) (charge 126 (158 + i.val)) shift
      (S (158 + i.val + 1)) (S 127) (T 126 (158 + i.val + 1))
      (T 126 (158 + i.val)) (T 127 (158 + i.val))
      (OriginalRow227Roots.root_pos 127 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 126 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1545.entries OriginalRow227TriangleForward1545.checked
    ⟨i.val, by rw [size1545]; exact i.isLt⟩
  change (entry1545 i).check = true at h
  rcases fields1545 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1546 : OriginalRow227TriangleForward1546.entries.size = 32 := rfl

def entry1546 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1546.entries[i.val]'(by rw [size1546]; exact i.isLt)

theorem fields1546 (i : Fin 32) :
    (entry1546 i).IA = shift ∧ (entry1546 i).ID = S (190 + i.val + 1) ∧
      (entry1546 i).IC = S 127 ∧ (entry1546 i).Inext = T 126 (190 + i.val + 1) ∧
      (entry1546 i).Icur = T 126 (190 + i.val) ∧
      (entry1546 i).output = T 127 (190 + i.val) ∧
      (entry1546 i).charge = charge 126 (190 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1554_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1546 (i : Fin 32) :
    forwardStepOK (-768) (charge 126 (190 + i.val)) shift
      (S (190 + i.val + 1)) (S 127) (T 126 (190 + i.val + 1))
      (T 126 (190 + i.val)) (T 127 (190 + i.val))
      (OriginalRow227Roots.root_pos 127 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 126 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1546.entries OriginalRow227TriangleForward1546.checked
    ⟨i.val, by rw [size1546]; exact i.isLt⟩
  change (entry1546 i).check = true at h
  rcases fields1546 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1547 : OriginalRow227TriangleForward1547.entries.size = 32 := rfl

def entry1547 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1547.entries[i.val]'(by rw [size1547]; exact i.isLt)

theorem fields1547 (i : Fin 32) :
    (entry1547 i).IA = shift ∧ (entry1547 i).ID = S (222 + i.val + 1) ∧
      (entry1547 i).IC = S 127 ∧ (entry1547 i).Inext = T 126 (222 + i.val + 1) ∧
      (entry1547 i).Icur = T 126 (222 + i.val) ∧
      (entry1547 i).output = T 127 (222 + i.val) ∧
      (entry1547 i).charge = charge 126 (222 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1555_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1547 (i : Fin 32) :
    forwardStepOK (-768) (charge 126 (222 + i.val)) shift
      (S (222 + i.val + 1)) (S 127) (T 126 (222 + i.val + 1))
      (T 126 (222 + i.val)) (T 127 (222 + i.val))
      (OriginalRow227Roots.root_pos 127 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 126 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1547.entries OriginalRow227TriangleForward1547.checked
    ⟨i.val, by rw [size1547]; exact i.isLt⟩
  change (entry1547 i).check = true at h
  rcases fields1547 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1548 : OriginalRow227TriangleForward1548.entries.size = 32 := rfl

def entry1548 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1548.entries[i.val]'(by rw [size1548]; exact i.isLt)

theorem fields1548 (i : Fin 32) :
    (entry1548 i).IA = shift ∧ (entry1548 i).ID = S (254 + i.val + 1) ∧
      (entry1548 i).IC = S 127 ∧ (entry1548 i).Inext = T 126 (254 + i.val + 1) ∧
      (entry1548 i).Icur = T 126 (254 + i.val) ∧
      (entry1548 i).output = T 127 (254 + i.val) ∧
      (entry1548 i).charge = charge 126 (254 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1556_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1548 (i : Fin 32) :
    forwardStepOK (-768) (charge 126 (254 + i.val)) shift
      (S (254 + i.val + 1)) (S 127) (T 126 (254 + i.val + 1))
      (T 126 (254 + i.val)) (T 127 (254 + i.val))
      (OriginalRow227Roots.root_pos 127 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 126 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1548.entries OriginalRow227TriangleForward1548.checked
    ⟨i.val, by rw [size1548]; exact i.isLt⟩
  change (entry1548 i).check = true at h
  rcases fields1548 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1549 : OriginalRow227TriangleForward1549.entries.size = 32 := rfl

def entry1549 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1549.entries[i.val]'(by rw [size1549]; exact i.isLt)

theorem fields1549 (i : Fin 32) :
    (entry1549 i).IA = shift ∧ (entry1549 i).ID = S (286 + i.val + 1) ∧
      (entry1549 i).IC = S 127 ∧ (entry1549 i).Inext = T 126 (286 + i.val + 1) ∧
      (entry1549 i).Icur = T 126 (286 + i.val) ∧
      (entry1549 i).output = T 127 (286 + i.val) ∧
      (entry1549 i).charge = charge 126 (286 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1557_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1549 (i : Fin 32) :
    forwardStepOK (-768) (charge 126 (286 + i.val)) shift
      (S (286 + i.val + 1)) (S 127) (T 126 (286 + i.val + 1))
      (T 126 (286 + i.val)) (T 127 (286 + i.val))
      (OriginalRow227Roots.root_pos 127 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 126 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1549.entries OriginalRow227TriangleForward1549.checked
    ⟨i.val, by rw [size1549]; exact i.isLt⟩
  change (entry1549 i).check = true at h
  rcases fields1549 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1550 : OriginalRow227TriangleForward1550.entries.size = 32 := rfl

def entry1550 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1550.entries[i.val]'(by rw [size1550]; exact i.isLt)

theorem fields1550 (i : Fin 32) :
    (entry1550 i).IA = shift ∧ (entry1550 i).ID = S (318 + i.val + 1) ∧
      (entry1550 i).IC = S 127 ∧ (entry1550 i).Inext = T 126 (318 + i.val + 1) ∧
      (entry1550 i).Icur = T 126 (318 + i.val) ∧
      (entry1550 i).output = T 127 (318 + i.val) ∧
      (entry1550 i).charge = charge 126 (318 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1558_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1550 (i : Fin 32) :
    forwardStepOK (-768) (charge 126 (318 + i.val)) shift
      (S (318 + i.val + 1)) (S 127) (T 126 (318 + i.val + 1))
      (T 126 (318 + i.val)) (T 127 (318 + i.val))
      (OriginalRow227Roots.root_pos 127 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 126 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1550.entries OriginalRow227TriangleForward1550.checked
    ⟨i.val, by rw [size1550]; exact i.isLt⟩
  change (entry1550 i).check = true at h
  rcases fields1550 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1551 : OriginalRow227TriangleForward1551.entries.size = 25 := rfl

def entry1551 (i : Fin 25) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1551.entries[i.val]'(by rw [size1551]; exact i.isLt)

theorem fields1551 (i : Fin 25) :
    (entry1551 i).IA = shift ∧ (entry1551 i).ID = S (350 + i.val + 1) ∧
      (entry1551 i).IC = S 127 ∧ (entry1551 i).Inext = T 126 (350 + i.val + 1) ∧
      (entry1551 i).Icur = T 126 (350 + i.val) ∧
      (entry1551 i).output = T 127 (350 + i.val) ∧
      (entry1551 i).charge = charge 126 (350 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root127).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow126.block1559_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨24, by decide⟩).symm, rfl⟩

theorem step1551 (i : Fin 25) :
    forwardStepOK (-768) (charge 126 (350 + i.val)) shift
      (S (350 + i.val + 1)) (S 127) (T 126 (350 + i.val + 1))
      (T 126 (350 + i.val)) (T 127 (350 + i.val))
      (OriginalRow227Roots.root_pos 127 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 126 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1551.entries OriginalRow227TriangleForward1551.checked
    ⟨i.val, by rw [size1551]; exact i.isLt⟩
  change (entry1551 i).check = true at h
  rcases fields1551 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 126 ≤ d) (hhi : d < 375) :
    forwardStepOK (-768) (charge 126 d) shift (S (d + 1)) (S 127)
      (T 126 (d + 1)) (T 126 d) (T 127 d)
      (OriginalRow227Roots.root_pos 127 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 126 (by decide)) = true := by
  by_cases h254 : d < 254
  ·
    by_cases h190 : d < 190
    ·
      by_cases h158 : d < 158
      ·
        have hi : d - 126 < 32 := by omega
        have heq : 126 + (d - 126) = d := by omega
        simpa only [heq] using step1544 ⟨d - 126, hi⟩
      ·
        have hi : d - 158 < 32 := by omega
        have heq : 158 + (d - 158) = d := by omega
        simpa only [heq] using step1545 ⟨d - 158, hi⟩
    ·
      by_cases h222 : d < 222
      ·
        have hi : d - 190 < 32 := by omega
        have heq : 190 + (d - 190) = d := by omega
        simpa only [heq] using step1546 ⟨d - 190, hi⟩
      ·
        have hi : d - 222 < 32 := by omega
        have heq : 222 + (d - 222) = d := by omega
        simpa only [heq] using step1547 ⟨d - 222, hi⟩
  ·
    by_cases h318 : d < 318
    ·
      by_cases h286 : d < 286
      ·
        have hi : d - 254 < 32 := by omega
        have heq : 254 + (d - 254) = d := by omega
        simpa only [heq] using step1548 ⟨d - 254, hi⟩
      ·
        have hi : d - 286 < 32 := by omega
        have heq : 286 + (d - 286) = d := by omega
        simpa only [heq] using step1549 ⟨d - 286, hi⟩
    ·
      by_cases h350 : d < 350
      ·
        have hi : d - 318 < 32 := by omega
        have heq : 318 + (d - 318) = d := by omega
        simpa only [heq] using step1550 ⟨d - 318, hi⟩
      ·
        have hi : d - 350 < 25 := by omega
        have heq : 350 + (d - 350) = d := by omega
        simpa only [heq] using step1551 ⟨d - 350, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow127.fields1544,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow127.step1544,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow127.fields1545,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow127.step1545,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow127.fields1546,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow127.step1546,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow127.fields1547,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow127.step1547,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow127.fields1548,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow127.step1548,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow127.fields1549,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow127.step1549,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow127.fields1550,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow127.step1550,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow127.fields1551,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow127.step1551,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow127.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow127
