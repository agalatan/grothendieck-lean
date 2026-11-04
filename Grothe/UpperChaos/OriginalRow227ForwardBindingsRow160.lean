import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow159
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow160
import Grothe.UpperChaos.OriginalRow227TriangleForward1784
import Grothe.UpperChaos.OriginalRow227TriangleForward1785
import Grothe.UpperChaos.OriginalRow227TriangleForward1786
import Grothe.UpperChaos.OriginalRow227TriangleForward1787
import Grothe.UpperChaos.OriginalRow227TriangleForward1788
import Grothe.UpperChaos.OriginalRow227TriangleForward1789

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow160

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1784 : OriginalRow227TriangleForward1784.entries.size = 32 := rfl

def entry1784 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1784.entries[i.val]'(by rw [size1784]; exact i.isLt)

theorem fields1784 (i : Fin 32) :
    (entry1784 i).IA = shift ∧ (entry1784 i).ID = S (159 + i.val + 1) ∧
      (entry1784 i).IC = S 160 ∧ (entry1784 i).Inext = T 159 (159 + i.val + 1) ∧
      (entry1784 i).Icur = T 159 (159 + i.val) ∧
      (entry1784 i).output = T 160 (159 + i.val) ∧
      (entry1784 i).charge = charge 159 (159 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1784 (i : Fin 32) :
    forwardStepOK (-768) (charge 159 (159 + i.val)) shift
      (S (159 + i.val + 1)) (S 160) (T 159 (159 + i.val + 1))
      (T 159 (159 + i.val)) (T 160 (159 + i.val))
      (OriginalRow227Roots.root_pos 160 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 159 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1784.entries OriginalRow227TriangleForward1784.checked
    ⟨i.val, by rw [size1784]; exact i.isLt⟩
  change (entry1784 i).check = true at h
  rcases fields1784 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1785 : OriginalRow227TriangleForward1785.entries.size = 32 := rfl

def entry1785 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1785.entries[i.val]'(by rw [size1785]; exact i.isLt)

theorem fields1785 (i : Fin 32) :
    (entry1785 i).IA = shift ∧ (entry1785 i).ID = S (191 + i.val + 1) ∧
      (entry1785 i).IC = S 160 ∧ (entry1785 i).Inext = T 159 (191 + i.val + 1) ∧
      (entry1785 i).Icur = T 159 (191 + i.val) ∧
      (entry1785 i).output = T 160 (191 + i.val) ∧
      (entry1785 i).charge = charge 159 (191 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1785 (i : Fin 32) :
    forwardStepOK (-768) (charge 159 (191 + i.val)) shift
      (S (191 + i.val + 1)) (S 160) (T 159 (191 + i.val + 1))
      (T 159 (191 + i.val)) (T 160 (191 + i.val))
      (OriginalRow227Roots.root_pos 160 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 159 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1785.entries OriginalRow227TriangleForward1785.checked
    ⟨i.val, by rw [size1785]; exact i.isLt⟩
  change (entry1785 i).check = true at h
  rcases fields1785 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1786 : OriginalRow227TriangleForward1786.entries.size = 32 := rfl

def entry1786 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1786.entries[i.val]'(by rw [size1786]; exact i.isLt)

theorem fields1786 (i : Fin 32) :
    (entry1786 i).IA = shift ∧ (entry1786 i).ID = S (223 + i.val + 1) ∧
      (entry1786 i).IC = S 160 ∧ (entry1786 i).Inext = T 159 (223 + i.val + 1) ∧
      (entry1786 i).Icur = T 159 (223 + i.val) ∧
      (entry1786 i).output = T 160 (223 + i.val) ∧
      (entry1786 i).charge = charge 159 (223 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1786 (i : Fin 32) :
    forwardStepOK (-768) (charge 159 (223 + i.val)) shift
      (S (223 + i.val + 1)) (S 160) (T 159 (223 + i.val + 1))
      (T 159 (223 + i.val)) (T 160 (223 + i.val))
      (OriginalRow227Roots.root_pos 160 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 159 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1786.entries OriginalRow227TriangleForward1786.checked
    ⟨i.val, by rw [size1786]; exact i.isLt⟩
  change (entry1786 i).check = true at h
  rcases fields1786 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1787 : OriginalRow227TriangleForward1787.entries.size = 32 := rfl

def entry1787 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1787.entries[i.val]'(by rw [size1787]; exact i.isLt)

theorem fields1787 (i : Fin 32) :
    (entry1787 i).IA = shift ∧ (entry1787 i).ID = S (255 + i.val + 1) ∧
      (entry1787 i).IC = S 160 ∧ (entry1787 i).Inext = T 159 (255 + i.val + 1) ∧
      (entry1787 i).Icur = T 159 (255 + i.val) ∧
      (entry1787 i).output = T 160 (255 + i.val) ∧
      (entry1787 i).charge = charge 159 (255 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1787 (i : Fin 32) :
    forwardStepOK (-768) (charge 159 (255 + i.val)) shift
      (S (255 + i.val + 1)) (S 160) (T 159 (255 + i.val + 1))
      (T 159 (255 + i.val)) (T 160 (255 + i.val))
      (OriginalRow227Roots.root_pos 160 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 159 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1787.entries OriginalRow227TriangleForward1787.checked
    ⟨i.val, by rw [size1787]; exact i.isLt⟩
  change (entry1787 i).check = true at h
  rcases fields1787 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1788 : OriginalRow227TriangleForward1788.entries.size = 32 := rfl

def entry1788 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1788.entries[i.val]'(by rw [size1788]; exact i.isLt)

theorem fields1788 (i : Fin 32) :
    (entry1788 i).IA = shift ∧ (entry1788 i).ID = S (287 + i.val + 1) ∧
      (entry1788 i).IC = S 160 ∧ (entry1788 i).Inext = T 159 (287 + i.val + 1) ∧
      (entry1788 i).Icur = T 159 (287 + i.val) ∧
      (entry1788 i).output = T 160 (287 + i.val) ∧
      (entry1788 i).charge = charge 159 (287 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1788 (i : Fin 32) :
    forwardStepOK (-768) (charge 159 (287 + i.val)) shift
      (S (287 + i.val + 1)) (S 160) (T 159 (287 + i.val + 1))
      (T 159 (287 + i.val)) (T 160 (287 + i.val))
      (OriginalRow227Roots.root_pos 160 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 159 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1788.entries OriginalRow227TriangleForward1788.checked
    ⟨i.val, by rw [size1788]; exact i.isLt⟩
  change (entry1788 i).check = true at h
  rcases fields1788 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1789 : OriginalRow227TriangleForward1789.entries.size = 23 := rfl

def entry1789 (i : Fin 23) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1789.entries[i.val]'(by rw [size1789]; exact i.isLt)

theorem fields1789 (i : Fin 23) :
    (entry1789 i).IA = shift ∧ (entry1789 i).ID = S (319 + i.val + 1) ∧
      (entry1789 i).IC = S 160 ∧ (entry1789 i).Inext = T 159 (319 + i.val + 1) ∧
      (entry1789 i).Icur = T 159 (319 + i.val) ∧
      (entry1789 i).output = T 160 (319 + i.val) ∧
      (entry1789 i).charge = charge 159 (319 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root160).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨22, by decide⟩).symm, rfl⟩

theorem step1789 (i : Fin 23) :
    forwardStepOK (-768) (charge 159 (319 + i.val)) shift
      (S (319 + i.val + 1)) (S 160) (T 159 (319 + i.val + 1))
      (T 159 (319 + i.val)) (T 160 (319 + i.val))
      (OriginalRow227Roots.root_pos 160 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 159 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1789.entries OriginalRow227TriangleForward1789.checked
    ⟨i.val, by rw [size1789]; exact i.isLt⟩
  change (entry1789 i).check = true at h
  rcases fields1789 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 159 ≤ d) (hhi : d < 342) :
    forwardStepOK (-768) (charge 159 d) shift (S (d + 1)) (S 160)
      (T 159 (d + 1)) (T 159 d) (T 160 d)
      (OriginalRow227Roots.root_pos 160 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 159 (by decide)) = true := by
  by_cases h255 : d < 255
  ·
    by_cases h191 : d < 191
    ·
      have hi : d - 159 < 32 := by omega
      have heq : 159 + (d - 159) = d := by omega
      simpa only [heq] using step1784 ⟨d - 159, hi⟩
    ·
      by_cases h223 : d < 223
      ·
        have hi : d - 191 < 32 := by omega
        have heq : 191 + (d - 191) = d := by omega
        simpa only [heq] using step1785 ⟨d - 191, hi⟩
      ·
        have hi : d - 223 < 32 := by omega
        have heq : 223 + (d - 223) = d := by omega
        simpa only [heq] using step1786 ⟨d - 223, hi⟩
  ·
    by_cases h287 : d < 287
    ·
      have hi : d - 255 < 32 := by omega
      have heq : 255 + (d - 255) = d := by omega
      simpa only [heq] using step1787 ⟨d - 255, hi⟩
    ·
      by_cases h319 : d < 319
      ·
        have hi : d - 287 < 32 := by omega
        have heq : 287 + (d - 287) = d := by omega
        simpa only [heq] using step1788 ⟨d - 287, hi⟩
      ·
        have hi : d - 319 < 23 := by omega
        have heq : 319 + (d - 319) = d := by omega
        simpa only [heq] using step1789 ⟨d - 319, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow160.fields1784,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow160.step1784,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow160.fields1785,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow160.step1785,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow160.fields1786,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow160.step1786,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow160.fields1787,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow160.step1787,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow160.fields1788,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow160.step1788,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow160.fields1789,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow160.step1789,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow160.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow160
