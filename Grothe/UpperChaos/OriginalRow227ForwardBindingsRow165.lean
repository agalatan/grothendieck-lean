import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow164
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow165
import Grothe.UpperChaos.OriginalRow227TriangleForward1814
import Grothe.UpperChaos.OriginalRow227TriangleForward1815
import Grothe.UpperChaos.OriginalRow227TriangleForward1816
import Grothe.UpperChaos.OriginalRow227TriangleForward1817
import Grothe.UpperChaos.OriginalRow227TriangleForward1818
import Grothe.UpperChaos.OriginalRow227TriangleForward1819

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow165

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1814 : OriginalRow227TriangleForward1814.entries.size = 32 := rfl

def entry1814 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1814.entries[i.val]'(by rw [size1814]; exact i.isLt)

theorem fields1814 (i : Fin 32) :
    (entry1814 i).IA = shift ∧ (entry1814 i).ID = S (164 + i.val + 1) ∧
      (entry1814 i).IC = S 165 ∧ (entry1814 i).Inext = T 164 (164 + i.val + 1) ∧
      (entry1814 i).Icur = T 164 (164 + i.val) ∧
      (entry1814 i).output = T 165 (164 + i.val) ∧
      (entry1814 i).charge = charge 164 (164 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1814 (i : Fin 32) :
    forwardStepOK (-768) (charge 164 (164 + i.val)) shift
      (S (164 + i.val + 1)) (S 165) (T 164 (164 + i.val + 1))
      (T 164 (164 + i.val)) (T 165 (164 + i.val))
      (OriginalRow227Roots.root_pos 165 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 164 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1814.entries OriginalRow227TriangleForward1814.checked
    ⟨i.val, by rw [size1814]; exact i.isLt⟩
  change (entry1814 i).check = true at h
  rcases fields1814 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1815 : OriginalRow227TriangleForward1815.entries.size = 32 := rfl

def entry1815 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1815.entries[i.val]'(by rw [size1815]; exact i.isLt)

theorem fields1815 (i : Fin 32) :
    (entry1815 i).IA = shift ∧ (entry1815 i).ID = S (196 + i.val + 1) ∧
      (entry1815 i).IC = S 165 ∧ (entry1815 i).Inext = T 164 (196 + i.val + 1) ∧
      (entry1815 i).Icur = T 164 (196 + i.val) ∧
      (entry1815 i).output = T 165 (196 + i.val) ∧
      (entry1815 i).charge = charge 164 (196 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1815 (i : Fin 32) :
    forwardStepOK (-768) (charge 164 (196 + i.val)) shift
      (S (196 + i.val + 1)) (S 165) (T 164 (196 + i.val + 1))
      (T 164 (196 + i.val)) (T 165 (196 + i.val))
      (OriginalRow227Roots.root_pos 165 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 164 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1815.entries OriginalRow227TriangleForward1815.checked
    ⟨i.val, by rw [size1815]; exact i.isLt⟩
  change (entry1815 i).check = true at h
  rcases fields1815 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1816 : OriginalRow227TriangleForward1816.entries.size = 32 := rfl

def entry1816 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1816.entries[i.val]'(by rw [size1816]; exact i.isLt)

theorem fields1816 (i : Fin 32) :
    (entry1816 i).IA = shift ∧ (entry1816 i).ID = S (228 + i.val + 1) ∧
      (entry1816 i).IC = S 165 ∧ (entry1816 i).Inext = T 164 (228 + i.val + 1) ∧
      (entry1816 i).Icur = T 164 (228 + i.val) ∧
      (entry1816 i).output = T 165 (228 + i.val) ∧
      (entry1816 i).charge = charge 164 (228 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1816 (i : Fin 32) :
    forwardStepOK (-768) (charge 164 (228 + i.val)) shift
      (S (228 + i.val + 1)) (S 165) (T 164 (228 + i.val + 1))
      (T 164 (228 + i.val)) (T 165 (228 + i.val))
      (OriginalRow227Roots.root_pos 165 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 164 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1816.entries OriginalRow227TriangleForward1816.checked
    ⟨i.val, by rw [size1816]; exact i.isLt⟩
  change (entry1816 i).check = true at h
  rcases fields1816 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1817 : OriginalRow227TriangleForward1817.entries.size = 32 := rfl

def entry1817 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1817.entries[i.val]'(by rw [size1817]; exact i.isLt)

theorem fields1817 (i : Fin 32) :
    (entry1817 i).IA = shift ∧ (entry1817 i).ID = S (260 + i.val + 1) ∧
      (entry1817 i).IC = S 165 ∧ (entry1817 i).Inext = T 164 (260 + i.val + 1) ∧
      (entry1817 i).Icur = T 164 (260 + i.val) ∧
      (entry1817 i).output = T 165 (260 + i.val) ∧
      (entry1817 i).charge = charge 164 (260 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1817 (i : Fin 32) :
    forwardStepOK (-768) (charge 164 (260 + i.val)) shift
      (S (260 + i.val + 1)) (S 165) (T 164 (260 + i.val + 1))
      (T 164 (260 + i.val)) (T 165 (260 + i.val))
      (OriginalRow227Roots.root_pos 165 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 164 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1817.entries OriginalRow227TriangleForward1817.checked
    ⟨i.val, by rw [size1817]; exact i.isLt⟩
  change (entry1817 i).check = true at h
  rcases fields1817 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1818 : OriginalRow227TriangleForward1818.entries.size = 32 := rfl

def entry1818 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1818.entries[i.val]'(by rw [size1818]; exact i.isLt)

theorem fields1818 (i : Fin 32) :
    (entry1818 i).IA = shift ∧ (entry1818 i).ID = S (292 + i.val + 1) ∧
      (entry1818 i).IC = S 165 ∧ (entry1818 i).Inext = T 164 (292 + i.val + 1) ∧
      (entry1818 i).Icur = T 164 (292 + i.val) ∧
      (entry1818 i).output = T 165 (292 + i.val) ∧
      (entry1818 i).charge = charge 164 (292 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1818 (i : Fin 32) :
    forwardStepOK (-768) (charge 164 (292 + i.val)) shift
      (S (292 + i.val + 1)) (S 165) (T 164 (292 + i.val + 1))
      (T 164 (292 + i.val)) (T 165 (292 + i.val))
      (OriginalRow227Roots.root_pos 165 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 164 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1818.entries OriginalRow227TriangleForward1818.checked
    ⟨i.val, by rw [size1818]; exact i.isLt⟩
  change (entry1818 i).check = true at h
  rcases fields1818 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1819 : OriginalRow227TriangleForward1819.entries.size = 13 := rfl

def entry1819 (i : Fin 13) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1819.entries[i.val]'(by rw [size1819]; exact i.isLt)

theorem fields1819 (i : Fin 13) :
    (entry1819 i).IA = shift ∧ (entry1819 i).ID = S (324 + i.val + 1) ∧
      (entry1819 i).IC = S 165 ∧ (entry1819 i).Inext = T 164 (324 + i.val + 1) ∧
      (entry1819 i).Icur = T 164 (324 + i.val) ∧
      (entry1819 i).output = T 165 (324 + i.val) ∧
      (entry1819 i).charge = charge 164 (324 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings05.S_eq_root165).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨12, by decide⟩).symm, rfl⟩

theorem step1819 (i : Fin 13) :
    forwardStepOK (-768) (charge 164 (324 + i.val)) shift
      (S (324 + i.val + 1)) (S 165) (T 164 (324 + i.val + 1))
      (T 164 (324 + i.val)) (T 165 (324 + i.val))
      (OriginalRow227Roots.root_pos 165 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 164 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1819.entries OriginalRow227TriangleForward1819.checked
    ⟨i.val, by rw [size1819]; exact i.isLt⟩
  change (entry1819 i).check = true at h
  rcases fields1819 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 164 ≤ d) (hhi : d < 337) :
    forwardStepOK (-768) (charge 164 d) shift (S (d + 1)) (S 165)
      (T 164 (d + 1)) (T 164 d) (T 165 d)
      (OriginalRow227Roots.root_pos 165 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 164 (by decide)) = true := by
  by_cases h260 : d < 260
  ·
    by_cases h196 : d < 196
    ·
      have hi : d - 164 < 32 := by omega
      have heq : 164 + (d - 164) = d := by omega
      simpa only [heq] using step1814 ⟨d - 164, hi⟩
    ·
      by_cases h228 : d < 228
      ·
        have hi : d - 196 < 32 := by omega
        have heq : 196 + (d - 196) = d := by omega
        simpa only [heq] using step1815 ⟨d - 196, hi⟩
      ·
        have hi : d - 228 < 32 := by omega
        have heq : 228 + (d - 228) = d := by omega
        simpa only [heq] using step1816 ⟨d - 228, hi⟩
  ·
    by_cases h292 : d < 292
    ·
      have hi : d - 260 < 32 := by omega
      have heq : 260 + (d - 260) = d := by omega
      simpa only [heq] using step1817 ⟨d - 260, hi⟩
    ·
      by_cases h324 : d < 324
      ·
        have hi : d - 292 < 32 := by omega
        have heq : 292 + (d - 292) = d := by omega
        simpa only [heq] using step1818 ⟨d - 292, hi⟩
      ·
        have hi : d - 324 < 13 := by omega
        have heq : 324 + (d - 324) = d := by omega
        simpa only [heq] using step1819 ⟨d - 324, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow165.fields1814,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow165.step1814,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow165.fields1815,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow165.step1815,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow165.fields1816,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow165.step1816,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow165.fields1817,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow165.step1817,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow165.fields1818,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow165.step1818,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow165.fields1819,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow165.step1819,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow165.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow165
