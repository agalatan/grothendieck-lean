import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002
import Grothe.UpperChaos.OriginalRow227TriangleForward0016
import Grothe.UpperChaos.OriginalRow227TriangleForward0017
import Grothe.UpperChaos.OriginalRow227TriangleForward0018
import Grothe.UpperChaos.OriginalRow227TriangleForward0019
import Grothe.UpperChaos.OriginalRow227TriangleForward0020
import Grothe.UpperChaos.OriginalRow227TriangleForward0021
import Grothe.UpperChaos.OriginalRow227TriangleForward0022
import Grothe.UpperChaos.OriginalRow227TriangleForward0023
import Grothe.UpperChaos.OriginalRow227TriangleForward0024
import Grothe.UpperChaos.OriginalRow227TriangleForward0025
import Grothe.UpperChaos.OriginalRow227TriangleForward0026
import Grothe.UpperChaos.OriginalRow227TriangleForward0027
import Grothe.UpperChaos.OriginalRow227TriangleForward0028
import Grothe.UpperChaos.OriginalRow227TriangleForward0029
import Grothe.UpperChaos.OriginalRow227TriangleForward0030
import Grothe.UpperChaos.OriginalRow227TriangleForward0031

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0016 : OriginalRow227TriangleForward0016.entries.size = 32 := rfl

def entry0016 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0016.entries[i.val]'(by rw [size0016]; exact i.isLt)

