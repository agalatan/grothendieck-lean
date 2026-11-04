import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow157
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow158
import Grothe.UpperChaos.OriginalRow227TriangleForward1772
import Grothe.UpperChaos.OriginalRow227TriangleForward1773
import Grothe.UpperChaos.OriginalRow227TriangleForward1774
import Grothe.UpperChaos.OriginalRow227TriangleForward1775
import Grothe.UpperChaos.OriginalRow227TriangleForward1776
import Grothe.UpperChaos.OriginalRow227TriangleForward1777

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow158

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1772 : OriginalRow227TriangleForward1772.entries.size = 32 := rfl

def entry1772 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1772.entries[i.val]'(by rw [size1772]; exact i.isLt)

theorem fields1772 (i : Fin 32) :
    (entry1772 i).IA = shift ∧ (entry1772 i).ID = S (157 + i.val + 1) ∧
      (entry1772 i).IC = S 158 ∧ (entry1772 i).Inext = T 157 (157 + i.val + 1) ∧
      (entry1772 i).Icur = T 157 (157 + i.val) ∧
      (entry1772 i).output = T 158 (157 + i.val) ∧
      (entry1772 i).charge = charge 157 (157 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1788_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1772 (i : Fin 32) :
    forwardStepOK (-768) (charge 157 (157 + i.val)) shift
      (S (157 + i.val + 1)) (S 158) (T 157 (157 + i.val + 1))
      (T 157 (157 + i.val)) (T 158 (157 + i.val))
      (OriginalRow227Roots.root_pos 158 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 157 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1772.entries OriginalRow227TriangleForward1772.checked
    ⟨i.val, by rw [size1772]; exact i.isLt⟩
  change (entry1772 i).check = true at h
  rcases fields1772 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1773 : OriginalRow227TriangleForward1773.entries.size = 32 := rfl

def entry1773 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1773.entries[i.val]'(by rw [size1773]; exact i.isLt)

theorem fields1773 (i : Fin 32) :
    (entry1773 i).IA = shift ∧ (entry1773 i).ID = S (189 + i.val + 1) ∧
      (entry1773 i).IC = S 158 ∧ (entry1773 i).Inext = T 157 (189 + i.val + 1) ∧
      (entry1773 i).Icur = T 157 (189 + i.val) ∧
      (entry1773 i).output = T 158 (189 + i.val) ∧
      (entry1773 i).charge = charge 157 (189 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1789_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1773 (i : Fin 32) :
    forwardStepOK (-768) (charge 157 (189 + i.val)) shift
      (S (189 + i.val + 1)) (S 158) (T 157 (189 + i.val + 1))
      (T 157 (189 + i.val)) (T 158 (189 + i.val))
      (OriginalRow227Roots.root_pos 158 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 157 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1773.entries OriginalRow227TriangleForward1773.checked
    ⟨i.val, by rw [size1773]; exact i.isLt⟩
  change (entry1773 i).check = true at h
  rcases fields1773 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1774 : OriginalRow227TriangleForward1774.entries.size = 32 := rfl

def entry1774 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1774.entries[i.val]'(by rw [size1774]; exact i.isLt)

theorem fields1774 (i : Fin 32) :
    (entry1774 i).IA = shift ∧ (entry1774 i).ID = S (221 + i.val + 1) ∧
      (entry1774 i).IC = S 158 ∧ (entry1774 i).Inext = T 157 (221 + i.val + 1) ∧
      (entry1774 i).Icur = T 157 (221 + i.val) ∧
      (entry1774 i).output = T 158 (221 + i.val) ∧
      (entry1774 i).charge = charge 157 (221 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1790_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1774 (i : Fin 32) :
    forwardStepOK (-768) (charge 157 (221 + i.val)) shift
      (S (221 + i.val + 1)) (S 158) (T 157 (221 + i.val + 1))
      (T 157 (221 + i.val)) (T 158 (221 + i.val))
      (OriginalRow227Roots.root_pos 158 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 157 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1774.entries OriginalRow227TriangleForward1774.checked
    ⟨i.val, by rw [size1774]; exact i.isLt⟩
  change (entry1774 i).check = true at h
  rcases fields1774 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1775 : OriginalRow227TriangleForward1775.entries.size = 32 := rfl

def entry1775 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1775.entries[i.val]'(by rw [size1775]; exact i.isLt)

theorem fields1775 (i : Fin 32) :
    (entry1775 i).IA = shift ∧ (entry1775 i).ID = S (253 + i.val + 1) ∧
      (entry1775 i).IC = S 158 ∧ (entry1775 i).Inext = T 157 (253 + i.val + 1) ∧
      (entry1775 i).Icur = T 157 (253 + i.val) ∧
      (entry1775 i).output = T 158 (253 + i.val) ∧
      (entry1775 i).charge = charge 157 (253 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1791_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1775 (i : Fin 32) :
    forwardStepOK (-768) (charge 157 (253 + i.val)) shift
      (S (253 + i.val + 1)) (S 158) (T 157 (253 + i.val + 1))
      (T 157 (253 + i.val)) (T 158 (253 + i.val))
      (OriginalRow227Roots.root_pos 158 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 157 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1775.entries OriginalRow227TriangleForward1775.checked
    ⟨i.val, by rw [size1775]; exact i.isLt⟩
  change (entry1775 i).check = true at h
  rcases fields1775 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1776 : OriginalRow227TriangleForward1776.entries.size = 32 := rfl

def entry1776 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1776.entries[i.val]'(by rw [size1776]; exact i.isLt)

theorem fields1776 (i : Fin 32) :
    (entry1776 i).IA = shift ∧ (entry1776 i).ID = S (285 + i.val + 1) ∧
      (entry1776 i).IC = S 158 ∧ (entry1776 i).Inext = T 157 (285 + i.val + 1) ∧
      (entry1776 i).Icur = T 157 (285 + i.val) ∧
      (entry1776 i).output = T 158 (285 + i.val) ∧
      (entry1776 i).charge = charge 157 (285 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1792_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1776 (i : Fin 32) :
    forwardStepOK (-768) (charge 157 (285 + i.val)) shift
      (S (285 + i.val + 1)) (S 158) (T 157 (285 + i.val + 1))
      (T 157 (285 + i.val)) (T 158 (285 + i.val))
      (OriginalRow227Roots.root_pos 158 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 157 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1776.entries OriginalRow227TriangleForward1776.checked
    ⟨i.val, by rw [size1776]; exact i.isLt⟩
  change (entry1776 i).check = true at h
  rcases fields1776 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1777 : OriginalRow227TriangleForward1777.entries.size = 27 := rfl

def entry1777 (i : Fin 27) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1777.entries[i.val]'(by rw [size1777]; exact i.isLt)

theorem fields1777 (i : Fin 27) :
    (entry1777 i).IA = shift ∧ (entry1777 i).ID = S (317 + i.val + 1) ∧
      (entry1777 i).IC = S 158 ∧ (entry1777 i).Inext = T 157 (317 + i.val + 1) ∧
      (entry1777 i).Icur = T 157 (317 + i.val) ∧
      (entry1777 i).output = T 158 (317 + i.val) ∧
      (entry1777 i).charge = charge 157 (317 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root158).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow158.block1793_value ⟨26, by decide⟩).symm, rfl⟩

theorem step1777 (i : Fin 27) :
    forwardStepOK (-768) (charge 157 (317 + i.val)) shift
      (S (317 + i.val + 1)) (S 158) (T 157 (317 + i.val + 1))
      (T 157 (317 + i.val)) (T 158 (317 + i.val))
      (OriginalRow227Roots.root_pos 158 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 157 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1777.entries OriginalRow227TriangleForward1777.checked
    ⟨i.val, by rw [size1777]; exact i.isLt⟩
  change (entry1777 i).check = true at h
  rcases fields1777 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 157 ≤ d) (hhi : d < 344) :
    forwardStepOK (-768) (charge 157 d) shift (S (d + 1)) (S 158)
      (T 157 (d + 1)) (T 157 d) (T 158 d)
      (OriginalRow227Roots.root_pos 158 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 157 (by decide)) = true := by
  by_cases h253 : d < 253
  ·
    by_cases h189 : d < 189
    ·
      have hi : d - 157 < 32 := by omega
      have heq : 157 + (d - 157) = d := by omega
      simpa only [heq] using step1772 ⟨d - 157, hi⟩
    ·
      by_cases h221 : d < 221
      ·
        have hi : d - 189 < 32 := by omega
        have heq : 189 + (d - 189) = d := by omega
        simpa only [heq] using step1773 ⟨d - 189, hi⟩
      ·
        have hi : d - 221 < 32 := by omega
        have heq : 221 + (d - 221) = d := by omega
        simpa only [heq] using step1774 ⟨d - 221, hi⟩
  ·
    by_cases h285 : d < 285
    ·
      have hi : d - 253 < 32 := by omega
      have heq : 253 + (d - 253) = d := by omega
      simpa only [heq] using step1775 ⟨d - 253, hi⟩
    ·
      by_cases h317 : d < 317
      ·
        have hi : d - 285 < 32 := by omega
        have heq : 285 + (d - 285) = d := by omega
        simpa only [heq] using step1776 ⟨d - 285, hi⟩
      ·
        have hi : d - 317 < 27 := by omega
        have heq : 317 + (d - 317) = d := by omega
        simpa only [heq] using step1777 ⟨d - 317, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow158.fields1772,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow158.step1772,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow158.fields1773,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow158.step1773,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow158.fields1774,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow158.step1774,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow158.fields1775,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow158.step1775,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow158.fields1776,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow158.step1776,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow158.fields1777,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow158.step1777,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow158.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow158
