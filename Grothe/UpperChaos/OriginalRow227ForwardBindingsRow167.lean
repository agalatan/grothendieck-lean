import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow166
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow167
import Grothe.UpperChaos.OriginalRow227TriangleForward1826
import Grothe.UpperChaos.OriginalRow227TriangleForward1827
import Grothe.UpperChaos.OriginalRow227TriangleForward1828
import Grothe.UpperChaos.OriginalRow227TriangleForward1829
import Grothe.UpperChaos.OriginalRow227TriangleForward1830
import Grothe.UpperChaos.OriginalRow227TriangleForward1831

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow167

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1826 : OriginalRow227TriangleForward1826.entries.size = 32 := rfl

def entry1826 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1826.entries[i.val]'(by rw [size1826]; exact i.isLt)

theorem fields1826 (i : Fin 32) :
    (entry1826 i).IA = shift ∧ (entry1826 i).ID = S (166 + i.val + 1) ∧
      (entry1826 i).IC = S 167 ∧ (entry1826 i).Inext = T 166 (166 + i.val + 1) ∧
      (entry1826 i).Icur = T 166 (166 + i.val) ∧
      (entry1826 i).output = T 167 (166 + i.val) ∧
      (entry1826 i).charge = charge 166 (166 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1826 (i : Fin 32) :
    forwardStepOK (-768) (charge 166 (166 + i.val)) shift
      (S (166 + i.val + 1)) (S 167) (T 166 (166 + i.val + 1))
      (T 166 (166 + i.val)) (T 167 (166 + i.val))
      (OriginalRow227Roots.root_pos 167 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 166 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1826.entries OriginalRow227TriangleForward1826.checked
    ⟨i.val, by rw [size1826]; exact i.isLt⟩
  change (entry1826 i).check = true at h
  rcases fields1826 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1827 : OriginalRow227TriangleForward1827.entries.size = 32 := rfl

def entry1827 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1827.entries[i.val]'(by rw [size1827]; exact i.isLt)

theorem fields1827 (i : Fin 32) :
    (entry1827 i).IA = shift ∧ (entry1827 i).ID = S (198 + i.val + 1) ∧
      (entry1827 i).IC = S 167 ∧ (entry1827 i).Inext = T 166 (198 + i.val + 1) ∧
      (entry1827 i).Icur = T 166 (198 + i.val) ∧
      (entry1827 i).output = T 167 (198 + i.val) ∧
      (entry1827 i).charge = charge 166 (198 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1827 (i : Fin 32) :
    forwardStepOK (-768) (charge 166 (198 + i.val)) shift
      (S (198 + i.val + 1)) (S 167) (T 166 (198 + i.val + 1))
      (T 166 (198 + i.val)) (T 167 (198 + i.val))
      (OriginalRow227Roots.root_pos 167 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 166 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1827.entries OriginalRow227TriangleForward1827.checked
    ⟨i.val, by rw [size1827]; exact i.isLt⟩
  change (entry1827 i).check = true at h
  rcases fields1827 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1828 : OriginalRow227TriangleForward1828.entries.size = 32 := rfl

def entry1828 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1828.entries[i.val]'(by rw [size1828]; exact i.isLt)

theorem fields1828 (i : Fin 32) :
    (entry1828 i).IA = shift ∧ (entry1828 i).ID = S (230 + i.val + 1) ∧
      (entry1828 i).IC = S 167 ∧ (entry1828 i).Inext = T 166 (230 + i.val + 1) ∧
      (entry1828 i).Icur = T 166 (230 + i.val) ∧
      (entry1828 i).output = T 167 (230 + i.val) ∧
      (entry1828 i).charge = charge 166 (230 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1828 (i : Fin 32) :
    forwardStepOK (-768) (charge 166 (230 + i.val)) shift
      (S (230 + i.val + 1)) (S 167) (T 166 (230 + i.val + 1))
      (T 166 (230 + i.val)) (T 167 (230 + i.val))
      (OriginalRow227Roots.root_pos 167 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 166 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1828.entries OriginalRow227TriangleForward1828.checked
    ⟨i.val, by rw [size1828]; exact i.isLt⟩
  change (entry1828 i).check = true at h
  rcases fields1828 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1829 : OriginalRow227TriangleForward1829.entries.size = 32 := rfl

def entry1829 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1829.entries[i.val]'(by rw [size1829]; exact i.isLt)

theorem fields1829 (i : Fin 32) :
    (entry1829 i).IA = shift ∧ (entry1829 i).ID = S (262 + i.val + 1) ∧
      (entry1829 i).IC = S 167 ∧ (entry1829 i).Inext = T 166 (262 + i.val + 1) ∧
      (entry1829 i).Icur = T 166 (262 + i.val) ∧
      (entry1829 i).output = T 167 (262 + i.val) ∧
      (entry1829 i).charge = charge 166 (262 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1829 (i : Fin 32) :
    forwardStepOK (-768) (charge 166 (262 + i.val)) shift
      (S (262 + i.val + 1)) (S 167) (T 166 (262 + i.val + 1))
      (T 166 (262 + i.val)) (T 167 (262 + i.val))
      (OriginalRow227Roots.root_pos 167 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 166 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1829.entries OriginalRow227TriangleForward1829.checked
    ⟨i.val, by rw [size1829]; exact i.isLt⟩
  change (entry1829 i).check = true at h
  rcases fields1829 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1830 : OriginalRow227TriangleForward1830.entries.size = 32 := rfl

def entry1830 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1830.entries[i.val]'(by rw [size1830]; exact i.isLt)

theorem fields1830 (i : Fin 32) :
    (entry1830 i).IA = shift ∧ (entry1830 i).ID = S (294 + i.val + 1) ∧
      (entry1830 i).IC = S 167 ∧ (entry1830 i).Inext = T 166 (294 + i.val + 1) ∧
      (entry1830 i).Icur = T 166 (294 + i.val) ∧
      (entry1830 i).output = T 167 (294 + i.val) ∧
      (entry1830 i).charge = charge 166 (294 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1830 (i : Fin 32) :
    forwardStepOK (-768) (charge 166 (294 + i.val)) shift
      (S (294 + i.val + 1)) (S 167) (T 166 (294 + i.val + 1))
      (T 166 (294 + i.val)) (T 167 (294 + i.val))
      (OriginalRow227Roots.root_pos 167 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 166 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1830.entries OriginalRow227TriangleForward1830.checked
    ⟨i.val, by rw [size1830]; exact i.isLt⟩
  change (entry1830 i).check = true at h
  rcases fields1830 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1831 : OriginalRow227TriangleForward1831.entries.size = 9 := rfl

def entry1831 (i : Fin 9) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1831.entries[i.val]'(by rw [size1831]; exact i.isLt)

theorem fields1831 (i : Fin 9) :
    (entry1831 i).IA = shift ∧ (entry1831 i).ID = S (326 + i.val + 1) ∧
      (entry1831 i).IC = S 167 ∧ (entry1831 i).Inext = T 166 (326 + i.val + 1) ∧
      (entry1831 i).Icur = T 166 (326 + i.val) ∧
      (entry1831 i).output = T 167 (326 + i.val) ∧
      (entry1831 i).charge = charge 166 (326 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings05.S_eq_root167).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨8, by decide⟩).symm, rfl⟩

theorem step1831 (i : Fin 9) :
    forwardStepOK (-768) (charge 166 (326 + i.val)) shift
      (S (326 + i.val + 1)) (S 167) (T 166 (326 + i.val + 1))
      (T 166 (326 + i.val)) (T 167 (326 + i.val))
      (OriginalRow227Roots.root_pos 167 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 166 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1831.entries OriginalRow227TriangleForward1831.checked
    ⟨i.val, by rw [size1831]; exact i.isLt⟩
  change (entry1831 i).check = true at h
  rcases fields1831 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 166 ≤ d) (hhi : d < 335) :
    forwardStepOK (-768) (charge 166 d) shift (S (d + 1)) (S 167)
      (T 166 (d + 1)) (T 166 d) (T 167 d)
      (OriginalRow227Roots.root_pos 167 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 166 (by decide)) = true := by
  by_cases h262 : d < 262
  ·
    by_cases h198 : d < 198
    ·
      have hi : d - 166 < 32 := by omega
      have heq : 166 + (d - 166) = d := by omega
      simpa only [heq] using step1826 ⟨d - 166, hi⟩
    ·
      by_cases h230 : d < 230
      ·
        have hi : d - 198 < 32 := by omega
        have heq : 198 + (d - 198) = d := by omega
        simpa only [heq] using step1827 ⟨d - 198, hi⟩
      ·
        have hi : d - 230 < 32 := by omega
        have heq : 230 + (d - 230) = d := by omega
        simpa only [heq] using step1828 ⟨d - 230, hi⟩
  ·
    by_cases h294 : d < 294
    ·
      have hi : d - 262 < 32 := by omega
      have heq : 262 + (d - 262) = d := by omega
      simpa only [heq] using step1829 ⟨d - 262, hi⟩
    ·
      by_cases h326 : d < 326
      ·
        have hi : d - 294 < 32 := by omega
        have heq : 294 + (d - 294) = d := by omega
        simpa only [heq] using step1830 ⟨d - 294, hi⟩
      ·
        have hi : d - 326 < 9 := by omega
        have heq : 326 + (d - 326) = d := by omega
        simpa only [heq] using step1831 ⟨d - 326, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow167.fields1826,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow167.step1826,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow167.fields1827,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow167.step1827,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow167.fields1828,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow167.step1828,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow167.fields1829,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow167.step1829,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow167.fields1830,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow167.step1830,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow167.fields1831,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow167.step1831,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow167.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow167
