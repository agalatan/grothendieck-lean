import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010
import Grothe.UpperChaos.OriginalRow227TriangleForward0144
import Grothe.UpperChaos.OriginalRow227TriangleForward0145
import Grothe.UpperChaos.OriginalRow227TriangleForward0146
import Grothe.UpperChaos.OriginalRow227TriangleForward0147
import Grothe.UpperChaos.OriginalRow227TriangleForward0148
import Grothe.UpperChaos.OriginalRow227TriangleForward0149
import Grothe.UpperChaos.OriginalRow227TriangleForward0150
import Grothe.UpperChaos.OriginalRow227TriangleForward0151
import Grothe.UpperChaos.OriginalRow227TriangleForward0152
import Grothe.UpperChaos.OriginalRow227TriangleForward0153
import Grothe.UpperChaos.OriginalRow227TriangleForward0154
import Grothe.UpperChaos.OriginalRow227TriangleForward0155
import Grothe.UpperChaos.OriginalRow227TriangleForward0156
import Grothe.UpperChaos.OriginalRow227TriangleForward0157
import Grothe.UpperChaos.OriginalRow227TriangleForward0158
import Grothe.UpperChaos.OriginalRow227TriangleForward0159

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0144 : OriginalRow227TriangleForward0144.entries.size = 32 := rfl

def entry0144 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0144.entries[i.val]'(by rw [size0144]; exact i.isLt)

