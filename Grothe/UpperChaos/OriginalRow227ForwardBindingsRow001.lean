import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001
import Grothe.UpperChaos.OriginalRow227TriangleForward0000
import Grothe.UpperChaos.OriginalRow227TriangleForward0001
import Grothe.UpperChaos.OriginalRow227TriangleForward0002
import Grothe.UpperChaos.OriginalRow227TriangleForward0003
import Grothe.UpperChaos.OriginalRow227TriangleForward0004
import Grothe.UpperChaos.OriginalRow227TriangleForward0005
import Grothe.UpperChaos.OriginalRow227TriangleForward0006
import Grothe.UpperChaos.OriginalRow227TriangleForward0007
import Grothe.UpperChaos.OriginalRow227TriangleForward0008
import Grothe.UpperChaos.OriginalRow227TriangleForward0009
import Grothe.UpperChaos.OriginalRow227TriangleForward0010
import Grothe.UpperChaos.OriginalRow227TriangleForward0011
import Grothe.UpperChaos.OriginalRow227TriangleForward0012
import Grothe.UpperChaos.OriginalRow227TriangleForward0013
import Grothe.UpperChaos.OriginalRow227TriangleForward0014
import Grothe.UpperChaos.OriginalRow227TriangleForward0015

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0000 : OriginalRow227TriangleForward0000.entries.size = 32 := rfl

def entry0000 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0000.entries[i.val]'(by rw [size0000]; exact i.isLt)

