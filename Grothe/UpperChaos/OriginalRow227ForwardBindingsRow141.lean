import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow140
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow141
import Grothe.UpperChaos.OriginalRow227TriangleForward1655
import Grothe.UpperChaos.OriginalRow227TriangleForward1656
import Grothe.UpperChaos.OriginalRow227TriangleForward1657
import Grothe.UpperChaos.OriginalRow227TriangleForward1658
import Grothe.UpperChaos.OriginalRow227TriangleForward1659
import Grothe.UpperChaos.OriginalRow227TriangleForward1660
import Grothe.UpperChaos.OriginalRow227TriangleForward1661

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow141

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1655 : OriginalRow227TriangleForward1655.entries.size = 32 := rfl

def entry1655 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1655.entries[i.val]'(by rw [size1655]; exact i.isLt)

theorem fields1655 (i : Fin 32) :
    (entry1655 i).IA = shift ∧ (entry1655 i).ID = S (140 + i.val + 1) ∧
      (entry1655 i).IC = S 141 ∧ (entry1655 i).Inext = T 140 (140 + i.val + 1) ∧
      (entry1655 i).Icur = T 140 (140 + i.val) ∧
      (entry1655 i).output = T 141 (140 + i.val) ∧
      (entry1655 i).charge = charge 140 (140 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1655 (i : Fin 32) :
    forwardStepOK (-768) (charge 140 (140 + i.val)) shift
      (S (140 + i.val + 1)) (S 141) (T 140 (140 + i.val + 1))
      (T 140 (140 + i.val)) (T 141 (140 + i.val))
      (OriginalRow227Roots.root_pos 141 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 140 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1655.entries OriginalRow227TriangleForward1655.checked
    ⟨i.val, by rw [size1655]; exact i.isLt⟩
  change (entry1655 i).check = true at h
  rcases fields1655 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1656 : OriginalRow227TriangleForward1656.entries.size = 32 := rfl

def entry1656 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1656.entries[i.val]'(by rw [size1656]; exact i.isLt)

theorem fields1656 (i : Fin 32) :
    (entry1656 i).IA = shift ∧ (entry1656 i).ID = S (172 + i.val + 1) ∧
      (entry1656 i).IC = S 141 ∧ (entry1656 i).Inext = T 140 (172 + i.val + 1) ∧
      (entry1656 i).Icur = T 140 (172 + i.val) ∧
      (entry1656 i).output = T 141 (172 + i.val) ∧
      (entry1656 i).charge = charge 140 (172 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1656 (i : Fin 32) :
    forwardStepOK (-768) (charge 140 (172 + i.val)) shift
      (S (172 + i.val + 1)) (S 141) (T 140 (172 + i.val + 1))
      (T 140 (172 + i.val)) (T 141 (172 + i.val))
      (OriginalRow227Roots.root_pos 141 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 140 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1656.entries OriginalRow227TriangleForward1656.checked
    ⟨i.val, by rw [size1656]; exact i.isLt⟩
  change (entry1656 i).check = true at h
  rcases fields1656 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1657 : OriginalRow227TriangleForward1657.entries.size = 32 := rfl

def entry1657 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1657.entries[i.val]'(by rw [size1657]; exact i.isLt)

theorem fields1657 (i : Fin 32) :
    (entry1657 i).IA = shift ∧ (entry1657 i).ID = S (204 + i.val + 1) ∧
      (entry1657 i).IC = S 141 ∧ (entry1657 i).Inext = T 140 (204 + i.val + 1) ∧
      (entry1657 i).Icur = T 140 (204 + i.val) ∧
      (entry1657 i).output = T 141 (204 + i.val) ∧
      (entry1657 i).charge = charge 140 (204 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1657 (i : Fin 32) :
    forwardStepOK (-768) (charge 140 (204 + i.val)) shift
      (S (204 + i.val + 1)) (S 141) (T 140 (204 + i.val + 1))
      (T 140 (204 + i.val)) (T 141 (204 + i.val))
      (OriginalRow227Roots.root_pos 141 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 140 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1657.entries OriginalRow227TriangleForward1657.checked
    ⟨i.val, by rw [size1657]; exact i.isLt⟩
  change (entry1657 i).check = true at h
  rcases fields1657 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1658 : OriginalRow227TriangleForward1658.entries.size = 32 := rfl

def entry1658 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1658.entries[i.val]'(by rw [size1658]; exact i.isLt)

theorem fields1658 (i : Fin 32) :
    (entry1658 i).IA = shift ∧ (entry1658 i).ID = S (236 + i.val + 1) ∧
      (entry1658 i).IC = S 141 ∧ (entry1658 i).Inext = T 140 (236 + i.val + 1) ∧
      (entry1658 i).Icur = T 140 (236 + i.val) ∧
      (entry1658 i).output = T 141 (236 + i.val) ∧
      (entry1658 i).charge = charge 140 (236 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1658 (i : Fin 32) :
    forwardStepOK (-768) (charge 140 (236 + i.val)) shift
      (S (236 + i.val + 1)) (S 141) (T 140 (236 + i.val + 1))
      (T 140 (236 + i.val)) (T 141 (236 + i.val))
      (OriginalRow227Roots.root_pos 141 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 140 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1658.entries OriginalRow227TriangleForward1658.checked
    ⟨i.val, by rw [size1658]; exact i.isLt⟩
  change (entry1658 i).check = true at h
  rcases fields1658 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1659 : OriginalRow227TriangleForward1659.entries.size = 32 := rfl

def entry1659 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1659.entries[i.val]'(by rw [size1659]; exact i.isLt)

theorem fields1659 (i : Fin 32) :
    (entry1659 i).IA = shift ∧ (entry1659 i).ID = S (268 + i.val + 1) ∧
      (entry1659 i).IC = S 141 ∧ (entry1659 i).Inext = T 140 (268 + i.val + 1) ∧
      (entry1659 i).Icur = T 140 (268 + i.val) ∧
      (entry1659 i).output = T 141 (268 + i.val) ∧
      (entry1659 i).charge = charge 140 (268 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1659 (i : Fin 32) :
    forwardStepOK (-768) (charge 140 (268 + i.val)) shift
      (S (268 + i.val + 1)) (S 141) (T 140 (268 + i.val + 1))
      (T 140 (268 + i.val)) (T 141 (268 + i.val))
      (OriginalRow227Roots.root_pos 141 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 140 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1659.entries OriginalRow227TriangleForward1659.checked
    ⟨i.val, by rw [size1659]; exact i.isLt⟩
  change (entry1659 i).check = true at h
  rcases fields1659 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1660 : OriginalRow227TriangleForward1660.entries.size = 32 := rfl

def entry1660 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1660.entries[i.val]'(by rw [size1660]; exact i.isLt)

theorem fields1660 (i : Fin 32) :
    (entry1660 i).IA = shift ∧ (entry1660 i).ID = S (300 + i.val + 1) ∧
      (entry1660 i).IC = S 141 ∧ (entry1660 i).Inext = T 140 (300 + i.val + 1) ∧
      (entry1660 i).Icur = T 140 (300 + i.val) ∧
      (entry1660 i).output = T 141 (300 + i.val) ∧
      (entry1660 i).charge = charge 140 (300 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1660 (i : Fin 32) :
    forwardStepOK (-768) (charge 140 (300 + i.val)) shift
      (S (300 + i.val + 1)) (S 141) (T 140 (300 + i.val + 1))
      (T 140 (300 + i.val)) (T 141 (300 + i.val))
      (OriginalRow227Roots.root_pos 141 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 140 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1660.entries OriginalRow227TriangleForward1660.checked
    ⟨i.val, by rw [size1660]; exact i.isLt⟩
  change (entry1660 i).check = true at h
  rcases fields1660 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1661 : OriginalRow227TriangleForward1661.entries.size = 29 := rfl

def entry1661 (i : Fin 29) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1661.entries[i.val]'(by rw [size1661]; exact i.isLt)

theorem fields1661 (i : Fin 29) :
    (entry1661 i).IA = shift ∧ (entry1661 i).ID = S (332 + i.val + 1) ∧
      (entry1661 i).IC = S 141 ∧ (entry1661 i).Inext = T 140 (332 + i.val + 1) ∧
      (entry1661 i).Icur = T 140 (332 + i.val) ∧
      (entry1661 i).output = T 141 (332 + i.val) ∧
      (entry1661 i).charge = charge 140 (332 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings04.S_eq_root141).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨28, by decide⟩).symm, rfl⟩

theorem step1661 (i : Fin 29) :
    forwardStepOK (-768) (charge 140 (332 + i.val)) shift
      (S (332 + i.val + 1)) (S 141) (T 140 (332 + i.val + 1))
      (T 140 (332 + i.val)) (T 141 (332 + i.val))
      (OriginalRow227Roots.root_pos 141 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 140 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1661.entries OriginalRow227TriangleForward1661.checked
    ⟨i.val, by rw [size1661]; exact i.isLt⟩
  change (entry1661 i).check = true at h
  rcases fields1661 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 140 ≤ d) (hhi : d < 361) :
    forwardStepOK (-768) (charge 140 d) shift (S (d + 1)) (S 141)
      (T 140 (d + 1)) (T 140 d) (T 141 d)
      (OriginalRow227Roots.root_pos 141 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 140 (by decide)) = true := by
  by_cases h236 : d < 236
  ·
    by_cases h172 : d < 172
    ·
      have hi : d - 140 < 32 := by omega
      have heq : 140 + (d - 140) = d := by omega
      simpa only [heq] using step1655 ⟨d - 140, hi⟩
    ·
      by_cases h204 : d < 204
      ·
        have hi : d - 172 < 32 := by omega
        have heq : 172 + (d - 172) = d := by omega
        simpa only [heq] using step1656 ⟨d - 172, hi⟩
      ·
        have hi : d - 204 < 32 := by omega
        have heq : 204 + (d - 204) = d := by omega
        simpa only [heq] using step1657 ⟨d - 204, hi⟩
  ·
    by_cases h300 : d < 300
    ·
      by_cases h268 : d < 268
      ·
        have hi : d - 236 < 32 := by omega
        have heq : 236 + (d - 236) = d := by omega
        simpa only [heq] using step1658 ⟨d - 236, hi⟩
      ·
        have hi : d - 268 < 32 := by omega
        have heq : 268 + (d - 268) = d := by omega
        simpa only [heq] using step1659 ⟨d - 268, hi⟩
    ·
      by_cases h332 : d < 332
      ·
        have hi : d - 300 < 32 := by omega
        have heq : 300 + (d - 300) = d := by omega
        simpa only [heq] using step1660 ⟨d - 300, hi⟩
      ·
        have hi : d - 332 < 29 := by omega
        have heq : 332 + (d - 332) = d := by omega
        simpa only [heq] using step1661 ⟨d - 332, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow141.fields1655,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow141.step1655,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow141.fields1656,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow141.step1656,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow141.fields1657,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow141.step1657,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow141.fields1658,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow141.step1658,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow141.fields1659,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow141.step1659,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow141.fields1660,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow141.step1660,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow141.fields1661,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow141.step1661,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow141.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow141
