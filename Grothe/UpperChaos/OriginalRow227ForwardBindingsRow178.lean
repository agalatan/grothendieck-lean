import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow177
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow178
import Grothe.UpperChaos.OriginalRow227TriangleForward1886
import Grothe.UpperChaos.OriginalRow227TriangleForward1887
import Grothe.UpperChaos.OriginalRow227TriangleForward1888
import Grothe.UpperChaos.OriginalRow227TriangleForward1889
import Grothe.UpperChaos.OriginalRow227TriangleForward1890

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow178

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1886 : OriginalRow227TriangleForward1886.entries.size = 32 := rfl

def entry1886 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1886.entries[i.val]'(by rw [size1886]; exact i.isLt)

theorem fields1886 (i : Fin 32) :
    (entry1886 i).IA = shift ∧ (entry1886 i).ID = S (177 + i.val + 1) ∧
      (entry1886 i).IC = S 178 ∧ (entry1886 i).Inext = T 177 (177 + i.val + 1) ∧
      (entry1886 i).Icur = T 177 (177 + i.val) ∧
      (entry1886 i).output = T 178 (177 + i.val) ∧
      (entry1886 i).charge = charge 177 (177 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1886 (i : Fin 32) :
    forwardStepOK (-768) (charge 177 (177 + i.val)) shift
      (S (177 + i.val + 1)) (S 178) (T 177 (177 + i.val + 1))
      (T 177 (177 + i.val)) (T 178 (177 + i.val))
      (OriginalRow227Roots.root_pos 178 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 177 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1886.entries OriginalRow227TriangleForward1886.checked
    ⟨i.val, by rw [size1886]; exact i.isLt⟩
  change (entry1886 i).check = true at h
  rcases fields1886 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1887 : OriginalRow227TriangleForward1887.entries.size = 32 := rfl

def entry1887 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1887.entries[i.val]'(by rw [size1887]; exact i.isLt)

theorem fields1887 (i : Fin 32) :
    (entry1887 i).IA = shift ∧ (entry1887 i).ID = S (209 + i.val + 1) ∧
      (entry1887 i).IC = S 178 ∧ (entry1887 i).Inext = T 177 (209 + i.val + 1) ∧
      (entry1887 i).Icur = T 177 (209 + i.val) ∧
      (entry1887 i).output = T 178 (209 + i.val) ∧
      (entry1887 i).charge = charge 177 (209 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1887 (i : Fin 32) :
    forwardStepOK (-768) (charge 177 (209 + i.val)) shift
      (S (209 + i.val + 1)) (S 178) (T 177 (209 + i.val + 1))
      (T 177 (209 + i.val)) (T 178 (209 + i.val))
      (OriginalRow227Roots.root_pos 178 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 177 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1887.entries OriginalRow227TriangleForward1887.checked
    ⟨i.val, by rw [size1887]; exact i.isLt⟩
  change (entry1887 i).check = true at h
  rcases fields1887 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1888 : OriginalRow227TriangleForward1888.entries.size = 32 := rfl

def entry1888 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1888.entries[i.val]'(by rw [size1888]; exact i.isLt)

theorem fields1888 (i : Fin 32) :
    (entry1888 i).IA = shift ∧ (entry1888 i).ID = S (241 + i.val + 1) ∧
      (entry1888 i).IC = S 178 ∧ (entry1888 i).Inext = T 177 (241 + i.val + 1) ∧
      (entry1888 i).Icur = T 177 (241 + i.val) ∧
      (entry1888 i).output = T 178 (241 + i.val) ∧
      (entry1888 i).charge = charge 177 (241 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1888 (i : Fin 32) :
    forwardStepOK (-768) (charge 177 (241 + i.val)) shift
      (S (241 + i.val + 1)) (S 178) (T 177 (241 + i.val + 1))
      (T 177 (241 + i.val)) (T 178 (241 + i.val))
      (OriginalRow227Roots.root_pos 178 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 177 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1888.entries OriginalRow227TriangleForward1888.checked
    ⟨i.val, by rw [size1888]; exact i.isLt⟩
  change (entry1888 i).check = true at h
  rcases fields1888 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1889 : OriginalRow227TriangleForward1889.entries.size = 32 := rfl

def entry1889 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1889.entries[i.val]'(by rw [size1889]; exact i.isLt)

theorem fields1889 (i : Fin 32) :
    (entry1889 i).IA = shift ∧ (entry1889 i).ID = S (273 + i.val + 1) ∧
      (entry1889 i).IC = S 178 ∧ (entry1889 i).Inext = T 177 (273 + i.val + 1) ∧
      (entry1889 i).Icur = T 177 (273 + i.val) ∧
      (entry1889 i).output = T 178 (273 + i.val) ∧
      (entry1889 i).charge = charge 177 (273 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1889 (i : Fin 32) :
    forwardStepOK (-768) (charge 177 (273 + i.val)) shift
      (S (273 + i.val + 1)) (S 178) (T 177 (273 + i.val + 1))
      (T 177 (273 + i.val)) (T 178 (273 + i.val))
      (OriginalRow227Roots.root_pos 178 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 177 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1889.entries OriginalRow227TriangleForward1889.checked
    ⟨i.val, by rw [size1889]; exact i.isLt⟩
  change (entry1889 i).check = true at h
  rcases fields1889 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1890 : OriginalRow227TriangleForward1890.entries.size = 19 := rfl

def entry1890 (i : Fin 19) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1890.entries[i.val]'(by rw [size1890]; exact i.isLt)

theorem fields1890 (i : Fin 19) :
    (entry1890 i).IA = shift ∧ (entry1890 i).ID = S (305 + i.val + 1) ∧
      (entry1890 i).IC = S 178 ∧ (entry1890 i).Inext = T 177 (305 + i.val + 1) ∧
      (entry1890 i).Icur = T 177 (305 + i.val) ∧
      (entry1890 i).output = T 178 (305 + i.val) ∧
      (entry1890 i).charge = charge 177 (305 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings05.S_eq_root178).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨18, by decide⟩).symm, rfl⟩

theorem step1890 (i : Fin 19) :
    forwardStepOK (-768) (charge 177 (305 + i.val)) shift
      (S (305 + i.val + 1)) (S 178) (T 177 (305 + i.val + 1))
      (T 177 (305 + i.val)) (T 178 (305 + i.val))
      (OriginalRow227Roots.root_pos 178 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 177 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1890.entries OriginalRow227TriangleForward1890.checked
    ⟨i.val, by rw [size1890]; exact i.isLt⟩
  change (entry1890 i).check = true at h
  rcases fields1890 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 177 ≤ d) (hhi : d < 324) :
    forwardStepOK (-768) (charge 177 d) shift (S (d + 1)) (S 178)
      (T 177 (d + 1)) (T 177 d) (T 178 d)
      (OriginalRow227Roots.root_pos 178 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 177 (by decide)) = true := by
  by_cases h241 : d < 241
  ·
    by_cases h209 : d < 209
    ·
      have hi : d - 177 < 32 := by omega
      have heq : 177 + (d - 177) = d := by omega
      simpa only [heq] using step1886 ⟨d - 177, hi⟩
    ·
      have hi : d - 209 < 32 := by omega
      have heq : 209 + (d - 209) = d := by omega
      simpa only [heq] using step1887 ⟨d - 209, hi⟩
  ·
    by_cases h273 : d < 273
    ·
      have hi : d - 241 < 32 := by omega
      have heq : 241 + (d - 241) = d := by omega
      simpa only [heq] using step1888 ⟨d - 241, hi⟩
    ·
      by_cases h305 : d < 305
      ·
        have hi : d - 273 < 32 := by omega
        have heq : 273 + (d - 273) = d := by omega
        simpa only [heq] using step1889 ⟨d - 273, hi⟩
      ·
        have hi : d - 305 < 19 := by omega
        have heq : 305 + (d - 305) = d := by omega
        simpa only [heq] using step1890 ⟨d - 305, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow178.fields1886,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow178.step1886,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow178.fields1887,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow178.step1887,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow178.fields1888,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow178.step1888,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow178.fields1889,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow178.step1889,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow178.fields1890,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow178.step1890,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow178.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow178
