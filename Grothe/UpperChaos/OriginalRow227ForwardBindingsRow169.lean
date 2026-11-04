import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow168
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow169
import Grothe.UpperChaos.OriginalRow227TriangleForward1838
import Grothe.UpperChaos.OriginalRow227TriangleForward1839
import Grothe.UpperChaos.OriginalRow227TriangleForward1840
import Grothe.UpperChaos.OriginalRow227TriangleForward1841
import Grothe.UpperChaos.OriginalRow227TriangleForward1842
import Grothe.UpperChaos.OriginalRow227TriangleForward1843

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow169

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1838 : OriginalRow227TriangleForward1838.entries.size = 32 := rfl

def entry1838 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1838.entries[i.val]'(by rw [size1838]; exact i.isLt)

theorem fields1838 (i : Fin 32) :
    (entry1838 i).IA = shift ∧ (entry1838 i).ID = S (168 + i.val + 1) ∧
      (entry1838 i).IC = S 169 ∧ (entry1838 i).Inext = T 168 (168 + i.val + 1) ∧
      (entry1838 i).Icur = T 168 (168 + i.val) ∧
      (entry1838 i).output = T 169 (168 + i.val) ∧
      (entry1838 i).charge = charge 168 (168 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1848_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1838 (i : Fin 32) :
    forwardStepOK (-768) (charge 168 (168 + i.val)) shift
      (S (168 + i.val + 1)) (S 169) (T 168 (168 + i.val + 1))
      (T 168 (168 + i.val)) (T 169 (168 + i.val))
      (OriginalRow227Roots.root_pos 169 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 168 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1838.entries OriginalRow227TriangleForward1838.checked
    ⟨i.val, by rw [size1838]; exact i.isLt⟩
  change (entry1838 i).check = true at h
  rcases fields1838 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1839 : OriginalRow227TriangleForward1839.entries.size = 32 := rfl

def entry1839 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1839.entries[i.val]'(by rw [size1839]; exact i.isLt)

theorem fields1839 (i : Fin 32) :
    (entry1839 i).IA = shift ∧ (entry1839 i).ID = S (200 + i.val + 1) ∧
      (entry1839 i).IC = S 169 ∧ (entry1839 i).Inext = T 168 (200 + i.val + 1) ∧
      (entry1839 i).Icur = T 168 (200 + i.val) ∧
      (entry1839 i).output = T 169 (200 + i.val) ∧
      (entry1839 i).charge = charge 168 (200 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1849_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1839 (i : Fin 32) :
    forwardStepOK (-768) (charge 168 (200 + i.val)) shift
      (S (200 + i.val + 1)) (S 169) (T 168 (200 + i.val + 1))
      (T 168 (200 + i.val)) (T 169 (200 + i.val))
      (OriginalRow227Roots.root_pos 169 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 168 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1839.entries OriginalRow227TriangleForward1839.checked
    ⟨i.val, by rw [size1839]; exact i.isLt⟩
  change (entry1839 i).check = true at h
  rcases fields1839 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1840 : OriginalRow227TriangleForward1840.entries.size = 32 := rfl

def entry1840 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1840.entries[i.val]'(by rw [size1840]; exact i.isLt)

theorem fields1840 (i : Fin 32) :
    (entry1840 i).IA = shift ∧ (entry1840 i).ID = S (232 + i.val + 1) ∧
      (entry1840 i).IC = S 169 ∧ (entry1840 i).Inext = T 168 (232 + i.val + 1) ∧
      (entry1840 i).Icur = T 168 (232 + i.val) ∧
      (entry1840 i).output = T 169 (232 + i.val) ∧
      (entry1840 i).charge = charge 168 (232 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1850_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1840 (i : Fin 32) :
    forwardStepOK (-768) (charge 168 (232 + i.val)) shift
      (S (232 + i.val + 1)) (S 169) (T 168 (232 + i.val + 1))
      (T 168 (232 + i.val)) (T 169 (232 + i.val))
      (OriginalRow227Roots.root_pos 169 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 168 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1840.entries OriginalRow227TriangleForward1840.checked
    ⟨i.val, by rw [size1840]; exact i.isLt⟩
  change (entry1840 i).check = true at h
  rcases fields1840 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1841 : OriginalRow227TriangleForward1841.entries.size = 32 := rfl

def entry1841 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1841.entries[i.val]'(by rw [size1841]; exact i.isLt)

theorem fields1841 (i : Fin 32) :
    (entry1841 i).IA = shift ∧ (entry1841 i).ID = S (264 + i.val + 1) ∧
      (entry1841 i).IC = S 169 ∧ (entry1841 i).Inext = T 168 (264 + i.val + 1) ∧
      (entry1841 i).Icur = T 168 (264 + i.val) ∧
      (entry1841 i).output = T 169 (264 + i.val) ∧
      (entry1841 i).charge = charge 168 (264 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1851_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1841 (i : Fin 32) :
    forwardStepOK (-768) (charge 168 (264 + i.val)) shift
      (S (264 + i.val + 1)) (S 169) (T 168 (264 + i.val + 1))
      (T 168 (264 + i.val)) (T 169 (264 + i.val))
      (OriginalRow227Roots.root_pos 169 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 168 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1841.entries OriginalRow227TriangleForward1841.checked
    ⟨i.val, by rw [size1841]; exact i.isLt⟩
  change (entry1841 i).check = true at h
  rcases fields1841 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1842 : OriginalRow227TriangleForward1842.entries.size = 32 := rfl

def entry1842 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1842.entries[i.val]'(by rw [size1842]; exact i.isLt)

theorem fields1842 (i : Fin 32) :
    (entry1842 i).IA = shift ∧ (entry1842 i).ID = S (296 + i.val + 1) ∧
      (entry1842 i).IC = S 169 ∧ (entry1842 i).Inext = T 168 (296 + i.val + 1) ∧
      (entry1842 i).Icur = T 168 (296 + i.val) ∧
      (entry1842 i).output = T 169 (296 + i.val) ∧
      (entry1842 i).charge = charge 168 (296 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1852_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1842 (i : Fin 32) :
    forwardStepOK (-768) (charge 168 (296 + i.val)) shift
      (S (296 + i.val + 1)) (S 169) (T 168 (296 + i.val + 1))
      (T 168 (296 + i.val)) (T 169 (296 + i.val))
      (OriginalRow227Roots.root_pos 169 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 168 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1842.entries OriginalRow227TriangleForward1842.checked
    ⟨i.val, by rw [size1842]; exact i.isLt⟩
  change (entry1842 i).check = true at h
  rcases fields1842 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1843 : OriginalRow227TriangleForward1843.entries.size = 5 := rfl

def entry1843 (i : Fin 5) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1843.entries[i.val]'(by rw [size1843]; exact i.isLt)

theorem fields1843 (i : Fin 5) :
    (entry1843 i).IA = shift ∧ (entry1843 i).ID = S (328 + i.val + 1) ∧
      (entry1843 i).IC = S 169 ∧ (entry1843 i).Inext = T 168 (328 + i.val + 1) ∧
      (entry1843 i).Icur = T 168 (328 + i.val) ∧
      (entry1843 i).output = T 169 (328 + i.val) ∧
      (entry1843 i).charge = charge 168 (328 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1859_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1859_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1859_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1859_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings05.S_eq_root169).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow168.block1853_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1859_value ⟨4, by decide⟩).symm, rfl⟩

theorem step1843 (i : Fin 5) :
    forwardStepOK (-768) (charge 168 (328 + i.val)) shift
      (S (328 + i.val + 1)) (S 169) (T 168 (328 + i.val + 1))
      (T 168 (328 + i.val)) (T 169 (328 + i.val))
      (OriginalRow227Roots.root_pos 169 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 168 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1843.entries OriginalRow227TriangleForward1843.checked
    ⟨i.val, by rw [size1843]; exact i.isLt⟩
  change (entry1843 i).check = true at h
  rcases fields1843 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 168 ≤ d) (hhi : d < 333) :
    forwardStepOK (-768) (charge 168 d) shift (S (d + 1)) (S 169)
      (T 168 (d + 1)) (T 168 d) (T 169 d)
      (OriginalRow227Roots.root_pos 169 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 168 (by decide)) = true := by
  by_cases h264 : d < 264
  ·
    by_cases h200 : d < 200
    ·
      have hi : d - 168 < 32 := by omega
      have heq : 168 + (d - 168) = d := by omega
      simpa only [heq] using step1838 ⟨d - 168, hi⟩
    ·
      by_cases h232 : d < 232
      ·
        have hi : d - 200 < 32 := by omega
        have heq : 200 + (d - 200) = d := by omega
        simpa only [heq] using step1839 ⟨d - 200, hi⟩
      ·
        have hi : d - 232 < 32 := by omega
        have heq : 232 + (d - 232) = d := by omega
        simpa only [heq] using step1840 ⟨d - 232, hi⟩
  ·
    by_cases h296 : d < 296
    ·
      have hi : d - 264 < 32 := by omega
      have heq : 264 + (d - 264) = d := by omega
      simpa only [heq] using step1841 ⟨d - 264, hi⟩
    ·
      by_cases h328 : d < 328
      ·
        have hi : d - 296 < 32 := by omega
        have heq : 296 + (d - 296) = d := by omega
        simpa only [heq] using step1842 ⟨d - 296, hi⟩
      ·
        have hi : d - 328 < 5 := by omega
        have heq : 328 + (d - 328) = d := by omega
        simpa only [heq] using step1843 ⟨d - 328, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow169.fields1838,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow169.step1838,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow169.fields1839,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow169.step1839,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow169.fields1840,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow169.step1840,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow169.fields1841,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow169.step1841,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow169.fields1842,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow169.step1842,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow169.fields1843,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow169.step1843,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow169.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow169
