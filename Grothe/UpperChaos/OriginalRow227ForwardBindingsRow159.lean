import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow158
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow159
import Grothe.UpperChaos.OriginalRow227TriangleForward1778
import Grothe.UpperChaos.OriginalRow227TriangleForward1779
import Grothe.UpperChaos.OriginalRow227TriangleForward1780
import Grothe.UpperChaos.OriginalRow227TriangleForward1781
import Grothe.UpperChaos.OriginalRow227TriangleForward1782
import Grothe.UpperChaos.OriginalRow227TriangleForward1783

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow159

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1778 : OriginalRow227TriangleForward1778.entries.size = 32 := rfl

def entry1778 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1778.entries[i.val]'(by rw [size1778]; exact i.isLt)

theorem fields1778 (i : Fin 32) :
    (entry1778 i).IA = shift ∧ (entry1778 i).ID = S (158 + i.val + 1) ∧
      (entry1778 i).IC = S 159 ∧ (entry1778 i).Inext = T 158 (158 + i.val + 1) ∧
      (entry1778 i).Icur = T 158 (158 + i.val) ∧
      (entry1778 i).output = T 159 (158 + i.val) ∧
      (entry1778 i).charge = charge 158 (158 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1794_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1778 (i : Fin 32) :
    forwardStepOK (-768) (charge 158 (158 + i.val)) shift
      (S (158 + i.val + 1)) (S 159) (T 158 (158 + i.val + 1))
      (T 158 (158 + i.val)) (T 159 (158 + i.val))
      (OriginalRow227Roots.root_pos 159 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 158 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1778.entries OriginalRow227TriangleForward1778.checked
    ⟨i.val, by rw [size1778]; exact i.isLt⟩
  change (entry1778 i).check = true at h
  rcases fields1778 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1779 : OriginalRow227TriangleForward1779.entries.size = 32 := rfl

def entry1779 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1779.entries[i.val]'(by rw [size1779]; exact i.isLt)

theorem fields1779 (i : Fin 32) :
    (entry1779 i).IA = shift ∧ (entry1779 i).ID = S (190 + i.val + 1) ∧
      (entry1779 i).IC = S 159 ∧ (entry1779 i).Inext = T 158 (190 + i.val + 1) ∧
      (entry1779 i).Icur = T 158 (190 + i.val) ∧
      (entry1779 i).output = T 159 (190 + i.val) ∧
      (entry1779 i).charge = charge 158 (190 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1795_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1779 (i : Fin 32) :
    forwardStepOK (-768) (charge 158 (190 + i.val)) shift
      (S (190 + i.val + 1)) (S 159) (T 158 (190 + i.val + 1))
      (T 158 (190 + i.val)) (T 159 (190 + i.val))
      (OriginalRow227Roots.root_pos 159 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 158 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1779.entries OriginalRow227TriangleForward1779.checked
    ⟨i.val, by rw [size1779]; exact i.isLt⟩
  change (entry1779 i).check = true at h
  rcases fields1779 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1780 : OriginalRow227TriangleForward1780.entries.size = 32 := rfl

def entry1780 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1780.entries[i.val]'(by rw [size1780]; exact i.isLt)

theorem fields1780 (i : Fin 32) :
    (entry1780 i).IA = shift ∧ (entry1780 i).ID = S (222 + i.val + 1) ∧
      (entry1780 i).IC = S 159 ∧ (entry1780 i).Inext = T 158 (222 + i.val + 1) ∧
      (entry1780 i).Icur = T 158 (222 + i.val) ∧
      (entry1780 i).output = T 159 (222 + i.val) ∧
      (entry1780 i).charge = charge 158 (222 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1796_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1780 (i : Fin 32) :
    forwardStepOK (-768) (charge 158 (222 + i.val)) shift
      (S (222 + i.val + 1)) (S 159) (T 158 (222 + i.val + 1))
      (T 158 (222 + i.val)) (T 159 (222 + i.val))
      (OriginalRow227Roots.root_pos 159 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 158 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1780.entries OriginalRow227TriangleForward1780.checked
    ⟨i.val, by rw [size1780]; exact i.isLt⟩
  change (entry1780 i).check = true at h
  rcases fields1780 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1781 : OriginalRow227TriangleForward1781.entries.size = 32 := rfl

def entry1781 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1781.entries[i.val]'(by rw [size1781]; exact i.isLt)

theorem fields1781 (i : Fin 32) :
    (entry1781 i).IA = shift ∧ (entry1781 i).ID = S (254 + i.val + 1) ∧
      (entry1781 i).IC = S 159 ∧ (entry1781 i).Inext = T 158 (254 + i.val + 1) ∧
      (entry1781 i).Icur = T 158 (254 + i.val) ∧
      (entry1781 i).output = T 159 (254 + i.val) ∧
      (entry1781 i).charge = charge 158 (254 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1797_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1781 (i : Fin 32) :
    forwardStepOK (-768) (charge 158 (254 + i.val)) shift
      (S (254 + i.val + 1)) (S 159) (T 158 (254 + i.val + 1))
      (T 158 (254 + i.val)) (T 159 (254 + i.val))
      (OriginalRow227Roots.root_pos 159 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 158 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1781.entries OriginalRow227TriangleForward1781.checked
    ⟨i.val, by rw [size1781]; exact i.isLt⟩
  change (entry1781 i).check = true at h
  rcases fields1781 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1782 : OriginalRow227TriangleForward1782.entries.size = 32 := rfl

def entry1782 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1782.entries[i.val]'(by rw [size1782]; exact i.isLt)

theorem fields1782 (i : Fin 32) :
    (entry1782 i).IA = shift ∧ (entry1782 i).ID = S (286 + i.val + 1) ∧
      (entry1782 i).IC = S 159 ∧ (entry1782 i).Inext = T 158 (286 + i.val + 1) ∧
      (entry1782 i).Icur = T 158 (286 + i.val) ∧
      (entry1782 i).output = T 159 (286 + i.val) ∧
      (entry1782 i).charge = charge 158 (286 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1798_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1782 (i : Fin 32) :
    forwardStepOK (-768) (charge 158 (286 + i.val)) shift
      (S (286 + i.val + 1)) (S 159) (T 158 (286 + i.val + 1))
      (T 158 (286 + i.val)) (T 159 (286 + i.val))
      (OriginalRow227Roots.root_pos 159 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 158 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1782.entries OriginalRow227TriangleForward1782.checked
    ⟨i.val, by rw [size1782]; exact i.isLt⟩
  change (entry1782 i).check = true at h
  rcases fields1782 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1783 : OriginalRow227TriangleForward1783.entries.size = 25 := rfl

def entry1783 (i : Fin 25) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1783.entries[i.val]'(by rw [size1783]; exact i.isLt)

theorem fields1783 (i : Fin 25) :
    (entry1783 i).IA = shift ∧ (entry1783 i).ID = S (318 + i.val + 1) ∧
      (entry1783 i).IC = S 159 ∧ (entry1783 i).Inext = T 158 (318 + i.val + 1) ∧
      (entry1783 i).Icur = T 158 (318 + i.val) ∧
      (entry1783 i).output = T 159 (318 + i.val) ∧
      (entry1783 i).charge = charge 158 (318 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root159).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow159.block1799_value ⟨24, by decide⟩).symm, rfl⟩

theorem step1783 (i : Fin 25) :
    forwardStepOK (-768) (charge 158 (318 + i.val)) shift
      (S (318 + i.val + 1)) (S 159) (T 158 (318 + i.val + 1))
      (T 158 (318 + i.val)) (T 159 (318 + i.val))
      (OriginalRow227Roots.root_pos 159 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 158 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1783.entries OriginalRow227TriangleForward1783.checked
    ⟨i.val, by rw [size1783]; exact i.isLt⟩
  change (entry1783 i).check = true at h
  rcases fields1783 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 158 ≤ d) (hhi : d < 343) :
    forwardStepOK (-768) (charge 158 d) shift (S (d + 1)) (S 159)
      (T 158 (d + 1)) (T 158 d) (T 159 d)
      (OriginalRow227Roots.root_pos 159 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 158 (by decide)) = true := by
  by_cases h254 : d < 254
  ·
    by_cases h190 : d < 190
    ·
      have hi : d - 158 < 32 := by omega
      have heq : 158 + (d - 158) = d := by omega
      simpa only [heq] using step1778 ⟨d - 158, hi⟩
    ·
      by_cases h222 : d < 222
      ·
        have hi : d - 190 < 32 := by omega
        have heq : 190 + (d - 190) = d := by omega
        simpa only [heq] using step1779 ⟨d - 190, hi⟩
      ·
        have hi : d - 222 < 32 := by omega
        have heq : 222 + (d - 222) = d := by omega
        simpa only [heq] using step1780 ⟨d - 222, hi⟩
  ·
    by_cases h286 : d < 286
    ·
      have hi : d - 254 < 32 := by omega
      have heq : 254 + (d - 254) = d := by omega
      simpa only [heq] using step1781 ⟨d - 254, hi⟩
    ·
      by_cases h318 : d < 318
      ·
        have hi : d - 286 < 32 := by omega
        have heq : 286 + (d - 286) = d := by omega
        simpa only [heq] using step1782 ⟨d - 286, hi⟩
      ·
        have hi : d - 318 < 25 := by omega
        have heq : 318 + (d - 318) = d := by omega
        simpa only [heq] using step1783 ⟨d - 318, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow159.fields1778,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow159.step1778,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow159.fields1779,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow159.step1779,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow159.fields1780,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow159.step1780,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow159.fields1781,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow159.step1781,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow159.fields1782,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow159.step1782,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow159.fields1783,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow159.step1783,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow159.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow159
