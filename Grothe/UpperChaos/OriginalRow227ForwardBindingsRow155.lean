import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow154
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow155
import Grothe.UpperChaos.OriginalRow227TriangleForward1753
import Grothe.UpperChaos.OriginalRow227TriangleForward1754
import Grothe.UpperChaos.OriginalRow227TriangleForward1755
import Grothe.UpperChaos.OriginalRow227TriangleForward1756
import Grothe.UpperChaos.OriginalRow227TriangleForward1757
import Grothe.UpperChaos.OriginalRow227TriangleForward1758
import Grothe.UpperChaos.OriginalRow227TriangleForward1759

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow155

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1753 : OriginalRow227TriangleForward1753.entries.size = 32 := rfl

def entry1753 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1753.entries[i.val]'(by rw [size1753]; exact i.isLt)

theorem fields1753 (i : Fin 32) :
    (entry1753 i).IA = shift ∧ (entry1753 i).ID = S (154 + i.val + 1) ∧
      (entry1753 i).IC = S 155 ∧ (entry1753 i).Inext = T 154 (154 + i.val + 1) ∧
      (entry1753 i).Icur = T 154 (154 + i.val) ∧
      (entry1753 i).output = T 155 (154 + i.val) ∧
      (entry1753 i).charge = charge 154 (154 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1753 (i : Fin 32) :
    forwardStepOK (-768) (charge 154 (154 + i.val)) shift
      (S (154 + i.val + 1)) (S 155) (T 154 (154 + i.val + 1))
      (T 154 (154 + i.val)) (T 155 (154 + i.val))
      (OriginalRow227Roots.root_pos 155 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 154 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1753.entries OriginalRow227TriangleForward1753.checked
    ⟨i.val, by rw [size1753]; exact i.isLt⟩
  change (entry1753 i).check = true at h
  rcases fields1753 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1754 : OriginalRow227TriangleForward1754.entries.size = 32 := rfl

def entry1754 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1754.entries[i.val]'(by rw [size1754]; exact i.isLt)

theorem fields1754 (i : Fin 32) :
    (entry1754 i).IA = shift ∧ (entry1754 i).ID = S (186 + i.val + 1) ∧
      (entry1754 i).IC = S 155 ∧ (entry1754 i).Inext = T 154 (186 + i.val + 1) ∧
      (entry1754 i).Icur = T 154 (186 + i.val) ∧
      (entry1754 i).output = T 155 (186 + i.val) ∧
      (entry1754 i).charge = charge 154 (186 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1754 (i : Fin 32) :
    forwardStepOK (-768) (charge 154 (186 + i.val)) shift
      (S (186 + i.val + 1)) (S 155) (T 154 (186 + i.val + 1))
      (T 154 (186 + i.val)) (T 155 (186 + i.val))
      (OriginalRow227Roots.root_pos 155 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 154 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1754.entries OriginalRow227TriangleForward1754.checked
    ⟨i.val, by rw [size1754]; exact i.isLt⟩
  change (entry1754 i).check = true at h
  rcases fields1754 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1755 : OriginalRow227TriangleForward1755.entries.size = 32 := rfl

def entry1755 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1755.entries[i.val]'(by rw [size1755]; exact i.isLt)

theorem fields1755 (i : Fin 32) :
    (entry1755 i).IA = shift ∧ (entry1755 i).ID = S (218 + i.val + 1) ∧
      (entry1755 i).IC = S 155 ∧ (entry1755 i).Inext = T 154 (218 + i.val + 1) ∧
      (entry1755 i).Icur = T 154 (218 + i.val) ∧
      (entry1755 i).output = T 155 (218 + i.val) ∧
      (entry1755 i).charge = charge 154 (218 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1755 (i : Fin 32) :
    forwardStepOK (-768) (charge 154 (218 + i.val)) shift
      (S (218 + i.val + 1)) (S 155) (T 154 (218 + i.val + 1))
      (T 154 (218 + i.val)) (T 155 (218 + i.val))
      (OriginalRow227Roots.root_pos 155 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 154 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1755.entries OriginalRow227TriangleForward1755.checked
    ⟨i.val, by rw [size1755]; exact i.isLt⟩
  change (entry1755 i).check = true at h
  rcases fields1755 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1756 : OriginalRow227TriangleForward1756.entries.size = 32 := rfl

def entry1756 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1756.entries[i.val]'(by rw [size1756]; exact i.isLt)

theorem fields1756 (i : Fin 32) :
    (entry1756 i).IA = shift ∧ (entry1756 i).ID = S (250 + i.val + 1) ∧
      (entry1756 i).IC = S 155 ∧ (entry1756 i).Inext = T 154 (250 + i.val + 1) ∧
      (entry1756 i).Icur = T 154 (250 + i.val) ∧
      (entry1756 i).output = T 155 (250 + i.val) ∧
      (entry1756 i).charge = charge 154 (250 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1756 (i : Fin 32) :
    forwardStepOK (-768) (charge 154 (250 + i.val)) shift
      (S (250 + i.val + 1)) (S 155) (T 154 (250 + i.val + 1))
      (T 154 (250 + i.val)) (T 155 (250 + i.val))
      (OriginalRow227Roots.root_pos 155 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 154 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1756.entries OriginalRow227TriangleForward1756.checked
    ⟨i.val, by rw [size1756]; exact i.isLt⟩
  change (entry1756 i).check = true at h
  rcases fields1756 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1757 : OriginalRow227TriangleForward1757.entries.size = 32 := rfl

def entry1757 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1757.entries[i.val]'(by rw [size1757]; exact i.isLt)

theorem fields1757 (i : Fin 32) :
    (entry1757 i).IA = shift ∧ (entry1757 i).ID = S (282 + i.val + 1) ∧
      (entry1757 i).IC = S 155 ∧ (entry1757 i).Inext = T 154 (282 + i.val + 1) ∧
      (entry1757 i).Icur = T 154 (282 + i.val) ∧
      (entry1757 i).output = T 155 (282 + i.val) ∧
      (entry1757 i).charge = charge 154 (282 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1757 (i : Fin 32) :
    forwardStepOK (-768) (charge 154 (282 + i.val)) shift
      (S (282 + i.val + 1)) (S 155) (T 154 (282 + i.val + 1))
      (T 154 (282 + i.val)) (T 155 (282 + i.val))
      (OriginalRow227Roots.root_pos 155 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 154 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1757.entries OriginalRow227TriangleForward1757.checked
    ⟨i.val, by rw [size1757]; exact i.isLt⟩
  change (entry1757 i).check = true at h
  rcases fields1757 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1758 : OriginalRow227TriangleForward1758.entries.size = 32 := rfl

def entry1758 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1758.entries[i.val]'(by rw [size1758]; exact i.isLt)

theorem fields1758 (i : Fin 32) :
    (entry1758 i).IA = shift ∧ (entry1758 i).ID = S (314 + i.val + 1) ∧
      (entry1758 i).IC = S 155 ∧ (entry1758 i).Inext = T 154 (314 + i.val + 1) ∧
      (entry1758 i).Icur = T 154 (314 + i.val) ∧
      (entry1758 i).output = T 155 (314 + i.val) ∧
      (entry1758 i).charge = charge 154 (314 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1768_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1768_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1768_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1758 (i : Fin 32) :
    forwardStepOK (-768) (charge 154 (314 + i.val)) shift
      (S (314 + i.val + 1)) (S 155) (T 154 (314 + i.val + 1))
      (T 154 (314 + i.val)) (T 155 (314 + i.val))
      (OriginalRow227Roots.root_pos 155 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 154 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1758.entries OriginalRow227TriangleForward1758.checked
    ⟨i.val, by rw [size1758]; exact i.isLt⟩
  change (entry1758 i).check = true at h
  rcases fields1758 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1759 : OriginalRow227TriangleForward1759.entries.size = 1 := rfl

def entry1759 (i : Fin 1) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1759.entries[i.val]'(by rw [size1759]; exact i.isLt)

theorem fields1759 (i : Fin 1) :
    (entry1759 i).IA = shift ∧ (entry1759 i).ID = S (346 + i.val + 1) ∧
      (entry1759 i).IC = S 155 ∧ (entry1759 i).Inext = T 154 (346 + i.val + 1) ∧
      (entry1759 i).Icur = T 154 (346 + i.val) ∧
      (entry1759 i).output = T 155 (346 + i.val) ∧
      (entry1759 i).charge = charge 154 (346 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root155).symm,
      (OriginalRow227TriangleBindingsRow154.block1768_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1768_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1775_value ⟨0, by decide⟩).symm, rfl⟩

theorem step1759 (i : Fin 1) :
    forwardStepOK (-768) (charge 154 (346 + i.val)) shift
      (S (346 + i.val + 1)) (S 155) (T 154 (346 + i.val + 1))
      (T 154 (346 + i.val)) (T 155 (346 + i.val))
      (OriginalRow227Roots.root_pos 155 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 154 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1759.entries OriginalRow227TriangleForward1759.checked
    ⟨i.val, by rw [size1759]; exact i.isLt⟩
  change (entry1759 i).check = true at h
  rcases fields1759 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 154 ≤ d) (hhi : d < 347) :
    forwardStepOK (-768) (charge 154 d) shift (S (d + 1)) (S 155)
      (T 154 (d + 1)) (T 154 d) (T 155 d)
      (OriginalRow227Roots.root_pos 155 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 154 (by decide)) = true := by
  by_cases h250 : d < 250
  ·
    by_cases h186 : d < 186
    ·
      have hi : d - 154 < 32 := by omega
      have heq : 154 + (d - 154) = d := by omega
      simpa only [heq] using step1753 ⟨d - 154, hi⟩
    ·
      by_cases h218 : d < 218
      ·
        have hi : d - 186 < 32 := by omega
        have heq : 186 + (d - 186) = d := by omega
        simpa only [heq] using step1754 ⟨d - 186, hi⟩
      ·
        have hi : d - 218 < 32 := by omega
        have heq : 218 + (d - 218) = d := by omega
        simpa only [heq] using step1755 ⟨d - 218, hi⟩
  ·
    by_cases h314 : d < 314
    ·
      by_cases h282 : d < 282
      ·
        have hi : d - 250 < 32 := by omega
        have heq : 250 + (d - 250) = d := by omega
        simpa only [heq] using step1756 ⟨d - 250, hi⟩
      ·
        have hi : d - 282 < 32 := by omega
        have heq : 282 + (d - 282) = d := by omega
        simpa only [heq] using step1757 ⟨d - 282, hi⟩
    ·
      by_cases h346 : d < 346
      ·
        have hi : d - 314 < 32 := by omega
        have heq : 314 + (d - 314) = d := by omega
        simpa only [heq] using step1758 ⟨d - 314, hi⟩
      ·
        have hi : d - 346 < 1 := by omega
        have heq : 346 + (d - 346) = d := by omega
        simpa only [heq] using step1759 ⟨d - 346, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow155.fields1753,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow155.step1753,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow155.fields1754,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow155.step1754,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow155.fields1755,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow155.step1755,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow155.fields1756,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow155.step1756,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow155.fields1757,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow155.step1757,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow155.fields1758,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow155.step1758,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow155.fields1759,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow155.step1759,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow155.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow155
