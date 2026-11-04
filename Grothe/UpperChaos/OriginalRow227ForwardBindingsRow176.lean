import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow175
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow176
import Grothe.UpperChaos.OriginalRow227TriangleForward1876
import Grothe.UpperChaos.OriginalRow227TriangleForward1877
import Grothe.UpperChaos.OriginalRow227TriangleForward1878
import Grothe.UpperChaos.OriginalRow227TriangleForward1879
import Grothe.UpperChaos.OriginalRow227TriangleForward1880

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow176

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1876 : OriginalRow227TriangleForward1876.entries.size = 32 := rfl

def entry1876 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1876.entries[i.val]'(by rw [size1876]; exact i.isLt)

theorem fields1876 (i : Fin 32) :
    (entry1876 i).IA = shift ∧ (entry1876 i).ID = S (175 + i.val + 1) ∧
      (entry1876 i).IC = S 176 ∧ (entry1876 i).Inext = T 175 (175 + i.val + 1) ∧
      (entry1876 i).Icur = T 175 (175 + i.val) ∧
      (entry1876 i).output = T 176 (175 + i.val) ∧
      (entry1876 i).charge = charge 175 (175 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1876 (i : Fin 32) :
    forwardStepOK (-768) (charge 175 (175 + i.val)) shift
      (S (175 + i.val + 1)) (S 176) (T 175 (175 + i.val + 1))
      (T 175 (175 + i.val)) (T 176 (175 + i.val))
      (OriginalRow227Roots.root_pos 176 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 175 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1876.entries OriginalRow227TriangleForward1876.checked
    ⟨i.val, by rw [size1876]; exact i.isLt⟩
  change (entry1876 i).check = true at h
  rcases fields1876 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1877 : OriginalRow227TriangleForward1877.entries.size = 32 := rfl

def entry1877 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1877.entries[i.val]'(by rw [size1877]; exact i.isLt)

theorem fields1877 (i : Fin 32) :
    (entry1877 i).IA = shift ∧ (entry1877 i).ID = S (207 + i.val + 1) ∧
      (entry1877 i).IC = S 176 ∧ (entry1877 i).Inext = T 175 (207 + i.val + 1) ∧
      (entry1877 i).Icur = T 175 (207 + i.val) ∧
      (entry1877 i).output = T 176 (207 + i.val) ∧
      (entry1877 i).charge = charge 175 (207 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1877 (i : Fin 32) :
    forwardStepOK (-768) (charge 175 (207 + i.val)) shift
      (S (207 + i.val + 1)) (S 176) (T 175 (207 + i.val + 1))
      (T 175 (207 + i.val)) (T 176 (207 + i.val))
      (OriginalRow227Roots.root_pos 176 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 175 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1877.entries OriginalRow227TriangleForward1877.checked
    ⟨i.val, by rw [size1877]; exact i.isLt⟩
  change (entry1877 i).check = true at h
  rcases fields1877 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1878 : OriginalRow227TriangleForward1878.entries.size = 32 := rfl

def entry1878 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1878.entries[i.val]'(by rw [size1878]; exact i.isLt)

theorem fields1878 (i : Fin 32) :
    (entry1878 i).IA = shift ∧ (entry1878 i).ID = S (239 + i.val + 1) ∧
      (entry1878 i).IC = S 176 ∧ (entry1878 i).Inext = T 175 (239 + i.val + 1) ∧
      (entry1878 i).Icur = T 175 (239 + i.val) ∧
      (entry1878 i).output = T 176 (239 + i.val) ∧
      (entry1878 i).charge = charge 175 (239 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1878 (i : Fin 32) :
    forwardStepOK (-768) (charge 175 (239 + i.val)) shift
      (S (239 + i.val + 1)) (S 176) (T 175 (239 + i.val + 1))
      (T 175 (239 + i.val)) (T 176 (239 + i.val))
      (OriginalRow227Roots.root_pos 176 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 175 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1878.entries OriginalRow227TriangleForward1878.checked
    ⟨i.val, by rw [size1878]; exact i.isLt⟩
  change (entry1878 i).check = true at h
  rcases fields1878 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1879 : OriginalRow227TriangleForward1879.entries.size = 32 := rfl

def entry1879 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1879.entries[i.val]'(by rw [size1879]; exact i.isLt)

theorem fields1879 (i : Fin 32) :
    (entry1879 i).IA = shift ∧ (entry1879 i).ID = S (271 + i.val + 1) ∧
      (entry1879 i).IC = S 176 ∧ (entry1879 i).Inext = T 175 (271 + i.val + 1) ∧
      (entry1879 i).Icur = T 175 (271 + i.val) ∧
      (entry1879 i).output = T 176 (271 + i.val) ∧
      (entry1879 i).charge = charge 175 (271 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1879 (i : Fin 32) :
    forwardStepOK (-768) (charge 175 (271 + i.val)) shift
      (S (271 + i.val + 1)) (S 176) (T 175 (271 + i.val + 1))
      (T 175 (271 + i.val)) (T 176 (271 + i.val))
      (OriginalRow227Roots.root_pos 176 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 175 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1879.entries OriginalRow227TriangleForward1879.checked
    ⟨i.val, by rw [size1879]; exact i.isLt⟩
  change (entry1879 i).check = true at h
  rcases fields1879 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1880 : OriginalRow227TriangleForward1880.entries.size = 23 := rfl

def entry1880 (i : Fin 23) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1880.entries[i.val]'(by rw [size1880]; exact i.isLt)

theorem fields1880 (i : Fin 23) :
    (entry1880 i).IA = shift ∧ (entry1880 i).ID = S (303 + i.val + 1) ∧
      (entry1880 i).IC = S 176 ∧ (entry1880 i).Inext = T 175 (303 + i.val + 1) ∧
      (entry1880 i).Icur = T 175 (303 + i.val) ∧
      (entry1880 i).output = T 176 (303 + i.val) ∧
      (entry1880 i).charge = charge 175 (303 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings05.S_eq_root176).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨22, by decide⟩).symm, rfl⟩

theorem step1880 (i : Fin 23) :
    forwardStepOK (-768) (charge 175 (303 + i.val)) shift
      (S (303 + i.val + 1)) (S 176) (T 175 (303 + i.val + 1))
      (T 175 (303 + i.val)) (T 176 (303 + i.val))
      (OriginalRow227Roots.root_pos 176 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 175 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1880.entries OriginalRow227TriangleForward1880.checked
    ⟨i.val, by rw [size1880]; exact i.isLt⟩
  change (entry1880 i).check = true at h
  rcases fields1880 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 175 ≤ d) (hhi : d < 326) :
    forwardStepOK (-768) (charge 175 d) shift (S (d + 1)) (S 176)
      (T 175 (d + 1)) (T 175 d) (T 176 d)
      (OriginalRow227Roots.root_pos 176 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 175 (by decide)) = true := by
  by_cases h239 : d < 239
  ·
    by_cases h207 : d < 207
    ·
      have hi : d - 175 < 32 := by omega
      have heq : 175 + (d - 175) = d := by omega
      simpa only [heq] using step1876 ⟨d - 175, hi⟩
    ·
      have hi : d - 207 < 32 := by omega
      have heq : 207 + (d - 207) = d := by omega
      simpa only [heq] using step1877 ⟨d - 207, hi⟩
  ·
    by_cases h271 : d < 271
    ·
      have hi : d - 239 < 32 := by omega
      have heq : 239 + (d - 239) = d := by omega
      simpa only [heq] using step1878 ⟨d - 239, hi⟩
    ·
      by_cases h303 : d < 303
      ·
        have hi : d - 271 < 32 := by omega
        have heq : 271 + (d - 271) = d := by omega
        simpa only [heq] using step1879 ⟨d - 271, hi⟩
      ·
        have hi : d - 303 < 23 := by omega
        have heq : 303 + (d - 303) = d := by omega
        simpa only [heq] using step1880 ⟨d - 303, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow176.fields1876,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow176.step1876,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow176.fields1877,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow176.step1877,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow176.fields1878,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow176.step1878,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow176.fields1879,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow176.step1879,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow176.fields1880,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow176.step1880,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow176.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow176
