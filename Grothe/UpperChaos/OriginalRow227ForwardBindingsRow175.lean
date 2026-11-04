import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow174
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow175
import Grothe.UpperChaos.OriginalRow227TriangleForward1871
import Grothe.UpperChaos.OriginalRow227TriangleForward1872
import Grothe.UpperChaos.OriginalRow227TriangleForward1873
import Grothe.UpperChaos.OriginalRow227TriangleForward1874
import Grothe.UpperChaos.OriginalRow227TriangleForward1875

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow175

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1871 : OriginalRow227TriangleForward1871.entries.size = 32 := rfl

def entry1871 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1871.entries[i.val]'(by rw [size1871]; exact i.isLt)

theorem fields1871 (i : Fin 32) :
    (entry1871 i).IA = shift ∧ (entry1871 i).ID = S (174 + i.val + 1) ∧
      (entry1871 i).IC = S 175 ∧ (entry1871 i).Inext = T 174 (174 + i.val + 1) ∧
      (entry1871 i).Icur = T 174 (174 + i.val) ∧
      (entry1871 i).output = T 175 (174 + i.val) ∧
      (entry1871 i).charge = charge 174 (174 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1887_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1871 (i : Fin 32) :
    forwardStepOK (-768) (charge 174 (174 + i.val)) shift
      (S (174 + i.val + 1)) (S 175) (T 174 (174 + i.val + 1))
      (T 174 (174 + i.val)) (T 175 (174 + i.val))
      (OriginalRow227Roots.root_pos 175 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 174 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1871.entries OriginalRow227TriangleForward1871.checked
    ⟨i.val, by rw [size1871]; exact i.isLt⟩
  change (entry1871 i).check = true at h
  rcases fields1871 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1872 : OriginalRow227TriangleForward1872.entries.size = 32 := rfl

def entry1872 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1872.entries[i.val]'(by rw [size1872]; exact i.isLt)

theorem fields1872 (i : Fin 32) :
    (entry1872 i).IA = shift ∧ (entry1872 i).ID = S (206 + i.val + 1) ∧
      (entry1872 i).IC = S 175 ∧ (entry1872 i).Inext = T 174 (206 + i.val + 1) ∧
      (entry1872 i).Icur = T 174 (206 + i.val) ∧
      (entry1872 i).output = T 175 (206 + i.val) ∧
      (entry1872 i).charge = charge 174 (206 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1888_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1872 (i : Fin 32) :
    forwardStepOK (-768) (charge 174 (206 + i.val)) shift
      (S (206 + i.val + 1)) (S 175) (T 174 (206 + i.val + 1))
      (T 174 (206 + i.val)) (T 175 (206 + i.val))
      (OriginalRow227Roots.root_pos 175 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 174 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1872.entries OriginalRow227TriangleForward1872.checked
    ⟨i.val, by rw [size1872]; exact i.isLt⟩
  change (entry1872 i).check = true at h
  rcases fields1872 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1873 : OriginalRow227TriangleForward1873.entries.size = 32 := rfl

def entry1873 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1873.entries[i.val]'(by rw [size1873]; exact i.isLt)

theorem fields1873 (i : Fin 32) :
    (entry1873 i).IA = shift ∧ (entry1873 i).ID = S (238 + i.val + 1) ∧
      (entry1873 i).IC = S 175 ∧ (entry1873 i).Inext = T 174 (238 + i.val + 1) ∧
      (entry1873 i).Icur = T 174 (238 + i.val) ∧
      (entry1873 i).output = T 175 (238 + i.val) ∧
      (entry1873 i).charge = charge 174 (238 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1889_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1873 (i : Fin 32) :
    forwardStepOK (-768) (charge 174 (238 + i.val)) shift
      (S (238 + i.val + 1)) (S 175) (T 174 (238 + i.val + 1))
      (T 174 (238 + i.val)) (T 175 (238 + i.val))
      (OriginalRow227Roots.root_pos 175 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 174 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1873.entries OriginalRow227TriangleForward1873.checked
    ⟨i.val, by rw [size1873]; exact i.isLt⟩
  change (entry1873 i).check = true at h
  rcases fields1873 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1874 : OriginalRow227TriangleForward1874.entries.size = 32 := rfl

def entry1874 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1874.entries[i.val]'(by rw [size1874]; exact i.isLt)

theorem fields1874 (i : Fin 32) :
    (entry1874 i).IA = shift ∧ (entry1874 i).ID = S (270 + i.val + 1) ∧
      (entry1874 i).IC = S 175 ∧ (entry1874 i).Inext = T 174 (270 + i.val + 1) ∧
      (entry1874 i).Icur = T 174 (270 + i.val) ∧
      (entry1874 i).output = T 175 (270 + i.val) ∧
      (entry1874 i).charge = charge 174 (270 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1890_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1874 (i : Fin 32) :
    forwardStepOK (-768) (charge 174 (270 + i.val)) shift
      (S (270 + i.val + 1)) (S 175) (T 174 (270 + i.val + 1))
      (T 174 (270 + i.val)) (T 175 (270 + i.val))
      (OriginalRow227Roots.root_pos 175 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 174 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1874.entries OriginalRow227TriangleForward1874.checked
    ⟨i.val, by rw [size1874]; exact i.isLt⟩
  change (entry1874 i).check = true at h
  rcases fields1874 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1875 : OriginalRow227TriangleForward1875.entries.size = 25 := rfl

def entry1875 (i : Fin 25) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1875.entries[i.val]'(by rw [size1875]; exact i.isLt)

theorem fields1875 (i : Fin 25) :
    (entry1875 i).IA = shift ∧ (entry1875 i).ID = S (302 + i.val + 1) ∧
      (entry1875 i).IC = S 175 ∧ (entry1875 i).Inext = T 174 (302 + i.val + 1) ∧
      (entry1875 i).Icur = T 174 (302 + i.val) ∧
      (entry1875 i).output = T 175 (302 + i.val) ∧
      (entry1875 i).charge = charge 174 (302 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings05.S_eq_root175).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow175.block1891_value ⟨24, by decide⟩).symm, rfl⟩

theorem step1875 (i : Fin 25) :
    forwardStepOK (-768) (charge 174 (302 + i.val)) shift
      (S (302 + i.val + 1)) (S 175) (T 174 (302 + i.val + 1))
      (T 174 (302 + i.val)) (T 175 (302 + i.val))
      (OriginalRow227Roots.root_pos 175 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 174 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1875.entries OriginalRow227TriangleForward1875.checked
    ⟨i.val, by rw [size1875]; exact i.isLt⟩
  change (entry1875 i).check = true at h
  rcases fields1875 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 174 ≤ d) (hhi : d < 327) :
    forwardStepOK (-768) (charge 174 d) shift (S (d + 1)) (S 175)
      (T 174 (d + 1)) (T 174 d) (T 175 d)
      (OriginalRow227Roots.root_pos 175 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 174 (by decide)) = true := by
  by_cases h238 : d < 238
  ·
    by_cases h206 : d < 206
    ·
      have hi : d - 174 < 32 := by omega
      have heq : 174 + (d - 174) = d := by omega
      simpa only [heq] using step1871 ⟨d - 174, hi⟩
    ·
      have hi : d - 206 < 32 := by omega
      have heq : 206 + (d - 206) = d := by omega
      simpa only [heq] using step1872 ⟨d - 206, hi⟩
  ·
    by_cases h270 : d < 270
    ·
      have hi : d - 238 < 32 := by omega
      have heq : 238 + (d - 238) = d := by omega
      simpa only [heq] using step1873 ⟨d - 238, hi⟩
    ·
      by_cases h302 : d < 302
      ·
        have hi : d - 270 < 32 := by omega
        have heq : 270 + (d - 270) = d := by omega
        simpa only [heq] using step1874 ⟨d - 270, hi⟩
      ·
        have hi : d - 302 < 25 := by omega
        have heq : 302 + (d - 302) = d := by omega
        simpa only [heq] using step1875 ⟨d - 302, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow175.fields1871,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow175.step1871,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow175.fields1872,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow175.step1872,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow175.fields1873,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow175.step1873,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow175.fields1874,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow175.step1874,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow175.fields1875,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow175.step1875,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow175.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow175