theorem fields0144 (i : Fin 32) :
    (entry0144 i).IA = shift ∧ (entry0144 i).ID = S (9 + i.val + 1) ∧
      (entry0144 i).IC = S 10 ∧ (entry0144 i).Inext = T 9 (9 + i.val + 1) ∧
      (entry0144 i).Icur = T 9 (9 + i.val) ∧
      (entry0144 i).output = T 10 (9 + i.val) ∧
      (entry0144 i).charge = charge 9 (9 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root10).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root11).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root12).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root13).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root14).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root15).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root16).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root17).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root18).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root19).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0144_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0160_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0144 (i : Fin 32) :
    forwardStepOK (-768) (charge 9 (9 + i.val)) shift
      (S (9 + i.val + 1)) (S 10) (T 9 (9 + i.val + 1))
      (T 9 (9 + i.val)) (T 10 (9 + i.val))
      (OriginalRow227Roots.root_pos 10 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 9 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0144.entries OriginalRow227TriangleForward0144.checked
    ⟨i.val, by rw [size0144]; exact i.isLt⟩
  change (entry0144 i).check = true at h
  rcases fields0144 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0145 : OriginalRow227TriangleForward0145.entries.size = 32 := rfl

def entry0145 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0145.entries[i.val]'(by rw [size0145]; exact i.isLt)

theorem fields0145 (i : Fin 32) :
    (entry0145 i).IA = shift ∧ (entry0145 i).ID = S (41 + i.val + 1) ∧
      (entry0145 i).IC = S 10 ∧ (entry0145 i).Inext = T 9 (41 + i.val + 1) ∧
      (entry0145 i).Icur = T 9 (41 + i.val) ∧
      (entry0145 i).output = T 10 (41 + i.val) ∧
      (entry0145 i).charge = charge 9 (41 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0145_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0161_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0145 (i : Fin 32) :
    forwardStepOK (-768) (charge 9 (41 + i.val)) shift
      (S (41 + i.val + 1)) (S 10) (T 9 (41 + i.val + 1))
      (T 9 (41 + i.val)) (T 10 (41 + i.val))
      (OriginalRow227Roots.root_pos 10 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 9 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0145.entries OriginalRow227TriangleForward0145.checked
    ⟨i.val, by rw [size0145]; exact i.isLt⟩
  change (entry0145 i).check = true at h
  rcases fields0145 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0146 : OriginalRow227TriangleForward0146.entries.size = 32 := rfl

def entry0146 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0146.entries[i.val]'(by rw [size0146]; exact i.isLt)

theorem fields0146 (i : Fin 32) :
    (entry0146 i).IA = shift ∧ (entry0146 i).ID = S (73 + i.val + 1) ∧
      (entry0146 i).IC = S 10 ∧ (entry0146 i).Inext = T 9 (73 + i.val + 1) ∧
      (entry0146 i).Icur = T 9 (73 + i.val) ∧
      (entry0146 i).output = T 10 (73 + i.val) ∧
      (entry0146 i).charge = charge 9 (73 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0146_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0162_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0146 (i : Fin 32) :
    forwardStepOK (-768) (charge 9 (73 + i.val)) shift
      (S (73 + i.val + 1)) (S 10) (T 9 (73 + i.val + 1))
      (T 9 (73 + i.val)) (T 10 (73 + i.val))
      (OriginalRow227Roots.root_pos 10 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 9 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0146.entries OriginalRow227TriangleForward0146.checked
    ⟨i.val, by rw [size0146]; exact i.isLt⟩
  change (entry0146 i).check = true at h
  rcases fields0146 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0147 : OriginalRow227TriangleForward0147.entries.size = 32 := rfl

def entry0147 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0147.entries[i.val]'(by rw [size0147]; exact i.isLt)

theorem fields0147 (i : Fin 32) :
    (entry0147 i).IA = shift ∧ (entry0147 i).ID = S (105 + i.val + 1) ∧
      (entry0147 i).IC = S 10 ∧ (entry0147 i).Inext = T 9 (105 + i.val + 1) ∧
      (entry0147 i).Icur = T 9 (105 + i.val) ∧
      (entry0147 i).output = T 10 (105 + i.val) ∧
      (entry0147 i).charge = charge 9 (105 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0147_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0163_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0147 (i : Fin 32) :
    forwardStepOK (-768) (charge 9 (105 + i.val)) shift
      (S (105 + i.val + 1)) (S 10) (T 9 (105 + i.val + 1))
      (T 9 (105 + i.val)) (T 10 (105 + i.val))
      (OriginalRow227Roots.root_pos 10 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 9 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0147.entries OriginalRow227TriangleForward0147.checked
    ⟨i.val, by rw [size0147]; exact i.isLt⟩
  change (entry0147 i).check = true at h
  rcases fields0147 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0148 : OriginalRow227TriangleForward0148.entries.size = 32 := rfl

def entry0148 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0148.entries[i.val]'(by rw [size0148]; exact i.isLt)

theorem fields0148 (i : Fin 32) :
    (entry0148 i).IA = shift ∧ (entry0148 i).ID = S (137 + i.val + 1) ∧
      (entry0148 i).IC = S 10 ∧ (entry0148 i).Inext = T 9 (137 + i.val + 1) ∧
      (entry0148 i).Icur = T 9 (137 + i.val) ∧
      (entry0148 i).output = T 10 (137 + i.val) ∧
      (entry0148 i).charge = charge 9 (137 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0148_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0164_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0148 (i : Fin 32) :
    forwardStepOK (-768) (charge 9 (137 + i.val)) shift
      (S (137 + i.val + 1)) (S 10) (T 9 (137 + i.val + 1))
      (T 9 (137 + i.val)) (T 10 (137 + i.val))
      (OriginalRow227Roots.root_pos 10 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 9 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0148.entries OriginalRow227TriangleForward0148.checked
    ⟨i.val, by rw [size0148]; exact i.isLt⟩
  change (entry0148 i).check = true at h
  rcases fields0148 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0149 : OriginalRow227TriangleForward0149.entries.size = 32 := rfl

def entry0149 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0149.entries[i.val]'(by rw [size0149]; exact i.isLt)

theorem fields0149 (i : Fin 32) :
    (entry0149 i).IA = shift ∧ (entry0149 i).ID = S (169 + i.val + 1) ∧
      (entry0149 i).IC = S 10 ∧ (entry0149 i).Inext = T 9 (169 + i.val + 1) ∧
      (entry0149 i).Icur = T 9 (169 + i.val) ∧
      (entry0149 i).output = T 10 (169 + i.val) ∧
      (entry0149 i).charge = charge 9 (169 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0149_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0165_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0149 (i : Fin 32) :
    forwardStepOK (-768) (charge 9 (169 + i.val)) shift
      (S (169 + i.val + 1)) (S 10) (T 9 (169 + i.val + 1))
      (T 9 (169 + i.val)) (T 10 (169 + i.val))
      (OriginalRow227Roots.root_pos 10 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 9 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0149.entries OriginalRow227TriangleForward0149.checked
    ⟨i.val, by rw [size0149]; exact i.isLt⟩
  change (entry0149 i).check = true at h
  rcases fields0149 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0150 : OriginalRow227TriangleForward0150.entries.size = 32 := rfl

def entry0150 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0150.entries[i.val]'(by rw [size0150]; exact i.isLt)

theorem fields0150 (i : Fin 32) :
    (entry0150 i).IA = shift ∧ (entry0150 i).ID = S (201 + i.val + 1) ∧
      (entry0150 i).IC = S 10 ∧ (entry0150 i).Inext = T 9 (201 + i.val + 1) ∧
      (entry0150 i).Icur = T 9 (201 + i.val) ∧
      (entry0150 i).output = T 10 (201 + i.val) ∧
      (entry0150 i).charge = charge 9 (201 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0150_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0166_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0150 (i : Fin 32) :
    forwardStepOK (-768) (charge 9 (201 + i.val)) shift
      (S (201 + i.val + 1)) (S 10) (T 9 (201 + i.val + 1))
      (T 9 (201 + i.val)) (T 10 (201 + i.val))
      (OriginalRow227Roots.root_pos 10 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 9 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0150.entries OriginalRow227TriangleForward0150.checked
    ⟨i.val, by rw [size0150]; exact i.isLt⟩
  change (entry0150 i).check = true at h
  rcases fields0150 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0151 : OriginalRow227TriangleForward0151.entries.size = 32 := rfl

def entry0151 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0151.entries[i.val]'(by rw [size0151]; exact i.isLt)

theorem fields0151 (i : Fin 32) :
    (entry0151 i).IA = shift ∧ (entry0151 i).ID = S (233 + i.val + 1) ∧
      (entry0151 i).IC = S 10 ∧ (entry0151 i).Inext = T 9 (233 + i.val + 1) ∧
      (entry0151 i).Icur = T 9 (233 + i.val) ∧
      (entry0151 i).output = T 10 (233 + i.val) ∧
      (entry0151 i).charge = charge 9 (233 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0151_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0167_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0151 (i : Fin 32) :
    forwardStepOK (-768) (charge 9 (233 + i.val)) shift
      (S (233 + i.val + 1)) (S 10) (T 9 (233 + i.val + 1))
      (T 9 (233 + i.val)) (T 10 (233 + i.val))
      (OriginalRow227Roots.root_pos 10 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 9 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0151.entries OriginalRow227TriangleForward0151.checked
    ⟨i.val, by rw [size0151]; exact i.isLt⟩
  change (entry0151 i).check = true at h
  rcases fields0151 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0152 : OriginalRow227TriangleForward0152.entries.size = 32 := rfl

def entry0152 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0152.entries[i.val]'(by rw [size0152]; exact i.isLt)

theorem fields0152 (i : Fin 32) :
    (entry0152 i).IA = shift ∧ (entry0152 i).ID = S (265 + i.val + 1) ∧
      (entry0152 i).IC = S 10 ∧ (entry0152 i).Inext = T 9 (265 + i.val + 1) ∧
      (entry0152 i).Icur = T 9 (265 + i.val) ∧
      (entry0152 i).output = T 10 (265 + i.val) ∧
      (entry0152 i).charge = charge 9 (265 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0152_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0168_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0152 (i : Fin 32) :
    forwardStepOK (-768) (charge 9 (265 + i.val)) shift
      (S (265 + i.val + 1)) (S 10) (T 9 (265 + i.val + 1))
      (T 9 (265 + i.val)) (T 10 (265 + i.val))
      (OriginalRow227Roots.root_pos 10 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 9 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0152.entries OriginalRow227TriangleForward0152.checked
    ⟨i.val, by rw [size0152]; exact i.isLt⟩
  change (entry0152 i).check = true at h
  rcases fields0152 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0153 : OriginalRow227TriangleForward0153.entries.size = 32 := rfl

def entry0153 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0153.entries[i.val]'(by rw [size0153]; exact i.isLt)

theorem fields0153 (i : Fin 32) :
    (entry0153 i).IA = shift ∧ (entry0153 i).ID = S (297 + i.val + 1) ∧
      (entry0153 i).IC = S 10 ∧ (entry0153 i).Inext = T 9 (297 + i.val + 1) ∧
      (entry0153 i).Icur = T 9 (297 + i.val) ∧
      (entry0153 i).output = T 10 (297 + i.val) ∧
      (entry0153 i).charge = charge 9 (297 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0153_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0169_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0153 (i : Fin 32) :
    forwardStepOK (-768) (charge 9 (297 + i.val)) shift
      (S (297 + i.val + 1)) (S 10) (T 9 (297 + i.val + 1))
      (T 9 (297 + i.val)) (T 10 (297 + i.val))
      (OriginalRow227Roots.root_pos 10 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 9 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0153.entries OriginalRow227TriangleForward0153.checked
    ⟨i.val, by rw [size0153]; exact i.isLt⟩
  change (entry0153 i).check = true at h
  rcases fields0153 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0154 : OriginalRow227TriangleForward0154.entries.size = 32 := rfl

def entry0154 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0154.entries[i.val]'(by rw [size0154]; exact i.isLt)

theorem fields0154 (i : Fin 32) :
    (entry0154 i).IA = shift ∧ (entry0154 i).ID = S (329 + i.val + 1) ∧
      (entry0154 i).IC = S 10 ∧ (entry0154 i).Inext = T 9 (329 + i.val + 1) ∧
      (entry0154 i).Icur = T 9 (329 + i.val) ∧
      (entry0154 i).output = T 10 (329 + i.val) ∧
      (entry0154 i).charge = charge 9 (329 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0154_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0170_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0154 (i : Fin 32) :
    forwardStepOK (-768) (charge 9 (329 + i.val)) shift
      (S (329 + i.val + 1)) (S 10) (T 9 (329 + i.val + 1))
      (T 9 (329 + i.val)) (T 10 (329 + i.val))
      (OriginalRow227Roots.root_pos 10 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 9 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0154.entries OriginalRow227TriangleForward0154.checked
    ⟨i.val, by rw [size0154]; exact i.isLt⟩
  change (entry0154 i).check = true at h
  rcases fields0154 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0155 : OriginalRow227TriangleForward0155.entries.size = 32 := rfl

def entry0155 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0155.entries[i.val]'(by rw [size0155]; exact i.isLt)

theorem fields0155 (i : Fin 32) :
    (entry0155 i).IA = shift ∧ (entry0155 i).ID = S (361 + i.val + 1) ∧
      (entry0155 i).IC = S 10 ∧ (entry0155 i).Inext = T 9 (361 + i.val + 1) ∧
      (entry0155 i).Icur = T 9 (361 + i.val) ∧
      (entry0155 i).output = T 10 (361 + i.val) ∧
      (entry0155 i).charge = charge 9 (361 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0155_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0171_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0155 (i : Fin 32) :
    forwardStepOK (-768) (charge 9 (361 + i.val)) shift
      (S (361 + i.val + 1)) (S 10) (T 9 (361 + i.val + 1))
      (T 9 (361 + i.val)) (T 10 (361 + i.val))
      (OriginalRow227Roots.root_pos 10 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 9 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0155.entries OriginalRow227TriangleForward0155.checked
    ⟨i.val, by rw [size0155]; exact i.isLt⟩
  change (entry0155 i).check = true at h
  rcases fields0155 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0156 : OriginalRow227TriangleForward0156.entries.size = 32 := rfl

def entry0156 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0156.entries[i.val]'(by rw [size0156]; exact i.isLt)

theorem fields0156 (i : Fin 32) :
    (entry0156 i).IA = shift ∧ (entry0156 i).ID = S (393 + i.val + 1) ∧
      (entry0156 i).IC = S 10 ∧ (entry0156 i).Inext = T 9 (393 + i.val + 1) ∧
      (entry0156 i).Icur = T 9 (393 + i.val) ∧
      (entry0156 i).output = T 10 (393 + i.val) ∧
      (entry0156 i).charge = charge 9 (393 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0156_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0172_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0156 (i : Fin 32) :
    forwardStepOK (-768) (charge 9 (393 + i.val)) shift
      (S (393 + i.val + 1)) (S 10) (T 9 (393 + i.val + 1))
      (T 9 (393 + i.val)) (T 10 (393 + i.val))
      (OriginalRow227Roots.root_pos 10 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 9 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0156.entries OriginalRow227TriangleForward0156.checked
    ⟨i.val, by rw [size0156]; exact i.isLt⟩
  change (entry0156 i).check = true at h
  rcases fields0156 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0157 : OriginalRow227TriangleForward0157.entries.size = 32 := rfl

def entry0157 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0157.entries[i.val]'(by rw [size0157]; exact i.isLt)

theorem fields0157 (i : Fin 32) :
    (entry0157 i).IA = shift ∧ (entry0157 i).ID = S (425 + i.val + 1) ∧
      (entry0157 i).IC = S 10 ∧ (entry0157 i).Inext = T 9 (425 + i.val + 1) ∧
      (entry0157 i).Icur = T 9 (425 + i.val) ∧
      (entry0157 i).output = T 10 (425 + i.val) ∧
      (entry0157 i).charge = charge 9 (425 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0157_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0173_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0157 (i : Fin 32) :
    forwardStepOK (-768) (charge 9 (425 + i.val)) shift
      (S (425 + i.val + 1)) (S 10) (T 9 (425 + i.val + 1))
      (T 9 (425 + i.val)) (T 10 (425 + i.val))
      (OriginalRow227Roots.root_pos 10 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 9 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0157.entries OriginalRow227TriangleForward0157.checked
    ⟨i.val, by rw [size0157]; exact i.isLt⟩
  change (entry0157 i).check = true at h
  rcases fields0157 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0158 : OriginalRow227TriangleForward0158.entries.size = 32 := rfl

def entry0158 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0158.entries[i.val]'(by rw [size0158]; exact i.isLt)

theorem fields0158 (i : Fin 32) :
    (entry0158 i).IA = shift ∧ (entry0158 i).ID = S (457 + i.val + 1) ∧
      (entry0158 i).IC = S 10 ∧ (entry0158 i).Inext = T 9 (457 + i.val + 1) ∧
      (entry0158 i).Icur = T 9 (457 + i.val) ∧
      (entry0158 i).output = T 10 (457 + i.val) ∧
      (entry0158 i).charge = charge 9 (457 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root483).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root484).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root485).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root486).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root487).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root488).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0159_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0158_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root489).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0159_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0159_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0174_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0158 (i : Fin 32) :
    forwardStepOK (-768) (charge 9 (457 + i.val)) shift
      (S (457 + i.val + 1)) (S 10) (T 9 (457 + i.val + 1))
      (T 9 (457 + i.val)) (T 10 (457 + i.val))
      (OriginalRow227Roots.root_pos 10 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 9 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0158.entries OriginalRow227TriangleForward0158.checked
    ⟨i.val, by rw [size0158]; exact i.isLt⟩
  change (entry0158 i).check = true at h
  rcases fields0158 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0159 : OriginalRow227TriangleForward0159.entries.size = 3 := rfl

def entry0159 (i : Fin 3) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0159.entries[i.val]'(by rw [size0159]; exact i.isLt)

theorem fields0159 (i : Fin 3) :
    (entry0159 i).IA = shift ∧ (entry0159 i).ID = S (489 + i.val + 1) ∧
      (entry0159 i).IC = S 10 ∧ (entry0159 i).Inext = T 9 (489 + i.val + 1) ∧
      (entry0159 i).Icur = T 9 (489 + i.val) ∧
      (entry0159 i).output = T 10 (489 + i.val) ∧
      (entry0159 i).charge = charge 9 (489 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root490).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0159_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0159_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0175_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root491).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0159_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0159_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0175_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root492).symm, (OriginalRow227RootBindings00.S_eq_root10).symm,
      (OriginalRow227TriangleBindingsRow009.block0159_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow009.block0159_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow010.block0175_value ⟨2, by decide⟩).symm, rfl⟩

theorem step0159 (i : Fin 3) :
    forwardStepOK (-768) (charge 9 (489 + i.val)) shift
      (S (489 + i.val + 1)) (S 10) (T 9 (489 + i.val + 1))
      (T 9 (489 + i.val)) (T 10 (489 + i.val))
      (OriginalRow227Roots.root_pos 10 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 9 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0159.entries OriginalRow227TriangleForward0159.checked
    ⟨i.val, by rw [size0159]; exact i.isLt⟩
  change (entry0159 i).check = true at h
  rcases fields0159 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 9 ≤ d) (hhi : d < 492) :
    forwardStepOK (-768) (charge 9 d) shift (S (d + 1)) (S 10)
      (T 9 (d + 1)) (T 9 d) (T 10 d)
      (OriginalRow227Roots.root_pos 10 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 9 (by decide)) = true := by
  by_cases h265 : d < 265
  ·
    by_cases h137 : d < 137
    ·
      by_cases h73 : d < 73
      ·
        by_cases h41 : d < 41
        ·
          have hi : d - 9 < 32 := by omega
          have heq : 9 + (d - 9) = d := by omega
          simpa only [heq] using step0144 ⟨d - 9, hi⟩
        ·
          have hi : d - 41 < 32 := by omega
          have heq : 41 + (d - 41) = d := by omega
          simpa only [heq] using step0145 ⟨d - 41, hi⟩
      ·
        by_cases h105 : d < 105
        ·
          have hi : d - 73 < 32 := by omega
          have heq : 73 + (d - 73) = d := by omega
          simpa only [heq] using step0146 ⟨d - 73, hi⟩
        ·
          have hi : d - 105 < 32 := by omega
          have heq : 105 + (d - 105) = d := by omega
          simpa only [heq] using step0147 ⟨d - 105, hi⟩
    ·
      by_cases h201 : d < 201
      ·
        by_cases h169 : d < 169
        ·
          have hi : d - 137 < 32 := by omega
          have heq : 137 + (d - 137) = d := by omega
          simpa only [heq] using step0148 ⟨d - 137, hi⟩
        ·
          have hi : d - 169 < 32 := by omega
          have heq : 169 + (d - 169) = d := by omega
          simpa only [heq] using step0149 ⟨d - 169, hi⟩
      ·
        by_cases h233 : d < 233
        ·
          have hi : d - 201 < 32 := by omega
          have heq : 201 + (d - 201) = d := by omega
          simpa only [heq] using step0150 ⟨d - 201, hi⟩
        ·
          have hi : d - 233 < 32 := by omega
          have heq : 233 + (d - 233) = d := by omega
          simpa only [heq] using step0151 ⟨d - 233, hi⟩
  ·
    by_cases h393 : d < 393
    ·
      by_cases h329 : d < 329
      ·
        by_cases h297 : d < 297
        ·
          have hi : d - 265 < 32 := by omega
          have heq : 265 + (d - 265) = d := by omega
          simpa only [heq] using step0152 ⟨d - 265, hi⟩
        ·
          have hi : d - 297 < 32 := by omega
          have heq : 297 + (d - 297) = d := by omega
          simpa only [heq] using step0153 ⟨d - 297, hi⟩
      ·
        by_cases h361 : d < 361
        ·
          have hi : d - 329 < 32 := by omega
          have heq : 329 + (d - 329) = d := by omega
          simpa only [heq] using step0154 ⟨d - 329, hi⟩
        ·
          have hi : d - 361 < 32 := by omega
          have heq : 361 + (d - 361) = d := by omega
          simpa only [heq] using step0155 ⟨d - 361, hi⟩
    ·
      by_cases h457 : d < 457
      ·
        by_cases h425 : d < 425
        ·
          have hi : d - 393 < 32 := by omega
          have heq : 393 + (d - 393) = d := by omega
          simpa only [heq] using step0156 ⟨d - 393, hi⟩
        ·
          have hi : d - 425 < 32 := by omega
          have heq : 425 + (d - 425) = d := by omega
          simpa only [heq] using step0157 ⟨d - 425, hi⟩
      ·
        by_cases h489 : d < 489
        ·
          have hi : d - 457 < 32 := by omega
          have heq : 457 + (d - 457) = d := by omega
          simpa only [heq] using step0158 ⟨d - 457, hi⟩
        ·
          have hi : d - 489 < 3 := by omega
          have heq : 489 + (d - 489) = d := by omega
          simpa only [heq] using step0159 ⟨d - 489, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.fields0144,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.step0144,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.fields0145,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.step0145,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.fields0146,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.step0146,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.fields0147,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.step0147,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.fields0148,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.step0148,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.fields0149,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.step0149,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.fields0150,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.step0150,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.fields0151,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.step0151,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.fields0152,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.step0152,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.fields0153,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.step0153,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.fields0154,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.step0154,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.fields0155,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.step0155,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.fields0156,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.step0156,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.fields0157,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.step0157,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.fields0158,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.step0158,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.fields0159,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.step0159,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow010
