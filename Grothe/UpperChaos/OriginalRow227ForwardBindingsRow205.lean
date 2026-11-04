import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow204
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow205
import Grothe.UpperChaos.OriginalRow227TriangleForward2003
import Grothe.UpperChaos.OriginalRow227TriangleForward2004
import Grothe.UpperChaos.OriginalRow227TriangleForward2005

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow205

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2003 : OriginalRow227TriangleForward2003.entries.size = 32 := rfl

def entry2003 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2003.entries[i.val]'(by rw [size2003]; exact i.isLt)

theorem fields2003 (i : Fin 32) :
    (entry2003 i).IA = shift ∧ (entry2003 i).ID = S (204 + i.val + 1) ∧
      (entry2003 i).IC = S 205 ∧ (entry2003 i).Inext = T 204 (204 + i.val + 1) ∧
      (entry2003 i).Icur = T 204 (204 + i.val) ∧
      (entry2003 i).output = T 205 (204 + i.val) ∧
      (entry2003 i).charge = charge 204 (204 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2016_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2019_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2003 (i : Fin 32) :
    forwardStepOK (-768) (charge 204 (204 + i.val)) shift
      (S (204 + i.val + 1)) (S 205) (T 204 (204 + i.val + 1))
      (T 204 (204 + i.val)) (T 205 (204 + i.val))
      (OriginalRow227Roots.root_pos 205 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 204 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2003.entries OriginalRow227TriangleForward2003.checked
    ⟨i.val, by rw [size2003]; exact i.isLt⟩
  change (entry2003 i).check = true at h
  rcases fields2003 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2004 : OriginalRow227TriangleForward2004.entries.size = 32 := rfl

def entry2004 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2004.entries[i.val]'(by rw [size2004]; exact i.isLt)

theorem fields2004 (i : Fin 32) :
    (entry2004 i).IA = shift ∧ (entry2004 i).ID = S (236 + i.val + 1) ∧
      (entry2004 i).IC = S 205 ∧ (entry2004 i).Inext = T 204 (236 + i.val + 1) ∧
      (entry2004 i).Icur = T 204 (236 + i.val) ∧
      (entry2004 i).output = T 205 (236 + i.val) ∧
      (entry2004 i).charge = charge 204 (236 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2017_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2020_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2004 (i : Fin 32) :
    forwardStepOK (-768) (charge 204 (236 + i.val)) shift
      (S (236 + i.val + 1)) (S 205) (T 204 (236 + i.val + 1))
      (T 204 (236 + i.val)) (T 205 (236 + i.val))
      (OriginalRow227Roots.root_pos 205 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 204 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2004.entries OriginalRow227TriangleForward2004.checked
    ⟨i.val, by rw [size2004]; exact i.isLt⟩
  change (entry2004 i).check = true at h
  rcases fields2004 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2005 : OriginalRow227TriangleForward2005.entries.size = 29 := rfl

def entry2005 (i : Fin 29) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2005.entries[i.val]'(by rw [size2005]; exact i.isLt)

theorem fields2005 (i : Fin 29) :
    (entry2005 i).IA = shift ∧ (entry2005 i).ID = S (268 + i.val + 1) ∧
      (entry2005 i).IC = S 205 ∧ (entry2005 i).Inext = T 204 (268 + i.val + 1) ∧
      (entry2005 i).Icur = T 204 (268 + i.val) ∧
      (entry2005 i).output = T 205 (268 + i.val) ∧
      (entry2005 i).charge = charge 204 (268 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings06.S_eq_root205).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow204.block2018_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow205.block2021_value ⟨28, by decide⟩).symm, rfl⟩

theorem step2005 (i : Fin 29) :
    forwardStepOK (-768) (charge 204 (268 + i.val)) shift
      (S (268 + i.val + 1)) (S 205) (T 204 (268 + i.val + 1))
      (T 204 (268 + i.val)) (T 205 (268 + i.val))
      (OriginalRow227Roots.root_pos 205 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 204 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2005.entries OriginalRow227TriangleForward2005.checked
    ⟨i.val, by rw [size2005]; exact i.isLt⟩
  change (entry2005 i).check = true at h
  rcases fields2005 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 204 ≤ d) (hhi : d < 297) :
    forwardStepOK (-768) (charge 204 d) shift (S (d + 1)) (S 205)
      (T 204 (d + 1)) (T 204 d) (T 205 d)
      (OriginalRow227Roots.root_pos 205 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 204 (by decide)) = true := by
  by_cases h236 : d < 236
  ·
    have hi : d - 204 < 32 := by omega
    have heq : 204 + (d - 204) = d := by omega
    simpa only [heq] using step2003 ⟨d - 204, hi⟩
  ·
    by_cases h268 : d < 268
    ·
      have hi : d - 236 < 32 := by omega
      have heq : 236 + (d - 236) = d := by omega
      simpa only [heq] using step2004 ⟨d - 236, hi⟩
    ·
      have hi : d - 268 < 29 := by omega
      have heq : 268 + (d - 268) = d := by omega
      simpa only [heq] using step2005 ⟨d - 268, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow205.fields2003,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow205.step2003,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow205.fields2004,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow205.step2004,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow205.fields2005,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow205.step2005,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow205.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow205
