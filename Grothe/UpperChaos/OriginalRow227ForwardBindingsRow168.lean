import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow167
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow168
import Grothe.UpperChaos.OriginalRow227TriangleForward1832
import Grothe.UpperChaos.OriginalRow227TriangleForward1833
import Grothe.UpperChaos.OriginalRow227TriangleForward1834
import Grothe.UpperChaos.OriginalRow227TriangleForward1835
import Grothe.UpperChaos.OriginalRow227TriangleForward1836
import Grothe.UpperChaos.OriginalRow227TriangleForward1837

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow168

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1832 : OriginalRow227TriangleForward1832.entries.size = 32 := rfl

def entry1832 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1832.entries[i.val]'(by rw [size1832]; exact i.isLt)

theorem fields1832 (i : Fin 32) :
    (entry1832 i).IA = shift ∧ (entry1832 i).ID = S (167 + i.val + 1) ∧
      (entry1832 i).IC = S 168 ∧ (entry1832 i).Inext = T 167 (167 + i.val + 1) ∧
      (entry1832 i).Icur = T 167 (167 + i.val) ∧
      (entry1832 i).output = T 168 (167 + i.val) ∧
      (entry1832 i).charge = charge 167 (167 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1842_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1832 (i : Fin 32) :
    forwardStepOK (-768) (charge 167 (167 + i.val)) shift
      (S (167 + i.val + 1)) (S 168) (T 167 (167 + i.val + 1))
      (T 167 (167 + i.val)) (T 168 (167 + i.val))
      (OriginalRow227Roots.root_pos 168 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 167 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1832.entries OriginalRow227TriangleForward1832.checked
    ⟨i.val, by rw [size1832]; exact i.isLt⟩
  change (entry1832 i).check = true at h
  rcases fields1832 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1833 : OriginalRow227TriangleForward1833.entries.size = 32 := rfl

def entry1833 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1833.entries[i.val]'(by rw [size1833]; exact i.isLt)

theorem fields1833 (i : Fin 32) :
    (entry1833 i).IA = shift ∧ (entry1833 i).ID = S (199 + i.val + 1) ∧
      (entry1833 i).IC = S 168 ∧ (entry1833 i).Inext = T 167 (199 + i.val + 1) ∧
      (entry1833 i).Icur = T 167 (199 + i.val) ∧
      (entry1833 i).output = T 168 (199 + i.val) ∧
      (entry1833 i).charge = charge 167 (199 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1843_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1833 (i : Fin 32) :
    forwardStepOK (-768) (charge 167 (199 + i.val)) shift
      (S (199 + i.val + 1)) (S 168) (T 167 (199 + i.val + 1))
      (T 167 (199 + i.val)) (T 168 (199 + i.val))
      (OriginalRow227Roots.root_pos 168 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 167 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1833.entries OriginalRow227TriangleForward1833.checked
    ⟨i.val, by rw [size1833]; exact i.isLt⟩
  change (entry1833 i).check = true at h
  rcases fields1833 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1834 : OriginalRow227TriangleForward1834.entries.size = 32 := rfl

def entry1834 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1834.entries[i.val]'(by rw [size1834]; exact i.isLt)

theorem fields1834 (i : Fin 32) :
    (entry1834 i).IA = shift ∧ (entry1834 i).ID = S (231 + i.val + 1) ∧
      (entry1834 i).IC = S 168 ∧ (entry1834 i).Inext = T 167 (231 + i.val + 1) ∧
      (entry1834 i).Icur = T 167 (231 + i.val) ∧
      (entry1834 i).output = T 168 (231 + i.val) ∧
      (entry1834 i).charge = charge 167 (231 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1844_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1834 (i : Fin 32) :
    forwardStepOK (-768) (charge 167 (231 + i.val)) shift
      (S (231 + i.val + 1)) (S 168) (T 167 (231 + i.val + 1))
      (T 167 (231 + i.val)) (T 168 (231 + i.val))
      (OriginalRow227Roots.root_pos 168 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 167 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1834.entries OriginalRow227TriangleForward1834.checked
    ⟨i.val, by rw [size1834]; exact i.isLt⟩
  change (entry1834 i).check = true at h
  rcases fields1834 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1835 : OriginalRow227TriangleForward1835.entries.size = 32 := rfl

def entry1835 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1835.entries[i.val]'(by rw [size1835]; exact i.isLt)

theorem fields1835 (i : Fin 32) :
    (entry1835 i).IA = shift ∧ (entry1835 i).ID = S (263 + i.val + 1) ∧
      (entry1835 i).IC = S 168 ∧ (entry1835 i).Inext = T 167 (263 + i.val + 1) ∧
      (entry1835 i).Icur = T 167 (263 + i.val) ∧
      (entry1835 i).output = T 168 (263 + i.val) ∧
      (entry1835 i).charge = charge 167 (263 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1845_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1835 (i : Fin 32) :
    forwardStepOK (-768) (charge 167 (263 + i.val)) shift
      (S (263 + i.val + 1)) (S 168) (T 167 (263 + i.val + 1))
      (T 167 (263 + i.val)) (T 168 (263 + i.val))
      (OriginalRow227Roots.root_pos 168 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 167 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1835.entries OriginalRow227TriangleForward1835.checked
    ⟨i.val, by rw [size1835]; exact i.isLt⟩
  change (entry1835 i).check = true at h
  rcases fields1835 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1836 : OriginalRow227TriangleForward1836.entries.size = 32 := rfl

def entry1836 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1836.entries[i.val]'(by rw [size1836]; exact i.isLt)

theorem fields1836 (i : Fin 32) :
    (entry1836 i).IA = shift ∧ (entry1836 i).ID = S (295 + i.val + 1) ∧
      (entry1836 i).IC = S 168 ∧ (entry1836 i).Inext = T 167 (295 + i.val + 1) ∧
      (entry1836 i).Icur = T 167 (295 + i.val) ∧
      (entry1836 i).output = T 168 (295 + i.val) ∧
      (entry1836 i).charge = charge 167 (295 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1846_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1836 (i : Fin 32) :
    forwardStepOK (-768) (charge 167 (295 + i.val)) shift
      (S (295 + i.val + 1)) (S 168) (T 167 (295 + i.val + 1))
      (T 167 (295 + i.val)) (T 168 (295 + i.val))
      (OriginalRow227Roots.root_pos 168 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 167 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1836.entries OriginalRow227TriangleForward1836.checked
    ⟨i.val, by rw [size1836]; exact i.isLt⟩
  change (entry1836 i).check = true at h
  rcases fields1836 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1837 : OriginalRow227TriangleForward1837.entries.size = 7 := rfl

def entry1837 (i : Fin 7) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1837.entries[i.val]'(by rw [size1837]; exact i.isLt)

theorem fields1837 (i : Fin 7) :
    (entry1837 i).IA = shift ∧ (entry1837 i).ID = S (327 + i.val + 1) ∧
      (entry1837 i).IC = S 168 ∧ (entry1837 i).Inext = T 167 (327 + i.val + 1) ∧
      (entry1837 i).Icur = T 167 (327 + i.val) ∧
      (entry1837 i).output = T 168 (327 + i.val) ∧
      (entry1837 i).charge = charge 167 (327 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings05.S_eq_root168).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow167.block1847_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨6, by decide⟩).symm, rfl⟩

theorem step1837 (i : Fin 7) :
    forwardStepOK (-768) (charge 167 (327 + i.val)) shift
      (S (327 + i.val + 1)) (S 168) (T 167 (327 + i.val + 1))
      (T 167 (327 + i.val)) (T 168 (327 + i.val))
      (OriginalRow227Roots.root_pos 168 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 167 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1837.entries OriginalRow227TriangleForward1837.checked
    ⟨i.val, by rw [size1837]; exact i.isLt⟩
  change (entry1837 i).check = true at h
  rcases fields1837 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 167 ≤ d) (hhi : d < 334) :
    forwardStepOK (-768) (charge 167 d) shift (S (d + 1)) (S 168)
      (T 167 (d + 1)) (T 167 d) (T 168 d)
      (OriginalRow227Roots.root_pos 168 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 167 (by decide)) = true := by
  by_cases h263 : d < 263
  ·
    by_cases h199 : d < 199
    ·
      have hi : d - 167 < 32 := by omega
      have heq : 167 + (d - 167) = d := by omega
      simpa only [heq] using step1832 ⟨d - 167, hi⟩
    ·
      by_cases h231 : d < 231
      ·
        have hi : d - 199 < 32 := by omega
        have heq : 199 + (d - 199) = d := by omega
        simpa only [heq] using step1833 ⟨d - 199, hi⟩
      ·
        have hi : d - 231 < 32 := by omega
        have heq : 231 + (d - 231) = d := by omega
        simpa only [heq] using step1834 ⟨d - 231, hi⟩
  ·
    by_cases h295 : d < 295
    ·
      have hi : d - 263 < 32 := by omega
      have heq : 263 + (d - 263) = d := by omega
      simpa only [heq] using step1835 ⟨d - 263, hi⟩
    ·
      by_cases h327 : d < 327
      ·
        have hi : d - 295 < 32 := by omega
        have heq : 295 + (d - 295) = d := by omega
        simpa only [heq] using step1836 ⟨d - 295, hi⟩
      ·
        have hi : d - 327 < 7 := by omega
        have heq : 327 + (d - 327) = d := by omega
        simpa only [heq] using step1837 ⟨d - 327, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow168.fields1832,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow168.step1832,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow168.fields1833,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow168.step1833,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow168.fields1834,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow168.step1834,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow168.fields1835,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow168.step1835,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow168.fields1836,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow168.step1836,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow168.fields1837,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow168.step1837,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow168.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow168
