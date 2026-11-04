import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow128
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129
import Grothe.UpperChaos.OriginalRow227TriangleForward1560
import Grothe.UpperChaos.OriginalRow227TriangleForward1561
import Grothe.UpperChaos.OriginalRow227TriangleForward1562
import Grothe.UpperChaos.OriginalRow227TriangleForward1563
import Grothe.UpperChaos.OriginalRow227TriangleForward1564
import Grothe.UpperChaos.OriginalRow227TriangleForward1565
import Grothe.UpperChaos.OriginalRow227TriangleForward1566
import Grothe.UpperChaos.OriginalRow227TriangleForward1567

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow129

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1560 : OriginalRow227TriangleForward1560.entries.size = 32 := rfl

def entry1560 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1560.entries[i.val]'(by rw [size1560]; exact i.isLt)

theorem fields1560 (i : Fin 32) :
    (entry1560 i).IA = shift ∧ (entry1560 i).ID = S (128 + i.val + 1) ∧
      (entry1560 i).IC = S 129 ∧ (entry1560 i).Inext = T 128 (128 + i.val + 1) ∧
      (entry1560 i).Icur = T 128 (128 + i.val) ∧
      (entry1560 i).output = T 129 (128 + i.val) ∧
      (entry1560 i).charge = charge 128 (128 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1568_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1560 (i : Fin 32) :
    forwardStepOK (-768) (charge 128 (128 + i.val)) shift
      (S (128 + i.val + 1)) (S 129) (T 128 (128 + i.val + 1))
      (T 128 (128 + i.val)) (T 129 (128 + i.val))
      (OriginalRow227Roots.root_pos 129 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 128 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1560.entries OriginalRow227TriangleForward1560.checked
    ⟨i.val, by rw [size1560]; exact i.isLt⟩
  change (entry1560 i).check = true at h
  rcases fields1560 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1561 : OriginalRow227TriangleForward1561.entries.size = 32 := rfl

def entry1561 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1561.entries[i.val]'(by rw [size1561]; exact i.isLt)

theorem fields1561 (i : Fin 32) :
    (entry1561 i).IA = shift ∧ (entry1561 i).ID = S (160 + i.val + 1) ∧
      (entry1561 i).IC = S 129 ∧ (entry1561 i).Inext = T 128 (160 + i.val + 1) ∧
      (entry1561 i).Icur = T 128 (160 + i.val) ∧
      (entry1561 i).output = T 129 (160 + i.val) ∧
      (entry1561 i).charge = charge 128 (160 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1569_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1561 (i : Fin 32) :
    forwardStepOK (-768) (charge 128 (160 + i.val)) shift
      (S (160 + i.val + 1)) (S 129) (T 128 (160 + i.val + 1))
      (T 128 (160 + i.val)) (T 129 (160 + i.val))
      (OriginalRow227Roots.root_pos 129 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 128 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1561.entries OriginalRow227TriangleForward1561.checked
    ⟨i.val, by rw [size1561]; exact i.isLt⟩
  change (entry1561 i).check = true at h
  rcases fields1561 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1562 : OriginalRow227TriangleForward1562.entries.size = 32 := rfl

def entry1562 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1562.entries[i.val]'(by rw [size1562]; exact i.isLt)

theorem fields1562 (i : Fin 32) :
    (entry1562 i).IA = shift ∧ (entry1562 i).ID = S (192 + i.val + 1) ∧
      (entry1562 i).IC = S 129 ∧ (entry1562 i).Inext = T 128 (192 + i.val + 1) ∧
      (entry1562 i).Icur = T 128 (192 + i.val) ∧
      (entry1562 i).output = T 129 (192 + i.val) ∧
      (entry1562 i).charge = charge 128 (192 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1570_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1562 (i : Fin 32) :
    forwardStepOK (-768) (charge 128 (192 + i.val)) shift
      (S (192 + i.val + 1)) (S 129) (T 128 (192 + i.val + 1))
      (T 128 (192 + i.val)) (T 129 (192 + i.val))
      (OriginalRow227Roots.root_pos 129 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 128 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1562.entries OriginalRow227TriangleForward1562.checked
    ⟨i.val, by rw [size1562]; exact i.isLt⟩
  change (entry1562 i).check = true at h
  rcases fields1562 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1563 : OriginalRow227TriangleForward1563.entries.size = 32 := rfl

def entry1563 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1563.entries[i.val]'(by rw [size1563]; exact i.isLt)

theorem fields1563 (i : Fin 32) :
    (entry1563 i).IA = shift ∧ (entry1563 i).ID = S (224 + i.val + 1) ∧
      (entry1563 i).IC = S 129 ∧ (entry1563 i).Inext = T 128 (224 + i.val + 1) ∧
      (entry1563 i).Icur = T 128 (224 + i.val) ∧
      (entry1563 i).output = T 129 (224 + i.val) ∧
      (entry1563 i).charge = charge 128 (224 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1571_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1563 (i : Fin 32) :
    forwardStepOK (-768) (charge 128 (224 + i.val)) shift
      (S (224 + i.val + 1)) (S 129) (T 128 (224 + i.val + 1))
      (T 128 (224 + i.val)) (T 129 (224 + i.val))
      (OriginalRow227Roots.root_pos 129 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 128 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1563.entries OriginalRow227TriangleForward1563.checked
    ⟨i.val, by rw [size1563]; exact i.isLt⟩
  change (entry1563 i).check = true at h
  rcases fields1563 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1564 : OriginalRow227TriangleForward1564.entries.size = 32 := rfl

def entry1564 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1564.entries[i.val]'(by rw [size1564]; exact i.isLt)

theorem fields1564 (i : Fin 32) :
    (entry1564 i).IA = shift ∧ (entry1564 i).ID = S (256 + i.val + 1) ∧
      (entry1564 i).IC = S 129 ∧ (entry1564 i).Inext = T 128 (256 + i.val + 1) ∧
      (entry1564 i).Icur = T 128 (256 + i.val) ∧
      (entry1564 i).output = T 129 (256 + i.val) ∧
      (entry1564 i).charge = charge 128 (256 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1572_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1564 (i : Fin 32) :
    forwardStepOK (-768) (charge 128 (256 + i.val)) shift
      (S (256 + i.val + 1)) (S 129) (T 128 (256 + i.val + 1))
      (T 128 (256 + i.val)) (T 129 (256 + i.val))
      (OriginalRow227Roots.root_pos 129 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 128 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1564.entries OriginalRow227TriangleForward1564.checked
    ⟨i.val, by rw [size1564]; exact i.isLt⟩
  change (entry1564 i).check = true at h
  rcases fields1564 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1565 : OriginalRow227TriangleForward1565.entries.size = 32 := rfl

def entry1565 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1565.entries[i.val]'(by rw [size1565]; exact i.isLt)

theorem fields1565 (i : Fin 32) :
    (entry1565 i).IA = shift ∧ (entry1565 i).ID = S (288 + i.val + 1) ∧
      (entry1565 i).IC = S 129 ∧ (entry1565 i).Inext = T 128 (288 + i.val + 1) ∧
      (entry1565 i).Icur = T 128 (288 + i.val) ∧
      (entry1565 i).output = T 129 (288 + i.val) ∧
      (entry1565 i).charge = charge 128 (288 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1573_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1565 (i : Fin 32) :
    forwardStepOK (-768) (charge 128 (288 + i.val)) shift
      (S (288 + i.val + 1)) (S 129) (T 128 (288 + i.val + 1))
      (T 128 (288 + i.val)) (T 129 (288 + i.val))
      (OriginalRow227Roots.root_pos 129 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 128 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1565.entries OriginalRow227TriangleForward1565.checked
    ⟨i.val, by rw [size1565]; exact i.isLt⟩
  change (entry1565 i).check = true at h
  rcases fields1565 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1566 : OriginalRow227TriangleForward1566.entries.size = 32 := rfl

def entry1566 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1566.entries[i.val]'(by rw [size1566]; exact i.isLt)

theorem fields1566 (i : Fin 32) :
    (entry1566 i).IA = shift ∧ (entry1566 i).ID = S (320 + i.val + 1) ∧
      (entry1566 i).IC = S 129 ∧ (entry1566 i).Inext = T 128 (320 + i.val + 1) ∧
      (entry1566 i).Icur = T 128 (320 + i.val) ∧
      (entry1566 i).output = T 129 (320 + i.val) ∧
      (entry1566 i).charge = charge 128 (320 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1574_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1566 (i : Fin 32) :
    forwardStepOK (-768) (charge 128 (320 + i.val)) shift
      (S (320 + i.val + 1)) (S 129) (T 128 (320 + i.val + 1))
      (T 128 (320 + i.val)) (T 129 (320 + i.val))
      (OriginalRow227Roots.root_pos 129 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 128 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1566.entries OriginalRow227TriangleForward1566.checked
    ⟨i.val, by rw [size1566]; exact i.isLt⟩
  change (entry1566 i).check = true at h
  rcases fields1566 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1567 : OriginalRow227TriangleForward1567.entries.size = 21 := rfl

def entry1567 (i : Fin 21) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1567.entries[i.val]'(by rw [size1567]; exact i.isLt)

theorem fields1567 (i : Fin 21) :
    (entry1567 i).IA = shift ∧ (entry1567 i).ID = S (352 + i.val + 1) ∧
      (entry1567 i).IC = S 129 ∧ (entry1567 i).Inext = T 128 (352 + i.val + 1) ∧
      (entry1567 i).Icur = T 128 (352 + i.val) ∧
      (entry1567 i).output = T 129 (352 + i.val) ∧
      (entry1567 i).charge = charge 128 (352 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings04.S_eq_root129).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow128.block1575_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨20, by decide⟩).symm, rfl⟩

theorem step1567 (i : Fin 21) :
    forwardStepOK (-768) (charge 128 (352 + i.val)) shift
      (S (352 + i.val + 1)) (S 129) (T 128 (352 + i.val + 1))
      (T 128 (352 + i.val)) (T 129 (352 + i.val))
      (OriginalRow227Roots.root_pos 129 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 128 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1567.entries OriginalRow227TriangleForward1567.checked
    ⟨i.val, by rw [size1567]; exact i.isLt⟩
  change (entry1567 i).check = true at h
  rcases fields1567 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 128 ≤ d) (hhi : d < 373) :
    forwardStepOK (-768) (charge 128 d) shift (S (d + 1)) (S 129)
      (T 128 (d + 1)) (T 128 d) (T 129 d)
      (OriginalRow227Roots.root_pos 129 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 128 (by decide)) = true := by
  by_cases h256 : d < 256
  ·
    by_cases h192 : d < 192
    ·
      by_cases h160 : d < 160
      ·
        have hi : d - 128 < 32 := by omega
        have heq : 128 + (d - 128) = d := by omega
        simpa only [heq] using step1560 ⟨d - 128, hi⟩
      ·
        have hi : d - 160 < 32 := by omega
        have heq : 160 + (d - 160) = d := by omega
        simpa only [heq] using step1561 ⟨d - 160, hi⟩
    ·
      by_cases h224 : d < 224
      ·
        have hi : d - 192 < 32 := by omega
        have heq : 192 + (d - 192) = d := by omega
        simpa only [heq] using step1562 ⟨d - 192, hi⟩
      ·
        have hi : d - 224 < 32 := by omega
        have heq : 224 + (d - 224) = d := by omega
        simpa only [heq] using step1563 ⟨d - 224, hi⟩
  ·
    by_cases h320 : d < 320
    ·
      by_cases h288 : d < 288
      ·
        have hi : d - 256 < 32 := by omega
        have heq : 256 + (d - 256) = d := by omega
        simpa only [heq] using step1564 ⟨d - 256, hi⟩
      ·
        have hi : d - 288 < 32 := by omega
        have heq : 288 + (d - 288) = d := by omega
        simpa only [heq] using step1565 ⟨d - 288, hi⟩
    ·
      by_cases h352 : d < 352
      ·
        have hi : d - 320 < 32 := by omega
        have heq : 320 + (d - 320) = d := by omega
        simpa only [heq] using step1566 ⟨d - 320, hi⟩
      ·
        have hi : d - 352 < 21 := by omega
        have heq : 352 + (d - 352) = d := by omega
        simpa only [heq] using step1567 ⟨d - 352, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow129.fields1560,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow129.step1560,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow129.fields1561,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow129.step1561,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow129.fields1562,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow129.step1562,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow129.fields1563,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow129.step1563,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow129.fields1564,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow129.step1564,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow129.fields1565,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow129.step1565,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow129.fields1566,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow129.step1566,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow129.fields1567,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow129.step1567,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow129.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow129
