import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow127
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128
import Grothe.UpperChaos.OriginalRow227TriangleForward1552
import Grothe.UpperChaos.OriginalRow227TriangleForward1553
import Grothe.UpperChaos.OriginalRow227TriangleForward1554
import Grothe.UpperChaos.OriginalRow227TriangleForward1555
import Grothe.UpperChaos.OriginalRow227TriangleForward1556
import Grothe.UpperChaos.OriginalRow227TriangleForward1557
import Grothe.UpperChaos.OriginalRow227TriangleForward1558
import Grothe.UpperChaos.OriginalRow227TriangleForward1559

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow128

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1552 : OriginalRow227TriangleForward1552.entries.size = 32 := rfl

def entry1552 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1552.entries[i.val]'(by rw [size1552]; exact i.isLt)

theorem fields1552 (i : Fin 32) :
    (entry1552 i).IA = shift ∧ (entry1552 i).ID = S (127 + i.val + 1) ∧
      (entry1552 i).IC = S 128 ∧ (entry1552 i).Inext = T 127 (127 + i.val + 1) ∧
      (entry1552 i).Icur = T 127 (127 + i.val) ∧
      (entry1552 i).output = T 128 (127 + i.val) ∧
      (entry1552 i).charge = charge 127 (127 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1560_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1552 (i : Fin 32) :
    forwardStepOK (-768) (charge 127 (127 + i.val)) shift
      (S (127 + i.val + 1)) (S 128) (T 127 (127 + i.val + 1))
      (T 127 (127 + i.val)) (T 128 (127 + i.val))
      (OriginalRow227Roots.root_pos 128 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 127 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1552.entries OriginalRow227TriangleForward1552.checked
    ⟨i.val, by rw [size1552]; exact i.isLt⟩
  change (entry1552 i).check = true at h
  rcases fields1552 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1553 : OriginalRow227TriangleForward1553.entries.size = 32 := rfl

def entry1553 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1553.entries[i.val]'(by rw [size1553]; exact i.isLt)

theorem fields1553 (i : Fin 32) :
    (entry1553 i).IA = shift ∧ (entry1553 i).ID = S (159 + i.val + 1) ∧
      (entry1553 i).IC = S 128 ∧ (entry1553 i).Inext = T 127 (159 + i.val + 1) ∧
      (entry1553 i).Icur = T 127 (159 + i.val) ∧
      (entry1553 i).output = T 128 (159 + i.val) ∧
      (entry1553 i).charge = charge 127 (159 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1561_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1553 (i : Fin 32) :
    forwardStepOK (-768) (charge 127 (159 + i.val)) shift
      (S (159 + i.val + 1)) (S 128) (T 127 (159 + i.val + 1))
      (T 127 (159 + i.val)) (T 128 (159 + i.val))
      (OriginalRow227Roots.root_pos 128 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 127 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1553.entries OriginalRow227TriangleForward1553.checked
    ⟨i.val, by rw [size1553]; exact i.isLt⟩
  change (entry1553 i).check = true at h
  rcases fields1553 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1554 : OriginalRow227TriangleForward1554.entries.size = 32 := rfl

def entry1554 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1554.entries[i.val]'(by rw [size1554]; exact i.isLt)

theorem fields1554 (i : Fin 32) :
    (entry1554 i).IA = shift ∧ (entry1554 i).ID = S (191 + i.val + 1) ∧
      (entry1554 i).IC = S 128 ∧ (entry1554 i).Inext = T 127 (191 + i.val + 1) ∧
      (entry1554 i).Icur = T 127 (191 + i.val) ∧
      (entry1554 i).output = T 128 (191 + i.val) ∧
      (entry1554 i).charge = charge 127 (191 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1562_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1554 (i : Fin 32) :
    forwardStepOK (-768) (charge 127 (191 + i.val)) shift
      (S (191 + i.val + 1)) (S 128) (T 127 (191 + i.val + 1))
      (T 127 (191 + i.val)) (T 128 (191 + i.val))
      (OriginalRow227Roots.root_pos 128 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 127 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1554.entries OriginalRow227TriangleForward1554.checked
    ⟨i.val, by rw [size1554]; exact i.isLt⟩
  change (entry1554 i).check = true at h
  rcases fields1554 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1555 : OriginalRow227TriangleForward1555.entries.size = 32 := rfl

def entry1555 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1555.entries[i.val]'(by rw [size1555]; exact i.isLt)

theorem fields1555 (i : Fin 32) :
    (entry1555 i).IA = shift ∧ (entry1555 i).ID = S (223 + i.val + 1) ∧
      (entry1555 i).IC = S 128 ∧ (entry1555 i).Inext = T 127 (223 + i.val + 1) ∧
      (entry1555 i).Icur = T 127 (223 + i.val) ∧
      (entry1555 i).output = T 128 (223 + i.val) ∧
      (entry1555 i).charge = charge 127 (223 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1563_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1555 (i : Fin 32) :
    forwardStepOK (-768) (charge 127 (223 + i.val)) shift
      (S (223 + i.val + 1)) (S 128) (T 127 (223 + i.val + 1))
      (T 127 (223 + i.val)) (T 128 (223 + i.val))
      (OriginalRow227Roots.root_pos 128 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 127 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1555.entries OriginalRow227TriangleForward1555.checked
    ⟨i.val, by rw [size1555]; exact i.isLt⟩
  change (entry1555 i).check = true at h
  rcases fields1555 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1556 : OriginalRow227TriangleForward1556.entries.size = 32 := rfl

def entry1556 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1556.entries[i.val]'(by rw [size1556]; exact i.isLt)

theorem fields1556 (i : Fin 32) :
    (entry1556 i).IA = shift ∧ (entry1556 i).ID = S (255 + i.val + 1) ∧
      (entry1556 i).IC = S 128 ∧ (entry1556 i).Inext = T 127 (255 + i.val + 1) ∧
      (entry1556 i).Icur = T 127 (255 + i.val) ∧
      (entry1556 i).output = T 128 (255 + i.val) ∧
      (entry1556 i).charge = charge 127 (255 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1564_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1556 (i : Fin 32) :
    forwardStepOK (-768) (charge 127 (255 + i.val)) shift
      (S (255 + i.val + 1)) (S 128) (T 127 (255 + i.val + 1))
      (T 127 (255 + i.val)) (T 128 (255 + i.val))
      (OriginalRow227Roots.root_pos 128 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 127 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1556.entries OriginalRow227TriangleForward1556.checked
    ⟨i.val, by rw [size1556]; exact i.isLt⟩
  change (entry1556 i).check = true at h
  rcases fields1556 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1557 : OriginalRow227TriangleForward1557.entries.size = 32 := rfl

def entry1557 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1557.entries[i.val]'(by rw [size1557]; exact i.isLt)

theorem fields1557 (i : Fin 32) :
    (entry1557 i).IA = shift ∧ (entry1557 i).ID = S (287 + i.val + 1) ∧
      (entry1557 i).IC = S 128 ∧ (entry1557 i).Inext = T 127 (287 + i.val + 1) ∧
      (entry1557 i).Icur = T 127 (287 + i.val) ∧
      (entry1557 i).output = T 128 (287 + i.val) ∧
      (entry1557 i).charge = charge 127 (287 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1565_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1557 (i : Fin 32) :
    forwardStepOK (-768) (charge 127 (287 + i.val)) shift
      (S (287 + i.val + 1)) (S 128) (T 127 (287 + i.val + 1))
      (T 127 (287 + i.val)) (T 128 (287 + i.val))
      (OriginalRow227Roots.root_pos 128 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 127 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1557.entries OriginalRow227TriangleForward1557.checked
    ⟨i.val, by rw [size1557]; exact i.isLt⟩
  change (entry1557 i).check = true at h
  rcases fields1557 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1558 : OriginalRow227TriangleForward1558.entries.size = 32 := rfl

def entry1558 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1558.entries[i.val]'(by rw [size1558]; exact i.isLt)

theorem fields1558 (i : Fin 32) :
    (entry1558 i).IA = shift ∧ (entry1558 i).ID = S (319 + i.val + 1) ∧
      (entry1558 i).IC = S 128 ∧ (entry1558 i).Inext = T 127 (319 + i.val + 1) ∧
      (entry1558 i).Icur = T 127 (319 + i.val) ∧
      (entry1558 i).output = T 128 (319 + i.val) ∧
      (entry1558 i).charge = charge 127 (319 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1566_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1558 (i : Fin 32) :
    forwardStepOK (-768) (charge 127 (319 + i.val)) shift
      (S (319 + i.val + 1)) (S 128) (T 127 (319 + i.val + 1))
      (T 127 (319 + i.val)) (T 128 (319 + i.val))
      (OriginalRow227Roots.root_pos 128 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 127 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1558.entries OriginalRow227TriangleForward1558.checked
    ⟨i.val, by rw [size1558]; exact i.isLt⟩
  change (entry1558 i).check = true at h
  rcases fields1558 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1559 : OriginalRow227TriangleForward1559.entries.size = 23 := rfl

def entry1559 (i : Fin 23) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1559.entries[i.val]'(by rw [size1559]; exact i.isLt)

theorem fields1559 (i : Fin 23) :
    (entry1559 i).IA = shift ∧ (entry1559 i).ID = S (351 + i.val + 1) ∧
      (entry1559 i).IC = S 128 ∧ (entry1559 i).Inext = T 127 (351 + i.val + 1) ∧
      (entry1559 i).Icur = T 127 (351 + i.val) ∧
      (entry1559 i).output = T 128 (351 + i.val) ∧
      (entry1559 i).charge = charge 127 (351 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root128).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow127.block1567_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨22, by decide⟩).symm, rfl⟩

theorem step1559 (i : Fin 23) :
    forwardStepOK (-768) (charge 127 (351 + i.val)) shift
      (S (351 + i.val + 1)) (S 128) (T 127 (351 + i.val + 1))
      (T 127 (351 + i.val)) (T 128 (351 + i.val))
      (OriginalRow227Roots.root_pos 128 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 127 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1559.entries OriginalRow227TriangleForward1559.checked
    ⟨i.val, by rw [size1559]; exact i.isLt⟩
  change (entry1559 i).check = true at h
  rcases fields1559 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 127 ≤ d) (hhi : d < 374) :
    forwardStepOK (-768) (charge 127 d) shift (S (d + 1)) (S 128)
      (T 127 (d + 1)) (T 127 d) (T 128 d)
      (OriginalRow227Roots.root_pos 128 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 127 (by decide)) = true := by
  by_cases h255 : d < 255
  ·
    by_cases h191 : d < 191
    ·
      by_cases h159 : d < 159
      ·
        have hi : d - 127 < 32 := by omega
        have heq : 127 + (d - 127) = d := by omega
        simpa only [heq] using step1552 ⟨d - 127, hi⟩
      ·
        have hi : d - 159 < 32 := by omega
        have heq : 159 + (d - 159) = d := by omega
        simpa only [heq] using step1553 ⟨d - 159, hi⟩
    ·
      by_cases h223 : d < 223
      ·
        have hi : d - 191 < 32 := by omega
        have heq : 191 + (d - 191) = d := by omega
        simpa only [heq] using step1554 ⟨d - 191, hi⟩
      ·
        have hi : d - 223 < 32 := by omega
        have heq : 223 + (d - 223) = d := by omega
        simpa only [heq] using step1555 ⟨d - 223, hi⟩
  ·
    by_cases h319 : d < 319
    ·
      by_cases h287 : d < 287
      ·
        have hi : d - 255 < 32 := by omega
        have heq : 255 + (d - 255) = d := by omega
        simpa only [heq] using step1556 ⟨d - 255, hi⟩
      ·
        have hi : d - 287 < 32 := by omega
        have heq : 287 + (d - 287) = d := by omega
        simpa only [heq] using step1557 ⟨d - 287, hi⟩
    ·
      by_cases h351 : d < 351
      ·
        have hi : d - 319 < 32 := by omega
        have heq : 319 + (d - 319) = d := by omega
        simpa only [heq] using step1558 ⟨d - 319, hi⟩
      ·
        have hi : d - 351 < 23 := by omega
        have heq : 351 + (d - 351) = d := by omega
        simpa only [heq] using step1559 ⟨d - 351, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow128.fields1552,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow128.step1552,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow128.fields1553,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow128.step1553,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow128.fields1554,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow128.step1554,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow128.fields1555,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow128.step1555,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow128.fields1556,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow128.step1556,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow128.fields1557,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow128.step1557,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow128.fields1558,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow128.step1558,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow128.fields1559,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow128.step1559,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow128.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow128
