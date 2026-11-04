import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow217
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow218
import Grothe.UpperChaos.OriginalRow227TriangleForward2042
import Grothe.UpperChaos.OriginalRow227TriangleForward2043
import Grothe.UpperChaos.OriginalRow227TriangleForward2044

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow218

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2042 : OriginalRow227TriangleForward2042.entries.size = 32 := rfl

def entry2042 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2042.entries[i.val]'(by rw [size2042]; exact i.isLt)

theorem fields2042 (i : Fin 32) :
    (entry2042 i).IA = shift ∧ (entry2042 i).ID = S (217 + i.val + 1) ∧
      (entry2042 i).IC = S 218 ∧ (entry2042 i).Inext = T 217 (217 + i.val + 1) ∧
      (entry2042 i).Icur = T 217 (217 + i.val) ∧
      (entry2042 i).output = T 218 (217 + i.val) ∧
      (entry2042 i).charge = charge 217 (217 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2055_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2058_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2042 (i : Fin 32) :
    forwardStepOK (-768) (charge 217 (217 + i.val)) shift
      (S (217 + i.val + 1)) (S 218) (T 217 (217 + i.val + 1))
      (T 217 (217 + i.val)) (T 218 (217 + i.val))
      (OriginalRow227Roots.root_pos 218 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 217 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2042.entries OriginalRow227TriangleForward2042.checked
    ⟨i.val, by rw [size2042]; exact i.isLt⟩
  change (entry2042 i).check = true at h
  rcases fields2042 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2043 : OriginalRow227TriangleForward2043.entries.size = 32 := rfl

def entry2043 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2043.entries[i.val]'(by rw [size2043]; exact i.isLt)

theorem fields2043 (i : Fin 32) :
    (entry2043 i).IA = shift ∧ (entry2043 i).ID = S (249 + i.val + 1) ∧
      (entry2043 i).IC = S 218 ∧ (entry2043 i).Inext = T 217 (249 + i.val + 1) ∧
      (entry2043 i).Icur = T 217 (249 + i.val) ∧
      (entry2043 i).output = T 218 (249 + i.val) ∧
      (entry2043 i).charge = charge 217 (249 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2057_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2056_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2057_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2057_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2059_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2043 (i : Fin 32) :
    forwardStepOK (-768) (charge 217 (249 + i.val)) shift
      (S (249 + i.val + 1)) (S 218) (T 217 (249 + i.val + 1))
      (T 217 (249 + i.val)) (T 218 (249 + i.val))
      (OriginalRow227Roots.root_pos 218 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 217 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2043.entries OriginalRow227TriangleForward2043.checked
    ⟨i.val, by rw [size2043]; exact i.isLt⟩
  change (entry2043 i).check = true at h
  rcases fields2043 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2044 : OriginalRow227TriangleForward2044.entries.size = 3 := rfl

def entry2044 (i : Fin 3) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2044.entries[i.val]'(by rw [size2044]; exact i.isLt)

theorem fields2044 (i : Fin 3) :
    (entry2044 i).IA = shift ∧ (entry2044 i).ID = S (281 + i.val + 1) ∧
      (entry2044 i).IC = S 218 ∧ (entry2044 i).Inext = T 217 (281 + i.val + 1) ∧
      (entry2044 i).Icur = T 217 (281 + i.val) ∧
      (entry2044 i).output = T 218 (281 + i.val) ∧
      (entry2044 i).charge = charge 217 (281 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2057_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2057_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2060_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2057_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2057_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2060_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root218).symm,
      (OriginalRow227TriangleBindingsRow217.block2057_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow217.block2057_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow218.block2060_value ⟨2, by decide⟩).symm, rfl⟩

theorem step2044 (i : Fin 3) :
    forwardStepOK (-768) (charge 217 (281 + i.val)) shift
      (S (281 + i.val + 1)) (S 218) (T 217 (281 + i.val + 1))
      (T 217 (281 + i.val)) (T 218 (281 + i.val))
      (OriginalRow227Roots.root_pos 218 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 217 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2044.entries OriginalRow227TriangleForward2044.checked
    ⟨i.val, by rw [size2044]; exact i.isLt⟩
  change (entry2044 i).check = true at h
  rcases fields2044 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 217 ≤ d) (hhi : d < 284) :
    forwardStepOK (-768) (charge 217 d) shift (S (d + 1)) (S 218)
      (T 217 (d + 1)) (T 217 d) (T 218 d)
      (OriginalRow227Roots.root_pos 218 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 217 (by decide)) = true := by
  by_cases h249 : d < 249
  ·
    have hi : d - 217 < 32 := by omega
    have heq : 217 + (d - 217) = d := by omega
    simpa only [heq] using step2042 ⟨d - 217, hi⟩
  ·
    by_cases h281 : d < 281
    ·
      have hi : d - 249 < 32 := by omega
      have heq : 249 + (d - 249) = d := by omega
      simpa only [heq] using step2043 ⟨d - 249, hi⟩
    ·
      have hi : d - 281 < 3 := by omega
      have heq : 281 + (d - 281) = d := by omega
      simpa only [heq] using step2044 ⟨d - 281, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow218.fields2042,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow218.step2042,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow218.fields2043,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow218.step2043,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow218.fields2044,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow218.step2044,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow218.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow218
