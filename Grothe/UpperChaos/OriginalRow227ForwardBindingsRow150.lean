import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow149
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow150
import Grothe.UpperChaos.OriginalRow227TriangleForward1718
import Grothe.UpperChaos.OriginalRow227TriangleForward1719
import Grothe.UpperChaos.OriginalRow227TriangleForward1720
import Grothe.UpperChaos.OriginalRow227TriangleForward1721
import Grothe.UpperChaos.OriginalRow227TriangleForward1722
import Grothe.UpperChaos.OriginalRow227TriangleForward1723
import Grothe.UpperChaos.OriginalRow227TriangleForward1724

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow150

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1718 : OriginalRow227TriangleForward1718.entries.size = 32 := rfl

def entry1718 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1718.entries[i.val]'(by rw [size1718]; exact i.isLt)

theorem fields1718 (i : Fin 32) :
    (entry1718 i).IA = shift ∧ (entry1718 i).ID = S (149 + i.val + 1) ∧
      (entry1718 i).IC = S 150 ∧ (entry1718 i).Inext = T 149 (149 + i.val + 1) ∧
      (entry1718 i).Icur = T 149 (149 + i.val) ∧
      (entry1718 i).output = T 150 (149 + i.val) ∧
      (entry1718 i).charge = charge 149 (149 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1718 (i : Fin 32) :
    forwardStepOK (-768) (charge 149 (149 + i.val)) shift
      (S (149 + i.val + 1)) (S 150) (T 149 (149 + i.val + 1))
      (T 149 (149 + i.val)) (T 150 (149 + i.val))
      (OriginalRow227Roots.root_pos 150 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 149 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1718.entries OriginalRow227TriangleForward1718.checked
    ⟨i.val, by rw [size1718]; exact i.isLt⟩
  change (entry1718 i).check = true at h
  rcases fields1718 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1719 : OriginalRow227TriangleForward1719.entries.size = 32 := rfl

def entry1719 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1719.entries[i.val]'(by rw [size1719]; exact i.isLt)

theorem fields1719 (i : Fin 32) :
    (entry1719 i).IA = shift ∧ (entry1719 i).ID = S (181 + i.val + 1) ∧
      (entry1719 i).IC = S 150 ∧ (entry1719 i).Inext = T 149 (181 + i.val + 1) ∧
      (entry1719 i).Icur = T 149 (181 + i.val) ∧
      (entry1719 i).output = T 150 (181 + i.val) ∧
      (entry1719 i).charge = charge 149 (181 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1719 (i : Fin 32) :
    forwardStepOK (-768) (charge 149 (181 + i.val)) shift
      (S (181 + i.val + 1)) (S 150) (T 149 (181 + i.val + 1))
      (T 149 (181 + i.val)) (T 150 (181 + i.val))
      (OriginalRow227Roots.root_pos 150 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 149 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1719.entries OriginalRow227TriangleForward1719.checked
    ⟨i.val, by rw [size1719]; exact i.isLt⟩
  change (entry1719 i).check = true at h
  rcases fields1719 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1720 : OriginalRow227TriangleForward1720.entries.size = 32 := rfl

def entry1720 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1720.entries[i.val]'(by rw [size1720]; exact i.isLt)

theorem fields1720 (i : Fin 32) :
    (entry1720 i).IA = shift ∧ (entry1720 i).ID = S (213 + i.val + 1) ∧
      (entry1720 i).IC = S 150 ∧ (entry1720 i).Inext = T 149 (213 + i.val + 1) ∧
      (entry1720 i).Icur = T 149 (213 + i.val) ∧
      (entry1720 i).output = T 150 (213 + i.val) ∧
      (entry1720 i).charge = charge 149 (213 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1720 (i : Fin 32) :
    forwardStepOK (-768) (charge 149 (213 + i.val)) shift
      (S (213 + i.val + 1)) (S 150) (T 149 (213 + i.val + 1))
      (T 149 (213 + i.val)) (T 150 (213 + i.val))
      (OriginalRow227Roots.root_pos 150 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 149 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1720.entries OriginalRow227TriangleForward1720.checked
    ⟨i.val, by rw [size1720]; exact i.isLt⟩
  change (entry1720 i).check = true at h
  rcases fields1720 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1721 : OriginalRow227TriangleForward1721.entries.size = 32 := rfl

def entry1721 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1721.entries[i.val]'(by rw [size1721]; exact i.isLt)

theorem fields1721 (i : Fin 32) :
    (entry1721 i).IA = shift ∧ (entry1721 i).ID = S (245 + i.val + 1) ∧
      (entry1721 i).IC = S 150 ∧ (entry1721 i).Inext = T 149 (245 + i.val + 1) ∧
      (entry1721 i).Icur = T 149 (245 + i.val) ∧
      (entry1721 i).output = T 150 (245 + i.val) ∧
      (entry1721 i).charge = charge 149 (245 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1721 (i : Fin 32) :
    forwardStepOK (-768) (charge 149 (245 + i.val)) shift
      (S (245 + i.val + 1)) (S 150) (T 149 (245 + i.val + 1))
      (T 149 (245 + i.val)) (T 150 (245 + i.val))
      (OriginalRow227Roots.root_pos 150 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 149 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1721.entries OriginalRow227TriangleForward1721.checked
    ⟨i.val, by rw [size1721]; exact i.isLt⟩
  change (entry1721 i).check = true at h
  rcases fields1721 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1722 : OriginalRow227TriangleForward1722.entries.size = 32 := rfl

def entry1722 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1722.entries[i.val]'(by rw [size1722]; exact i.isLt)

theorem fields1722 (i : Fin 32) :
    (entry1722 i).IA = shift ∧ (entry1722 i).ID = S (277 + i.val + 1) ∧
      (entry1722 i).IC = S 150 ∧ (entry1722 i).Inext = T 149 (277 + i.val + 1) ∧
      (entry1722 i).Icur = T 149 (277 + i.val) ∧
      (entry1722 i).output = T 150 (277 + i.val) ∧
      (entry1722 i).charge = charge 149 (277 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1722 (i : Fin 32) :
    forwardStepOK (-768) (charge 149 (277 + i.val)) shift
      (S (277 + i.val + 1)) (S 150) (T 149 (277 + i.val + 1))
      (T 149 (277 + i.val)) (T 150 (277 + i.val))
      (OriginalRow227Roots.root_pos 150 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 149 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1722.entries OriginalRow227TriangleForward1722.checked
    ⟨i.val, by rw [size1722]; exact i.isLt⟩
  change (entry1722 i).check = true at h
  rcases fields1722 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1723 : OriginalRow227TriangleForward1723.entries.size = 32 := rfl

def entry1723 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1723.entries[i.val]'(by rw [size1723]; exact i.isLt)

theorem fields1723 (i : Fin 32) :
    (entry1723 i).IA = shift ∧ (entry1723 i).ID = S (309 + i.val + 1) ∧
      (entry1723 i).IC = S 150 ∧ (entry1723 i).Inext = T 149 (309 + i.val + 1) ∧
      (entry1723 i).Icur = T 149 (309 + i.val) ∧
      (entry1723 i).output = T 150 (309 + i.val) ∧
      (entry1723 i).charge = charge 149 (309 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1723 (i : Fin 32) :
    forwardStepOK (-768) (charge 149 (309 + i.val)) shift
      (S (309 + i.val + 1)) (S 150) (T 149 (309 + i.val + 1))
      (T 149 (309 + i.val)) (T 150 (309 + i.val))
      (OriginalRow227Roots.root_pos 150 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 149 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1723.entries OriginalRow227TriangleForward1723.checked
    ⟨i.val, by rw [size1723]; exact i.isLt⟩
  change (entry1723 i).check = true at h
  rcases fields1723 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1724 : OriginalRow227TriangleForward1724.entries.size = 11 := rfl

def entry1724 (i : Fin 11) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1724.entries[i.val]'(by rw [size1724]; exact i.isLt)

theorem fields1724 (i : Fin 11) :
    (entry1724 i).IA = shift ∧ (entry1724 i).ID = S (341 + i.val + 1) ∧
      (entry1724 i).IC = S 150 ∧ (entry1724 i).Inext = T 149 (341 + i.val + 1) ∧
      (entry1724 i).Icur = T 149 (341 + i.val) ∧
      (entry1724 i).output = T 150 (341 + i.val) ∧
      (entry1724 i).charge = charge 149 (341 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root150).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨10, by decide⟩).symm, rfl⟩

theorem step1724 (i : Fin 11) :
    forwardStepOK (-768) (charge 149 (341 + i.val)) shift
      (S (341 + i.val + 1)) (S 150) (T 149 (341 + i.val + 1))
      (T 149 (341 + i.val)) (T 150 (341 + i.val))
      (OriginalRow227Roots.root_pos 150 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 149 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1724.entries OriginalRow227TriangleForward1724.checked
    ⟨i.val, by rw [size1724]; exact i.isLt⟩
  change (entry1724 i).check = true at h
  rcases fields1724 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 149 ≤ d) (hhi : d < 352) :
    forwardStepOK (-768) (charge 149 d) shift (S (d + 1)) (S 150)
      (T 149 (d + 1)) (T 149 d) (T 150 d)
      (OriginalRow227Roots.root_pos 150 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 149 (by decide)) = true := by
  by_cases h245 : d < 245
  ·
    by_cases h181 : d < 181
    ·
      have hi : d - 149 < 32 := by omega
      have heq : 149 + (d - 149) = d := by omega
      simpa only [heq] using step1718 ⟨d - 149, hi⟩
    ·
      by_cases h213 : d < 213
      ·
        have hi : d - 181 < 32 := by omega
        have heq : 181 + (d - 181) = d := by omega
        simpa only [heq] using step1719 ⟨d - 181, hi⟩
      ·
        have hi : d - 213 < 32 := by omega
        have heq : 213 + (d - 213) = d := by omega
        simpa only [heq] using step1720 ⟨d - 213, hi⟩
  ·
    by_cases h309 : d < 309
    ·
      by_cases h277 : d < 277
      ·
        have hi : d - 245 < 32 := by omega
        have heq : 245 + (d - 245) = d := by omega
        simpa only [heq] using step1721 ⟨d - 245, hi⟩
      ·
        have hi : d - 277 < 32 := by omega
        have heq : 277 + (d - 277) = d := by omega
        simpa only [heq] using step1722 ⟨d - 277, hi⟩
    ·
      by_cases h341 : d < 341
      ·
        have hi : d - 309 < 32 := by omega
        have heq : 309 + (d - 309) = d := by omega
        simpa only [heq] using step1723 ⟨d - 309, hi⟩
      ·
        have hi : d - 341 < 11 := by omega
        have heq : 341 + (d - 341) = d := by omega
        simpa only [heq] using step1724 ⟨d - 341, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow150.fields1718,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow150.step1718,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow150.fields1719,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow150.step1719,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow150.fields1720,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow150.step1720,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow150.fields1721,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow150.step1721,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow150.fields1722,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow150.step1722,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow150.fields1723,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow150.step1723,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow150.fields1724,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow150.step1724,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow150.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow150