theorem fields0000 (i : Fin 32) :
    (entry0000 i).IA = shift ∧ (entry0000 i).ID = S (0 + i.val + 1) ∧
      (entry0000 i).IC = S 1 ∧ (entry0000 i).Inext = T 0 (0 + i.val + 1) ∧
      (entry0000 i).Icur = T 0 (0 + i.val) ∧
      (entry0000 i).output = T 1 (0 + i.val) ∧
      (entry0000 i).charge = charge 0 (0 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root1).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root2).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root3).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root4).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root5).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root6).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root7).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root8).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root9).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root10).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root11).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root12).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root13).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root14).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root15).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root16).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root17).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root18).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root19).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0000_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0016_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0000 (i : Fin 32) :
    forwardStepOK (-768) (charge 0 (0 + i.val)) shift
      (S (0 + i.val + 1)) (S 1) (T 0 (0 + i.val + 1))
      (T 0 (0 + i.val)) (T 1 (0 + i.val))
      (OriginalRow227Roots.root_pos 1 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 0 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0000.entries OriginalRow227TriangleForward0000.checked
    ⟨i.val, by rw [size0000]; exact i.isLt⟩
  change (entry0000 i).check = true at h
  rcases fields0000 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0001 : OriginalRow227TriangleForward0001.entries.size = 32 := rfl

def entry0001 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0001.entries[i.val]'(by rw [size0001]; exact i.isLt)

theorem fields0001 (i : Fin 32) :
    (entry0001 i).IA = shift ∧ (entry0001 i).ID = S (32 + i.val + 1) ∧
      (entry0001 i).IC = S 1 ∧ (entry0001 i).Inext = T 0 (32 + i.val + 1) ∧
      (entry0001 i).Icur = T 0 (32 + i.val) ∧
      (entry0001 i).output = T 1 (32 + i.val) ∧
      (entry0001 i).charge = charge 0 (32 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0001_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0017_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0001 (i : Fin 32) :
    forwardStepOK (-768) (charge 0 (32 + i.val)) shift
      (S (32 + i.val + 1)) (S 1) (T 0 (32 + i.val + 1))
      (T 0 (32 + i.val)) (T 1 (32 + i.val))
      (OriginalRow227Roots.root_pos 1 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 0 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0001.entries OriginalRow227TriangleForward0001.checked
    ⟨i.val, by rw [size0001]; exact i.isLt⟩
  change (entry0001 i).check = true at h
  rcases fields0001 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0002 : OriginalRow227TriangleForward0002.entries.size = 32 := rfl

def entry0002 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0002.entries[i.val]'(by rw [size0002]; exact i.isLt)

theorem fields0002 (i : Fin 32) :
    (entry0002 i).IA = shift ∧ (entry0002 i).ID = S (64 + i.val + 1) ∧
      (entry0002 i).IC = S 1 ∧ (entry0002 i).Inext = T 0 (64 + i.val + 1) ∧
      (entry0002 i).Icur = T 0 (64 + i.val) ∧
      (entry0002 i).output = T 1 (64 + i.val) ∧
      (entry0002 i).charge = charge 0 (64 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0002_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0018_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0002 (i : Fin 32) :
    forwardStepOK (-768) (charge 0 (64 + i.val)) shift
      (S (64 + i.val + 1)) (S 1) (T 0 (64 + i.val + 1))
      (T 0 (64 + i.val)) (T 1 (64 + i.val))
      (OriginalRow227Roots.root_pos 1 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 0 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0002.entries OriginalRow227TriangleForward0002.checked
    ⟨i.val, by rw [size0002]; exact i.isLt⟩
  change (entry0002 i).check = true at h
  rcases fields0002 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0003 : OriginalRow227TriangleForward0003.entries.size = 32 := rfl

def entry0003 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0003.entries[i.val]'(by rw [size0003]; exact i.isLt)

theorem fields0003 (i : Fin 32) :
    (entry0003 i).IA = shift ∧ (entry0003 i).ID = S (96 + i.val + 1) ∧
      (entry0003 i).IC = S 1 ∧ (entry0003 i).Inext = T 0 (96 + i.val + 1) ∧
      (entry0003 i).Icur = T 0 (96 + i.val) ∧
      (entry0003 i).output = T 1 (96 + i.val) ∧
      (entry0003 i).charge = charge 0 (96 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0003_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0019_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0003 (i : Fin 32) :
    forwardStepOK (-768) (charge 0 (96 + i.val)) shift
      (S (96 + i.val + 1)) (S 1) (T 0 (96 + i.val + 1))
      (T 0 (96 + i.val)) (T 1 (96 + i.val))
      (OriginalRow227Roots.root_pos 1 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 0 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0003.entries OriginalRow227TriangleForward0003.checked
    ⟨i.val, by rw [size0003]; exact i.isLt⟩
  change (entry0003 i).check = true at h
  rcases fields0003 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0004 : OriginalRow227TriangleForward0004.entries.size = 32 := rfl

def entry0004 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0004.entries[i.val]'(by rw [size0004]; exact i.isLt)

theorem fields0004 (i : Fin 32) :
    (entry0004 i).IA = shift ∧ (entry0004 i).ID = S (128 + i.val + 1) ∧
      (entry0004 i).IC = S 1 ∧ (entry0004 i).Inext = T 0 (128 + i.val + 1) ∧
      (entry0004 i).Icur = T 0 (128 + i.val) ∧
      (entry0004 i).output = T 1 (128 + i.val) ∧
      (entry0004 i).charge = charge 0 (128 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0004_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0020_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0004 (i : Fin 32) :
    forwardStepOK (-768) (charge 0 (128 + i.val)) shift
      (S (128 + i.val + 1)) (S 1) (T 0 (128 + i.val + 1))
      (T 0 (128 + i.val)) (T 1 (128 + i.val))
      (OriginalRow227Roots.root_pos 1 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 0 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0004.entries OriginalRow227TriangleForward0004.checked
    ⟨i.val, by rw [size0004]; exact i.isLt⟩
  change (entry0004 i).check = true at h
  rcases fields0004 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0005 : OriginalRow227TriangleForward0005.entries.size = 32 := rfl

def entry0005 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0005.entries[i.val]'(by rw [size0005]; exact i.isLt)

theorem fields0005 (i : Fin 32) :
    (entry0005 i).IA = shift ∧ (entry0005 i).ID = S (160 + i.val + 1) ∧
      (entry0005 i).IC = S 1 ∧ (entry0005 i).Inext = T 0 (160 + i.val + 1) ∧
      (entry0005 i).Icur = T 0 (160 + i.val) ∧
      (entry0005 i).output = T 1 (160 + i.val) ∧
      (entry0005 i).charge = charge 0 (160 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0005_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0021_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0005 (i : Fin 32) :
    forwardStepOK (-768) (charge 0 (160 + i.val)) shift
      (S (160 + i.val + 1)) (S 1) (T 0 (160 + i.val + 1))
      (T 0 (160 + i.val)) (T 1 (160 + i.val))
      (OriginalRow227Roots.root_pos 1 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 0 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0005.entries OriginalRow227TriangleForward0005.checked
    ⟨i.val, by rw [size0005]; exact i.isLt⟩
  change (entry0005 i).check = true at h
  rcases fields0005 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0006 : OriginalRow227TriangleForward0006.entries.size = 32 := rfl

def entry0006 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0006.entries[i.val]'(by rw [size0006]; exact i.isLt)

theorem fields0006 (i : Fin 32) :
    (entry0006 i).IA = shift ∧ (entry0006 i).ID = S (192 + i.val + 1) ∧
      (entry0006 i).IC = S 1 ∧ (entry0006 i).Inext = T 0 (192 + i.val + 1) ∧
      (entry0006 i).Icur = T 0 (192 + i.val) ∧
      (entry0006 i).output = T 1 (192 + i.val) ∧
      (entry0006 i).charge = charge 0 (192 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0006_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0022_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0006 (i : Fin 32) :
    forwardStepOK (-768) (charge 0 (192 + i.val)) shift
      (S (192 + i.val + 1)) (S 1) (T 0 (192 + i.val + 1))
      (T 0 (192 + i.val)) (T 1 (192 + i.val))
      (OriginalRow227Roots.root_pos 1 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 0 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0006.entries OriginalRow227TriangleForward0006.checked
    ⟨i.val, by rw [size0006]; exact i.isLt⟩
  change (entry0006 i).check = true at h
  rcases fields0006 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0007 : OriginalRow227TriangleForward0007.entries.size = 32 := rfl

def entry0007 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0007.entries[i.val]'(by rw [size0007]; exact i.isLt)

theorem fields0007 (i : Fin 32) :
    (entry0007 i).IA = shift ∧ (entry0007 i).ID = S (224 + i.val + 1) ∧
      (entry0007 i).IC = S 1 ∧ (entry0007 i).Inext = T 0 (224 + i.val + 1) ∧
      (entry0007 i).Icur = T 0 (224 + i.val) ∧
      (entry0007 i).output = T 1 (224 + i.val) ∧
      (entry0007 i).charge = charge 0 (224 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0007_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0023_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0007 (i : Fin 32) :
    forwardStepOK (-768) (charge 0 (224 + i.val)) shift
      (S (224 + i.val + 1)) (S 1) (T 0 (224 + i.val + 1))
      (T 0 (224 + i.val)) (T 1 (224 + i.val))
      (OriginalRow227Roots.root_pos 1 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 0 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0007.entries OriginalRow227TriangleForward0007.checked
    ⟨i.val, by rw [size0007]; exact i.isLt⟩
  change (entry0007 i).check = true at h
  rcases fields0007 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0008 : OriginalRow227TriangleForward0008.entries.size = 32 := rfl

def entry0008 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0008.entries[i.val]'(by rw [size0008]; exact i.isLt)

theorem fields0008 (i : Fin 32) :
    (entry0008 i).IA = shift ∧ (entry0008 i).ID = S (256 + i.val + 1) ∧
      (entry0008 i).IC = S 1 ∧ (entry0008 i).Inext = T 0 (256 + i.val + 1) ∧
      (entry0008 i).Icur = T 0 (256 + i.val) ∧
      (entry0008 i).output = T 1 (256 + i.val) ∧
      (entry0008 i).charge = charge 0 (256 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0008_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0024_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0008 (i : Fin 32) :
    forwardStepOK (-768) (charge 0 (256 + i.val)) shift
      (S (256 + i.val + 1)) (S 1) (T 0 (256 + i.val + 1))
      (T 0 (256 + i.val)) (T 1 (256 + i.val))
      (OriginalRow227Roots.root_pos 1 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 0 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0008.entries OriginalRow227TriangleForward0008.checked
    ⟨i.val, by rw [size0008]; exact i.isLt⟩
  change (entry0008 i).check = true at h
  rcases fields0008 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0009 : OriginalRow227TriangleForward0009.entries.size = 32 := rfl

def entry0009 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0009.entries[i.val]'(by rw [size0009]; exact i.isLt)

theorem fields0009 (i : Fin 32) :
    (entry0009 i).IA = shift ∧ (entry0009 i).ID = S (288 + i.val + 1) ∧
      (entry0009 i).IC = S 1 ∧ (entry0009 i).Inext = T 0 (288 + i.val + 1) ∧
      (entry0009 i).Icur = T 0 (288 + i.val) ∧
      (entry0009 i).output = T 1 (288 + i.val) ∧
      (entry0009 i).charge = charge 0 (288 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0009_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0025_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0009 (i : Fin 32) :
    forwardStepOK (-768) (charge 0 (288 + i.val)) shift
      (S (288 + i.val + 1)) (S 1) (T 0 (288 + i.val + 1))
      (T 0 (288 + i.val)) (T 1 (288 + i.val))
      (OriginalRow227Roots.root_pos 1 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 0 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0009.entries OriginalRow227TriangleForward0009.checked
    ⟨i.val, by rw [size0009]; exact i.isLt⟩
  change (entry0009 i).check = true at h
  rcases fields0009 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0010 : OriginalRow227TriangleForward0010.entries.size = 32 := rfl

def entry0010 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0010.entries[i.val]'(by rw [size0010]; exact i.isLt)

theorem fields0010 (i : Fin 32) :
    (entry0010 i).IA = shift ∧ (entry0010 i).ID = S (320 + i.val + 1) ∧
      (entry0010 i).IC = S 1 ∧ (entry0010 i).Inext = T 0 (320 + i.val + 1) ∧
      (entry0010 i).Icur = T 0 (320 + i.val) ∧
      (entry0010 i).output = T 1 (320 + i.val) ∧
      (entry0010 i).charge = charge 0 (320 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0010_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0026_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0010 (i : Fin 32) :
    forwardStepOK (-768) (charge 0 (320 + i.val)) shift
      (S (320 + i.val + 1)) (S 1) (T 0 (320 + i.val + 1))
      (T 0 (320 + i.val)) (T 1 (320 + i.val))
      (OriginalRow227Roots.root_pos 1 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 0 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0010.entries OriginalRow227TriangleForward0010.checked
    ⟨i.val, by rw [size0010]; exact i.isLt⟩
  change (entry0010 i).check = true at h
  rcases fields0010 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0011 : OriginalRow227TriangleForward0011.entries.size = 32 := rfl

def entry0011 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0011.entries[i.val]'(by rw [size0011]; exact i.isLt)

theorem fields0011 (i : Fin 32) :
    (entry0011 i).IA = shift ∧ (entry0011 i).ID = S (352 + i.val + 1) ∧
      (entry0011 i).IC = S 1 ∧ (entry0011 i).Inext = T 0 (352 + i.val + 1) ∧
      (entry0011 i).Icur = T 0 (352 + i.val) ∧
      (entry0011 i).output = T 1 (352 + i.val) ∧
      (entry0011 i).charge = charge 0 (352 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0011_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0027_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0011 (i : Fin 32) :
    forwardStepOK (-768) (charge 0 (352 + i.val)) shift
      (S (352 + i.val + 1)) (S 1) (T 0 (352 + i.val + 1))
      (T 0 (352 + i.val)) (T 1 (352 + i.val))
      (OriginalRow227Roots.root_pos 1 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 0 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0011.entries OriginalRow227TriangleForward0011.checked
    ⟨i.val, by rw [size0011]; exact i.isLt⟩
  change (entry0011 i).check = true at h
  rcases fields0011 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0012 : OriginalRow227TriangleForward0012.entries.size = 32 := rfl

def entry0012 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0012.entries[i.val]'(by rw [size0012]; exact i.isLt)

theorem fields0012 (i : Fin 32) :
    (entry0012 i).IA = shift ∧ (entry0012 i).ID = S (384 + i.val + 1) ∧
      (entry0012 i).IC = S 1 ∧ (entry0012 i).Inext = T 0 (384 + i.val + 1) ∧
      (entry0012 i).Icur = T 0 (384 + i.val) ∧
      (entry0012 i).output = T 1 (384 + i.val) ∧
      (entry0012 i).charge = charge 0 (384 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0012_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0028_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0012 (i : Fin 32) :
    forwardStepOK (-768) (charge 0 (384 + i.val)) shift
      (S (384 + i.val + 1)) (S 1) (T 0 (384 + i.val + 1))
      (T 0 (384 + i.val)) (T 1 (384 + i.val))
      (OriginalRow227Roots.root_pos 1 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 0 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0012.entries OriginalRow227TriangleForward0012.checked
    ⟨i.val, by rw [size0012]; exact i.isLt⟩
  change (entry0012 i).check = true at h
  rcases fields0012 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0013 : OriginalRow227TriangleForward0013.entries.size = 32 := rfl

def entry0013 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0013.entries[i.val]'(by rw [size0013]; exact i.isLt)

theorem fields0013 (i : Fin 32) :
    (entry0013 i).IA = shift ∧ (entry0013 i).ID = S (416 + i.val + 1) ∧
      (entry0013 i).IC = S 1 ∧ (entry0013 i).Inext = T 0 (416 + i.val + 1) ∧
      (entry0013 i).Icur = T 0 (416 + i.val) ∧
      (entry0013 i).output = T 1 (416 + i.val) ∧
      (entry0013 i).charge = charge 0 (416 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0013_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0029_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0013 (i : Fin 32) :
    forwardStepOK (-768) (charge 0 (416 + i.val)) shift
      (S (416 + i.val + 1)) (S 1) (T 0 (416 + i.val + 1))
      (T 0 (416 + i.val)) (T 1 (416 + i.val))
      (OriginalRow227Roots.root_pos 1 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 0 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0013.entries OriginalRow227TriangleForward0013.checked
    ⟨i.val, by rw [size0013]; exact i.isLt⟩
  change (entry0013 i).check = true at h
  rcases fields0013 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0014 : OriginalRow227TriangleForward0014.entries.size = 32 := rfl

def entry0014 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0014.entries[i.val]'(by rw [size0014]; exact i.isLt)

theorem fields0014 (i : Fin 32) :
    (entry0014 i).IA = shift ∧ (entry0014 i).ID = S (448 + i.val + 1) ∧
      (entry0014 i).IC = S 1 ∧ (entry0014 i).Inext = T 0 (448 + i.val + 1) ∧
      (entry0014 i).Icur = T 0 (448 + i.val) ∧
      (entry0014 i).output = T 1 (448 + i.val) ∧
      (entry0014 i).charge = charge 0 (448 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0014_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0030_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0014 (i : Fin 32) :
    forwardStepOK (-768) (charge 0 (448 + i.val)) shift
      (S (448 + i.val + 1)) (S 1) (T 0 (448 + i.val + 1))
      (T 0 (448 + i.val)) (T 1 (448 + i.val))
      (OriginalRow227Roots.root_pos 1 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 0 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0014.entries OriginalRow227TriangleForward0014.checked
    ⟨i.val, by rw [size0014]; exact i.isLt⟩
  change (entry0014 i).check = true at h
  rcases fields0014 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0015 : OriginalRow227TriangleForward0015.entries.size = 21 := rfl

def entry0015 (i : Fin 21) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0015.entries[i.val]'(by rw [size0015]; exact i.isLt)

theorem fields0015 (i : Fin 21) :
    (entry0015 i).IA = shift ∧ (entry0015 i).ID = S (480 + i.val + 1) ∧
      (entry0015 i).IC = S 1 ∧ (entry0015 i).Inext = T 0 (480 + i.val + 1) ∧
      (entry0015 i).Icur = T 0 (480 + i.val) ∧
      (entry0015 i).output = T 1 (480 + i.val) ∧
      (entry0015 i).charge = charge 0 (480 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root483).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root484).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root485).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root486).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root487).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root488).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root489).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root490).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root491).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root492).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root493).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root494).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root495).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root496).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root497).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root498).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root499).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root500).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root501).symm, (OriginalRow227RootBindings00.S_eq_root1).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow000.block0015_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow001.block0031_value ⟨20, by decide⟩).symm, rfl⟩

theorem step0015 (i : Fin 21) :
    forwardStepOK (-768) (charge 0 (480 + i.val)) shift
      (S (480 + i.val + 1)) (S 1) (T 0 (480 + i.val + 1))
      (T 0 (480 + i.val)) (T 1 (480 + i.val))
      (OriginalRow227Roots.root_pos 1 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 0 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0015.entries OriginalRow227TriangleForward0015.checked
    ⟨i.val, by rw [size0015]; exact i.isLt⟩
  change (entry0015 i).check = true at h
  rcases fields0015 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 0 ≤ d) (hhi : d < 501) :
    forwardStepOK (-768) (charge 0 d) shift (S (d + 1)) (S 1)
      (T 0 (d + 1)) (T 0 d) (T 1 d)
      (OriginalRow227Roots.root_pos 1 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 0 (by decide)) = true := by
  by_cases h256 : d < 256
  ·
    by_cases h128 : d < 128
    ·
      by_cases h64 : d < 64
      ·
        by_cases h32 : d < 32
        ·
          have hi : d - 0 < 32 := by omega
          have heq : 0 + (d - 0) = d := by omega
          simpa only [heq] using step0000 ⟨d - 0, hi⟩
        ·
          have hi : d - 32 < 32 := by omega
          have heq : 32 + (d - 32) = d := by omega
          simpa only [heq] using step0001 ⟨d - 32, hi⟩
      ·
        by_cases h96 : d < 96
        ·
          have hi : d - 64 < 32 := by omega
          have heq : 64 + (d - 64) = d := by omega
          simpa only [heq] using step0002 ⟨d - 64, hi⟩
        ·
          have hi : d - 96 < 32 := by omega
          have heq : 96 + (d - 96) = d := by omega
          simpa only [heq] using step0003 ⟨d - 96, hi⟩
    ·
      by_cases h192 : d < 192
      ·
        by_cases h160 : d < 160
        ·
          have hi : d - 128 < 32 := by omega
          have heq : 128 + (d - 128) = d := by omega
          simpa only [heq] using step0004 ⟨d - 128, hi⟩
        ·
          have hi : d - 160 < 32 := by omega
          have heq : 160 + (d - 160) = d := by omega
          simpa only [heq] using step0005 ⟨d - 160, hi⟩
      ·
        by_cases h224 : d < 224
        ·
          have hi : d - 192 < 32 := by omega
          have heq : 192 + (d - 192) = d := by omega
          simpa only [heq] using step0006 ⟨d - 192, hi⟩
        ·
          have hi : d - 224 < 32 := by omega
          have heq : 224 + (d - 224) = d := by omega
          simpa only [heq] using step0007 ⟨d - 224, hi⟩
  ·
    by_cases h384 : d < 384
    ·
      by_cases h320 : d < 320
      ·
        by_cases h288 : d < 288
        ·
          have hi : d - 256 < 32 := by omega
          have heq : 256 + (d - 256) = d := by omega
          simpa only [heq] using step0008 ⟨d - 256, hi⟩
        ·
          have hi : d - 288 < 32 := by omega
          have heq : 288 + (d - 288) = d := by omega
          simpa only [heq] using step0009 ⟨d - 288, hi⟩
      ·
        by_cases h352 : d < 352
        ·
          have hi : d - 320 < 32 := by omega
          have heq : 320 + (d - 320) = d := by omega
          simpa only [heq] using step0010 ⟨d - 320, hi⟩
        ·
          have hi : d - 352 < 32 := by omega
          have heq : 352 + (d - 352) = d := by omega
          simpa only [heq] using step0011 ⟨d - 352, hi⟩
    ·
      by_cases h448 : d < 448
      ·
        by_cases h416 : d < 416
        ·
          have hi : d - 384 < 32 := by omega
          have heq : 384 + (d - 384) = d := by omega
          simpa only [heq] using step0012 ⟨d - 384, hi⟩
        ·
          have hi : d - 416 < 32 := by omega
          have heq : 416 + (d - 416) = d := by omega
          simpa only [heq] using step0013 ⟨d - 416, hi⟩
      ·
        by_cases h480 : d < 480
        ·
          have hi : d - 448 < 32 := by omega
          have heq : 448 + (d - 448) = d := by omega
          simpa only [heq] using step0014 ⟨d - 448, hi⟩
        ·
          have hi : d - 480 < 21 := by omega
          have heq : 480 + (d - 480) = d := by omega
          simpa only [heq] using step0015 ⟨d - 480, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.fields0000,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.step0000,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.fields0001,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.step0001,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.fields0002,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.step0002,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.fields0003,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.step0003,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.fields0004,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.step0004,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.fields0005,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.step0005,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.fields0006,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.step0006,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.fields0007,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.step0007,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.fields0008,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.step0008,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.fields0009,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.step0009,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.fields0010,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.step0010,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.fields0011,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.step0011,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.fields0012,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.step0012,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.fields0013,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.step0013,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.fields0014,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.step0014,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.fields0015,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.step0015,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow001