theorem fields0016 (i : Fin 32) :
    (entry0016 i).IA = shift ∧ (entry0016 i).ID = S (1 + i.val + 1) ∧
      (entry0016 i).IC = S 2 ∧ (entry0016 i).Inext = T 1 (1 + i.val + 1) ∧
      (entry0016 i).Icur = T 1 (1 + i.val) ∧
      (entry0016 i).output = T 2 (1 + i.val) ∧
      (entry0016 i).charge = charge 1 (1 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root2).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root3).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root4).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root5).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root6).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root7).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root8).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root9).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root10).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root11).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root12).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root13).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root14).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root15).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root16).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root17).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root18).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root19).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0032_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0016 (i : Fin 32) :
    forwardStepOK (-768) (charge 1 (1 + i.val)) shift
      (S (1 + i.val + 1)) (S 2) (T 1 (1 + i.val + 1))
      (T 1 (1 + i.val)) (T 2 (1 + i.val))
      (OriginalRow227Roots.root_pos 2 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 1 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0016.entries OriginalRow227TriangleForward0016.checked
    ⟨i.val, by rw [size0016]; exact i.isLt⟩
  change (entry0016 i).check = true at h
  rcases fields0016 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0017 : OriginalRow227TriangleForward0017.entries.size = 32 := rfl

def entry0017 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0017.entries[i.val]'(by rw [size0017]; exact i.isLt)

theorem fields0017 (i : Fin 32) :
    (entry0017 i).IA = shift ∧ (entry0017 i).ID = S (33 + i.val + 1) ∧
      (entry0017 i).IC = S 2 ∧ (entry0017 i).Inext = T 1 (33 + i.val + 1) ∧
      (entry0017 i).Icur = T 1 (33 + i.val) ∧
      (entry0017 i).output = T 2 (33 + i.val) ∧
      (entry0017 i).charge = charge 1 (33 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0033_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0017 (i : Fin 32) :
    forwardStepOK (-768) (charge 1 (33 + i.val)) shift
      (S (33 + i.val + 1)) (S 2) (T 1 (33 + i.val + 1))
      (T 1 (33 + i.val)) (T 2 (33 + i.val))
      (OriginalRow227Roots.root_pos 2 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 1 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0017.entries OriginalRow227TriangleForward0017.checked
    ⟨i.val, by rw [size0017]; exact i.isLt⟩
  change (entry0017 i).check = true at h
  rcases fields0017 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0018 : OriginalRow227TriangleForward0018.entries.size = 32 := rfl

def entry0018 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0018.entries[i.val]'(by rw [size0018]; exact i.isLt)

theorem fields0018 (i : Fin 32) :
    (entry0018 i).IA = shift ∧ (entry0018 i).ID = S (65 + i.val + 1) ∧
      (entry0018 i).IC = S 2 ∧ (entry0018 i).Inext = T 1 (65 + i.val + 1) ∧
      (entry0018 i).Icur = T 1 (65 + i.val) ∧
      (entry0018 i).output = T 2 (65 + i.val) ∧
      (entry0018 i).charge = charge 1 (65 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0034_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0018 (i : Fin 32) :
    forwardStepOK (-768) (charge 1 (65 + i.val)) shift
      (S (65 + i.val + 1)) (S 2) (T 1 (65 + i.val + 1))
      (T 1 (65 + i.val)) (T 2 (65 + i.val))
      (OriginalRow227Roots.root_pos 2 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 1 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0018.entries OriginalRow227TriangleForward0018.checked
    ⟨i.val, by rw [size0018]; exact i.isLt⟩
  change (entry0018 i).check = true at h
  rcases fields0018 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0019 : OriginalRow227TriangleForward0019.entries.size = 32 := rfl

def entry0019 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0019.entries[i.val]'(by rw [size0019]; exact i.isLt)

theorem fields0019 (i : Fin 32) :
    (entry0019 i).IA = shift ∧ (entry0019 i).ID = S (97 + i.val + 1) ∧
      (entry0019 i).IC = S 2 ∧ (entry0019 i).Inext = T 1 (97 + i.val + 1) ∧
      (entry0019 i).Icur = T 1 (97 + i.val) ∧
      (entry0019 i).output = T 2 (97 + i.val) ∧
      (entry0019 i).charge = charge 1 (97 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0035_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0019 (i : Fin 32) :
    forwardStepOK (-768) (charge 1 (97 + i.val)) shift
      (S (97 + i.val + 1)) (S 2) (T 1 (97 + i.val + 1))
      (T 1 (97 + i.val)) (T 2 (97 + i.val))
      (OriginalRow227Roots.root_pos 2 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 1 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0019.entries OriginalRow227TriangleForward0019.checked
    ⟨i.val, by rw [size0019]; exact i.isLt⟩
  change (entry0019 i).check = true at h
  rcases fields0019 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0020 : OriginalRow227TriangleForward0020.entries.size = 32 := rfl

def entry0020 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0020.entries[i.val]'(by rw [size0020]; exact i.isLt)

theorem fields0020 (i : Fin 32) :
    (entry0020 i).IA = shift ∧ (entry0020 i).ID = S (129 + i.val + 1) ∧
      (entry0020 i).IC = S 2 ∧ (entry0020 i).Inext = T 1 (129 + i.val + 1) ∧
      (entry0020 i).Icur = T 1 (129 + i.val) ∧
      (entry0020 i).output = T 2 (129 + i.val) ∧
      (entry0020 i).charge = charge 1 (129 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0036_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0020 (i : Fin 32) :
    forwardStepOK (-768) (charge 1 (129 + i.val)) shift
      (S (129 + i.val + 1)) (S 2) (T 1 (129 + i.val + 1))
      (T 1 (129 + i.val)) (T 2 (129 + i.val))
      (OriginalRow227Roots.root_pos 2 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 1 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0020.entries OriginalRow227TriangleForward0020.checked
    ⟨i.val, by rw [size0020]; exact i.isLt⟩
  change (entry0020 i).check = true at h
  rcases fields0020 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0021 : OriginalRow227TriangleForward0021.entries.size = 32 := rfl

def entry0021 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0021.entries[i.val]'(by rw [size0021]; exact i.isLt)

theorem fields0021 (i : Fin 32) :
    (entry0021 i).IA = shift ∧ (entry0021 i).ID = S (161 + i.val + 1) ∧
      (entry0021 i).IC = S 2 ∧ (entry0021 i).Inext = T 1 (161 + i.val + 1) ∧
      (entry0021 i).Icur = T 1 (161 + i.val) ∧
      (entry0021 i).output = T 2 (161 + i.val) ∧
      (entry0021 i).charge = charge 1 (161 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0037_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0021 (i : Fin 32) :
    forwardStepOK (-768) (charge 1 (161 + i.val)) shift
      (S (161 + i.val + 1)) (S 2) (T 1 (161 + i.val + 1))
      (T 1 (161 + i.val)) (T 2 (161 + i.val))
      (OriginalRow227Roots.root_pos 2 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 1 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0021.entries OriginalRow227TriangleForward0021.checked
    ⟨i.val, by rw [size0021]; exact i.isLt⟩
  change (entry0021 i).check = true at h
  rcases fields0021 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0022 : OriginalRow227TriangleForward0022.entries.size = 32 := rfl

def entry0022 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0022.entries[i.val]'(by rw [size0022]; exact i.isLt)

theorem fields0022 (i : Fin 32) :
    (entry0022 i).IA = shift ∧ (entry0022 i).ID = S (193 + i.val + 1) ∧
      (entry0022 i).IC = S 2 ∧ (entry0022 i).Inext = T 1 (193 + i.val + 1) ∧
      (entry0022 i).Icur = T 1 (193 + i.val) ∧
      (entry0022 i).output = T 2 (193 + i.val) ∧
      (entry0022 i).charge = charge 1 (193 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0038_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0022 (i : Fin 32) :
    forwardStepOK (-768) (charge 1 (193 + i.val)) shift
      (S (193 + i.val + 1)) (S 2) (T 1 (193 + i.val + 1))
      (T 1 (193 + i.val)) (T 2 (193 + i.val))
      (OriginalRow227Roots.root_pos 2 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 1 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0022.entries OriginalRow227TriangleForward0022.checked
    ⟨i.val, by rw [size0022]; exact i.isLt⟩
  change (entry0022 i).check = true at h
  rcases fields0022 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0023 : OriginalRow227TriangleForward0023.entries.size = 32 := rfl

def entry0023 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0023.entries[i.val]'(by rw [size0023]; exact i.isLt)

theorem fields0023 (i : Fin 32) :
    (entry0023 i).IA = shift ∧ (entry0023 i).ID = S (225 + i.val + 1) ∧
      (entry0023 i).IC = S 2 ∧ (entry0023 i).Inext = T 1 (225 + i.val + 1) ∧
      (entry0023 i).Icur = T 1 (225 + i.val) ∧
      (entry0023 i).output = T 2 (225 + i.val) ∧
      (entry0023 i).charge = charge 1 (225 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0039_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0023 (i : Fin 32) :
    forwardStepOK (-768) (charge 1 (225 + i.val)) shift
      (S (225 + i.val + 1)) (S 2) (T 1 (225 + i.val + 1))
      (T 1 (225 + i.val)) (T 2 (225 + i.val))
      (OriginalRow227Roots.root_pos 2 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 1 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0023.entries OriginalRow227TriangleForward0023.checked
    ⟨i.val, by rw [size0023]; exact i.isLt⟩
  change (entry0023 i).check = true at h
  rcases fields0023 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0024 : OriginalRow227TriangleForward0024.entries.size = 32 := rfl

def entry0024 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0024.entries[i.val]'(by rw [size0024]; exact i.isLt)

theorem fields0024 (i : Fin 32) :
    (entry0024 i).IA = shift ∧ (entry0024 i).ID = S (257 + i.val + 1) ∧
      (entry0024 i).IC = S 2 ∧ (entry0024 i).Inext = T 1 (257 + i.val + 1) ∧
      (entry0024 i).Icur = T 1 (257 + i.val) ∧
      (entry0024 i).output = T 2 (257 + i.val) ∧
      (entry0024 i).charge = charge 1 (257 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0040_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0024 (i : Fin 32) :
    forwardStepOK (-768) (charge 1 (257 + i.val)) shift
      (S (257 + i.val + 1)) (S 2) (T 1 (257 + i.val + 1))
      (T 1 (257 + i.val)) (T 2 (257 + i.val))
      (OriginalRow227Roots.root_pos 2 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 1 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0024.entries OriginalRow227TriangleForward0024.checked
    ⟨i.val, by rw [size0024]; exact i.isLt⟩
  change (entry0024 i).check = true at h
  rcases fields0024 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0025 : OriginalRow227TriangleForward0025.entries.size = 32 := rfl

def entry0025 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0025.entries[i.val]'(by rw [size0025]; exact i.isLt)

theorem fields0025 (i : Fin 32) :
    (entry0025 i).IA = shift ∧ (entry0025 i).ID = S (289 + i.val + 1) ∧
      (entry0025 i).IC = S 2 ∧ (entry0025 i).Inext = T 1 (289 + i.val + 1) ∧
      (entry0025 i).Icur = T 1 (289 + i.val) ∧
      (entry0025 i).output = T 2 (289 + i.val) ∧
      (entry0025 i).charge = charge 1 (289 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0041_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0025 (i : Fin 32) :
    forwardStepOK (-768) (charge 1 (289 + i.val)) shift
      (S (289 + i.val + 1)) (S 2) (T 1 (289 + i.val + 1))
      (T 1 (289 + i.val)) (T 2 (289 + i.val))
      (OriginalRow227Roots.root_pos 2 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 1 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0025.entries OriginalRow227TriangleForward0025.checked
    ⟨i.val, by rw [size0025]; exact i.isLt⟩
  change (entry0025 i).check = true at h
  rcases fields0025 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0026 : OriginalRow227TriangleForward0026.entries.size = 32 := rfl

def entry0026 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0026.entries[i.val]'(by rw [size0026]; exact i.isLt)

theorem fields0026 (i : Fin 32) :
    (entry0026 i).IA = shift ∧ (entry0026 i).ID = S (321 + i.val + 1) ∧
      (entry0026 i).IC = S 2 ∧ (entry0026 i).Inext = T 1 (321 + i.val + 1) ∧
      (entry0026 i).Icur = T 1 (321 + i.val) ∧
      (entry0026 i).output = T 2 (321 + i.val) ∧
      (entry0026 i).charge = charge 1 (321 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0042_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0026 (i : Fin 32) :
    forwardStepOK (-768) (charge 1 (321 + i.val)) shift
      (S (321 + i.val + 1)) (S 2) (T 1 (321 + i.val + 1))
      (T 1 (321 + i.val)) (T 2 (321 + i.val))
      (OriginalRow227Roots.root_pos 2 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 1 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0026.entries OriginalRow227TriangleForward0026.checked
    ⟨i.val, by rw [size0026]; exact i.isLt⟩
  change (entry0026 i).check = true at h
  rcases fields0026 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0027 : OriginalRow227TriangleForward0027.entries.size = 32 := rfl

def entry0027 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0027.entries[i.val]'(by rw [size0027]; exact i.isLt)

theorem fields0027 (i : Fin 32) :
    (entry0027 i).IA = shift ∧ (entry0027 i).ID = S (353 + i.val + 1) ∧
      (entry0027 i).IC = S 2 ∧ (entry0027 i).Inext = T 1 (353 + i.val + 1) ∧
      (entry0027 i).Icur = T 1 (353 + i.val) ∧
      (entry0027 i).output = T 2 (353 + i.val) ∧
      (entry0027 i).charge = charge 1 (353 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0043_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0027 (i : Fin 32) :
    forwardStepOK (-768) (charge 1 (353 + i.val)) shift
      (S (353 + i.val + 1)) (S 2) (T 1 (353 + i.val + 1))
      (T 1 (353 + i.val)) (T 2 (353 + i.val))
      (OriginalRow227Roots.root_pos 2 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 1 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0027.entries OriginalRow227TriangleForward0027.checked
    ⟨i.val, by rw [size0027]; exact i.isLt⟩
  change (entry0027 i).check = true at h
  rcases fields0027 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0028 : OriginalRow227TriangleForward0028.entries.size = 32 := rfl

def entry0028 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0028.entries[i.val]'(by rw [size0028]; exact i.isLt)

theorem fields0028 (i : Fin 32) :
    (entry0028 i).IA = shift ∧ (entry0028 i).ID = S (385 + i.val + 1) ∧
      (entry0028 i).IC = S 2 ∧ (entry0028 i).Inext = T 1 (385 + i.val + 1) ∧
      (entry0028 i).Icur = T 1 (385 + i.val) ∧
      (entry0028 i).output = T 2 (385 + i.val) ∧
      (entry0028 i).charge = charge 1 (385 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0044_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0028 (i : Fin 32) :
    forwardStepOK (-768) (charge 1 (385 + i.val)) shift
      (S (385 + i.val + 1)) (S 2) (T 1 (385 + i.val + 1))
      (T 1 (385 + i.val)) (T 2 (385 + i.val))
      (OriginalRow227Roots.root_pos 2 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 1 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0028.entries OriginalRow227TriangleForward0028.checked
    ⟨i.val, by rw [size0028]; exact i.isLt⟩
  change (entry0028 i).check = true at h
  rcases fields0028 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0029 : OriginalRow227TriangleForward0029.entries.size = 32 := rfl

def entry0029 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0029.entries[i.val]'(by rw [size0029]; exact i.isLt)

theorem fields0029 (i : Fin 32) :
    (entry0029 i).IA = shift ∧ (entry0029 i).ID = S (417 + i.val + 1) ∧
      (entry0029 i).IC = S 2 ∧ (entry0029 i).Inext = T 1 (417 + i.val + 1) ∧
      (entry0029 i).Icur = T 1 (417 + i.val) ∧
      (entry0029 i).output = T 2 (417 + i.val) ∧
      (entry0029 i).charge = charge 1 (417 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0045_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0029 (i : Fin 32) :
    forwardStepOK (-768) (charge 1 (417 + i.val)) shift
      (S (417 + i.val + 1)) (S 2) (T 1 (417 + i.val + 1))
      (T 1 (417 + i.val)) (T 2 (417 + i.val))
      (OriginalRow227Roots.root_pos 2 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 1 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0029.entries OriginalRow227TriangleForward0029.checked
    ⟨i.val, by rw [size0029]; exact i.isLt⟩
  change (entry0029 i).check = true at h
  rcases fields0029 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0030 : OriginalRow227TriangleForward0030.entries.size = 32 := rfl

def entry0030 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0030.entries[i.val]'(by rw [size0030]; exact i.isLt)

theorem fields0030 (i : Fin 32) :
    (entry0030 i).IA = shift ∧ (entry0030 i).ID = S (449 + i.val + 1) ∧
      (entry0030 i).IC = S 2 ∧ (entry0030 i).Inext = T 1 (449 + i.val + 1) ∧
      (entry0030 i).Icur = T 1 (449 + i.val) ∧
      (entry0030 i).output = T 2 (449 + i.val) ∧
      (entry0030 i).charge = charge 1 (449 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0046_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0030 (i : Fin 32) :
    forwardStepOK (-768) (charge 1 (449 + i.val)) shift
      (S (449 + i.val + 1)) (S 2) (T 1 (449 + i.val + 1))
      (T 1 (449 + i.val)) (T 2 (449 + i.val))
      (OriginalRow227Roots.root_pos 2 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 1 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0030.entries OriginalRow227TriangleForward0030.checked
    ⟨i.val, by rw [size0030]; exact i.isLt⟩
  change (entry0030 i).check = true at h
  rcases fields0030 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0031 : OriginalRow227TriangleForward0031.entries.size = 19 := rfl

def entry0031 (i : Fin 19) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0031.entries[i.val]'(by rw [size0031]; exact i.isLt)

theorem fields0031 (i : Fin 19) :
    (entry0031 i).IA = shift ∧ (entry0031 i).ID = S (481 + i.val + 1) ∧
      (entry0031 i).IC = S 2 ∧ (entry0031 i).Inext = T 1 (481 + i.val + 1) ∧
      (entry0031 i).Icur = T 1 (481 + i.val) ∧
      (entry0031 i).output = T 2 (481 + i.val) ∧
      (entry0031 i).charge = charge 1 (481 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root483).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root484).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root485).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root486).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root487).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root488).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root489).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root490).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root491).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root492).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root493).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root494).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root495).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root496).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root497).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root498).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root499).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root500).symm, (OriginalRow227RootBindings00.S_eq_root2).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow002.block0047_value ⟨18, by decide⟩).symm, rfl⟩

theorem step0031 (i : Fin 19) :
    forwardStepOK (-768) (charge 1 (481 + i.val)) shift
      (S (481 + i.val + 1)) (S 2) (T 1 (481 + i.val + 1))
      (T 1 (481 + i.val)) (T 2 (481 + i.val))
      (OriginalRow227Roots.root_pos 2 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 1 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0031.entries OriginalRow227TriangleForward0031.checked
    ⟨i.val, by rw [size0031]; exact i.isLt⟩
  change (entry0031 i).check = true at h
  rcases fields0031 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 1 ≤ d) (hhi : d < 500) :
    forwardStepOK (-768) (charge 1 d) shift (S (d + 1)) (S 2)
      (T 1 (d + 1)) (T 1 d) (T 2 d)
      (OriginalRow227Roots.root_pos 2 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 1 (by decide)) = true := by
  by_cases h257 : d < 257
  ·
    by_cases h129 : d < 129
    ·
      by_cases h65 : d < 65
      ·
        by_cases h33 : d < 33
        ·
          have hi : d - 1 < 32 := by omega
          have heq : 1 + (d - 1) = d := by omega
          simpa only [heq] using step0016 ⟨d - 1, hi⟩
        ·
          have hi : d - 33 < 32 := by omega
          have heq : 33 + (d - 33) = d := by omega
          simpa only [heq] using step0017 ⟨d - 33, hi⟩
      ·
        by_cases h97 : d < 97
        ·
          have hi : d - 65 < 32 := by omega
          have heq : 65 + (d - 65) = d := by omega
          simpa only [heq] using step0018 ⟨d - 65, hi⟩
        ·
          have hi : d - 97 < 32 := by omega
          have heq : 97 + (d - 97) = d := by omega
          simpa only [heq] using step0019 ⟨d - 97, hi⟩
    ·
      by_cases h193 : d < 193
      ·
        by_cases h161 : d < 161
        ·
          have hi : d - 129 < 32 := by omega
          have heq : 129 + (d - 129) = d := by omega
          simpa only [heq] using step0020 ⟨d - 129, hi⟩
        ·
          have hi : d - 161 < 32 := by omega
          have heq : 161 + (d - 161) = d := by omega
          simpa only [heq] using step0021 ⟨d - 161, hi⟩
      ·
        by_cases h225 : d < 225
        ·
          have hi : d - 193 < 32 := by omega
          have heq : 193 + (d - 193) = d := by omega
          simpa only [heq] using step0022 ⟨d - 193, hi⟩
        ·
          have hi : d - 225 < 32 := by omega
          have heq : 225 + (d - 225) = d := by omega
          simpa only [heq] using step0023 ⟨d - 225, hi⟩
  ·
    by_cases h385 : d < 385
    ·
      by_cases h321 : d < 321
      ·
        by_cases h289 : d < 289
        ·
          have hi : d - 257 < 32 := by omega
          have heq : 257 + (d - 257) = d := by omega
          simpa only [heq] using step0024 ⟨d - 257, hi⟩
        ·
          have hi : d - 289 < 32 := by omega
          have heq : 289 + (d - 289) = d := by omega
          simpa only [heq] using step0025 ⟨d - 289, hi⟩
      ·
        by_cases h353 : d < 353
        ·
          have hi : d - 321 < 32 := by omega
          have heq : 321 + (d - 321) = d := by omega
          simpa only [heq] using step0026 ⟨d - 321, hi⟩
        ·
          have hi : d - 353 < 32 := by omega
          have heq : 353 + (d - 353) = d := by omega
          simpa only [heq] using step0027 ⟨d - 353, hi⟩
    ·
      by_cases h449 : d < 449
      ·
        by_cases h417 : d < 417
        ·
          have hi : d - 385 < 32 := by omega
          have heq : 385 + (d - 385) = d := by omega
          simpa only [heq] using step0028 ⟨d - 385, hi⟩
        ·
          have hi : d - 417 < 32 := by omega
          have heq : 417 + (d - 417) = d := by omega
          simpa only [heq] using step0029 ⟨d - 417, hi⟩
      ·
        by_cases h481 : d < 481
        ·
          have hi : d - 449 < 32 := by omega
          have heq : 449 + (d - 449) = d := by omega
          simpa only [heq] using step0030 ⟨d - 449, hi⟩
        ·
          have hi : d - 481 < 19 := by omega
          have heq : 481 + (d - 481) = d := by omega
          simpa only [heq] using step0031 ⟨d - 481, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.fields0016,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.step0016,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.fields0017,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.step0017,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.fields0018,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.step0018,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.fields0019,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.step0019,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.fields0020,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.step0020,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.fields0021,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.step0021,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.fields0022,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.step0022,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.fields0023,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.step0023,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.fields0024,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.step0024,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.fields0025,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.step0025,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.fields0026,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.step0026,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.fields0027,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.step0027,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.fields0028,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.step0028,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.fields0029,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.step0029,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.fields0030,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.step0030,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.fields0031,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.step0031,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow002
