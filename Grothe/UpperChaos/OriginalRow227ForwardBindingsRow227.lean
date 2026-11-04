import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow226
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow227
import Grothe.UpperChaos.OriginalRow227TriangleForward2062
import Grothe.UpperChaos.OriginalRow227TriangleForward2063

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow227

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size2062 : OriginalRow227TriangleForward2062.entries.size = 32 := rfl

def entry2062 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2062.entries[i.val]'(by rw [size2062]; exact i.isLt)

theorem fields2062 (i : Fin 32) :
    (entry2062 i).IA = shift ∧ (entry2062 i).ID = S (226 + i.val + 1) ∧
      (entry2062 i).IC = S 227 ∧ (entry2062 i).Inext = T 226 (226 + i.val + 1) ∧
      (entry2062 i).Icur = T 226 (226 + i.val) ∧
      (entry2062 i).output = T 227 (226 + i.val) ∧
      (entry2062 i).charge = charge 226 (226 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2076_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2078_value ⟨31, by decide⟩).symm, rfl⟩

theorem step2062 (i : Fin 32) :
    forwardStepOK (-768) (charge 226 (226 + i.val)) shift
      (S (226 + i.val + 1)) (S 227) (T 226 (226 + i.val + 1))
      (T 226 (226 + i.val)) (T 227 (226 + i.val))
      (OriginalRow227Roots.root_pos 227 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 226 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2062.entries OriginalRow227TriangleForward2062.checked
    ⟨i.val, by rw [size2062]; exact i.isLt⟩
  change (entry2062 i).check = true at h
  rcases fields2062 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size2063 : OriginalRow227TriangleForward2063.entries.size = 17 := rfl

def entry2063 (i : Fin 17) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward2063.entries[i.val]'(by rw [size2063]; exact i.isLt)

theorem fields2063 (i : Fin 17) :
    (entry2063 i).IA = shift ∧ (entry2063 i).ID = S (258 + i.val + 1) ∧
      (entry2063 i).IC = S 227 ∧ (entry2063 i).Inext = T 226 (258 + i.val + 1) ∧
      (entry2063 i).Icur = T 226 (258 + i.val) ∧
      (entry2063 i).output = T 227 (258 + i.val) ∧
      (entry2063 i).charge = charge 226 (258 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings07.S_eq_root227).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow226.block2077_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow227.block2079_value ⟨16, by decide⟩).symm, rfl⟩

theorem step2063 (i : Fin 17) :
    forwardStepOK (-768) (charge 226 (258 + i.val)) shift
      (S (258 + i.val + 1)) (S 227) (T 226 (258 + i.val + 1))
      (T 226 (258 + i.val)) (T 227 (258 + i.val))
      (OriginalRow227Roots.root_pos 227 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 226 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward2063.entries OriginalRow227TriangleForward2063.checked
    ⟨i.val, by rw [size2063]; exact i.isLt⟩
  change (entry2063 i).check = true at h
  rcases fields2063 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 226 ≤ d) (hhi : d < 275) :
    forwardStepOK (-768) (charge 226 d) shift (S (d + 1)) (S 227)
      (T 226 (d + 1)) (T 226 d) (T 227 d)
      (OriginalRow227Roots.root_pos 227 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 226 (by decide)) = true := by
  by_cases h258 : d < 258
  ·
    have hi : d - 226 < 32 := by omega
    have heq : 226 + (d - 226) = d := by omega
    simpa only [heq] using step2062 ⟨d - 226, hi⟩
  ·
    have hi : d - 258 < 17 := by omega
    have heq : 258 + (d - 258) = d := by omega
    simpa only [heq] using step2063 ⟨d - 258, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow227.fields2062,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow227.step2062,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow227.fields2063,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow227.step2063,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow227.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow227
