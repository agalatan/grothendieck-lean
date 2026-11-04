import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow203
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow204
import Grothe.UpperChaos.OriginalRow227TriangleForward2000
import Grothe.UpperChaos.OriginalRow227TriangleForward2001
import Grothe.UpperChaos.OriginalRow227TriangleForward2002

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow204

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2000 : OriginalRow227TriangleForward2000.entries.size = 32 := rfl

def entry2000 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2000.entries[i.val]'(by rw [size2000]; exact i.isLt)

theorem fields2000 (i : Fin 32) :
    (entry2000 i).IA = shift ∧ (entry2000 i).ID = S (203 + i.val + 1) ∧
      (entry2000 i).IC = S 204 ∧ (entry2000 i).Inext = T 203 (203 + i.val + 1) ∧
      (entry2000 i).Icur = T 203 (203 + i.val) ∧
      (entry2000 i).output = T 204 (203 + i.val) ∧
      (entry2000 i).charge = charge 203 (203 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2012_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2000 (i : Fin 32) :
    forwardStepOK (-768) (charge 203 (203 + i.val)) shift
      (S (203 + i.val + 1)) (S 204) (T 203 (203 + i.val + 1))
      (T 203 (203 + i.val)) (T 204 (203 + i.val))
      (OriginalRow227Roots.root_pos 204 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 203 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2000.entries OriginalRow227TriangleForward2000.checked
    ⟨i.val, by rw [size2000]; exact i.isLt⟩
  change (entry2000 i).check = true at h
  rcases fields2000 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2001 : OriginalRow227TriangleForward2001.entries.size = 32 := rfl

def entry2001 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2001.entries[i.val]'(by rw [size2001]; exact i.isLt)

theorem fields2001 (i : Fin 32) :
    (entry2001 i).IA = shift ∧ (entry2001 i).ID = S (235 + i.val + 1) ∧
      (entry2001 i).IC = S 204 ∧ (entry2001 i).Inext = T 203 (235 + i.val + 1) ∧
      (entry2001 i).Icur = T 203 (235 + i.val) ∧
      (entry2001 i).output = T 204 (235 + i.val) ∧
      (entry2001 i).charge = charge 203 (235 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2013_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2001 (i : Fin 32) :
    forwardStepOK (-768) (charge 203 (235 + i.val)) shift
      (S (235 + i.val + 1)) (S 204) (T 203 (235 + i.val + 1))
      (T 203 (235 + i.val)) (T 204 (235 + i.val))
      (OriginalRow227Roots.root_pos 204 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 203 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2001.entries OriginalRow227TriangleForward2001.checked
    ⟨i.val, by rw [size2001]; exact i.isLt⟩
  change (entry2001 i).check = true at h
  rcases fields2001 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2002 : OriginalRow227TriangleForward2002.entries.size = 31 := rfl

def entry2002 (i : Fin 31) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2002.entries[i.val]'(by rw [size2002]; exact i.isLt)

theorem fields2002 (i : Fin 31) :
    (entry2002 i).IA = shift ∧ (entry2002 i).ID = S (267 + i.val + 1) ∧
      (entry2002 i).IC = S 204 ∧ (entry2002 i).Inext = T 203 (267 + i.val + 1) ∧
      (entry2002 i).Icur = T 203 (267 + i.val) ∧
      (entry2002 i).output = T 204 (267 + i.val) ∧
      (entry2002 i).charge = charge 203 (267 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings06.S_eq_root204).symm,
      (OriginalRow227TriangleBindingsRow203.block2015_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow203.block2014_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨30, by decide⟩).symm, rfl⟩

theorem step2002 (i : Fin 31) :
    forwardStepOK (-768) (charge 203 (267 + i.val)) shift
      (S (267 + i.val + 1)) (S 204) (T 203 (267 + i.val + 1))
      (T 203 (267 + i.val)) (T 204 (267 + i.val))
      (OriginalRow227Roots.root_pos 204 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 203 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2002.entries OriginalRow227TriangleForward2002.checked
    ⟨i.val, by rw [size2002]; exact i.isLt⟩
  change (entry2002 i).check = true at h
  rcases fields2002 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 203 ≤ d) (hhi : d < 298) :
    forwardStepOK (-768) (charge 203 d) shift (S (d + 1)) (S 204)
      (T 203 (d + 1)) (T 203 d) (T 204 d)
      (OriginalRow227Roots.root_pos 204 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 203 (by decide)) = true := by
  by_cases h235 : d < 235
  ·
    have hi : d - 203 < 32 := by omega
    have heq : 203 + (d - 203) = d := by omega
    simpa only [heq] using step2000 ⟨d - 203, hi⟩
  ·
    by_cases h267 : d < 267
    ·
      have hi : d - 235 < 32 := by omega
      have heq : 235 + (d - 235) = d := by omega
      simpa only [heq] using step2001 ⟨d - 235, hi⟩
    ·
      have hi : d - 267 < 31 := by omega
      have heq : 267 + (d - 267) = d := by omega
      simpa only [heq] using step2002 ⟨d - 267, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow204.fields2000,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow204.step2000,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow204.fields2001,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow204.step2001,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow204.fields2002,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow204.step2002,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow204.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow204
