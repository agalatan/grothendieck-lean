import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015
import Grothe.UpperChaos.OriginalRow227TriangleForward0221
import Grothe.UpperChaos.OriginalRow227TriangleForward0222
import Grothe.UpperChaos.OriginalRow227TriangleForward0223
import Grothe.UpperChaos.OriginalRow227TriangleForward0224
import Grothe.UpperChaos.OriginalRow227TriangleForward0225
import Grothe.UpperChaos.OriginalRow227TriangleForward0226
import Grothe.UpperChaos.OriginalRow227TriangleForward0227
import Grothe.UpperChaos.OriginalRow227TriangleForward0228
import Grothe.UpperChaos.OriginalRow227TriangleForward0229
import Grothe.UpperChaos.OriginalRow227TriangleForward0230
import Grothe.UpperChaos.OriginalRow227TriangleForward0231
import Grothe.UpperChaos.OriginalRow227TriangleForward0232
import Grothe.UpperChaos.OriginalRow227TriangleForward0233
import Grothe.UpperChaos.OriginalRow227TriangleForward0234
import Grothe.UpperChaos.OriginalRow227TriangleForward0235

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0221 : OriginalRow227TriangleForward0221.entries.size = 32 := rfl

def entry0221 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0221.entries[i.val]'(by rw [size0221]; exact i.isLt)

theorem fields0221 (i : Fin 32) :
    (entry0221 i).IA = shift ∧ (entry0221 i).ID = S (14 + i.val + 1) ∧
      (entry0221 i).IC = S 15 ∧ (entry0221 i).Inext = T 14 (14 + i.val + 1) ∧
      (entry0221 i).Icur = T 14 (14 + i.val) ∧
      (entry0221 i).output = T 15 (14 + i.val) ∧
      (entry0221 i).charge = charge 14 (14 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root15).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root16).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root17).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root18).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root19).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0237_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0221 (i : Fin 32) :
    forwardStepOK (-768) (charge 14 (14 + i.val)) shift
      (S (14 + i.val + 1)) (S 15) (T 14 (14 + i.val + 1))
      (T 14 (14 + i.val)) (T 15 (14 + i.val))
      (OriginalRow227Roots.root_pos 15 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 14 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0221.entries OriginalRow227TriangleForward0221.checked
    ⟨i.val, by rw [size0221]; exact i.isLt⟩
  change (entry0221 i).check = true at h
  rcases fields0221 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0222 : OriginalRow227TriangleForward0222.entries.size = 32 := rfl

def entry0222 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0222.entries[i.val]'(by rw [size0222]; exact i.isLt)

theorem fields0222 (i : Fin 32) :
    (entry0222 i).IA = shift ∧ (entry0222 i).ID = S (46 + i.val + 1) ∧
      (entry0222 i).IC = S 15 ∧ (entry0222 i).Inext = T 14 (46 + i.val + 1) ∧
      (entry0222 i).Icur = T 14 (46 + i.val) ∧
      (entry0222 i).output = T 15 (46 + i.val) ∧
      (entry0222 i).charge = charge 14 (46 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0238_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0222 (i : Fin 32) :
    forwardStepOK (-768) (charge 14 (46 + i.val)) shift
      (S (46 + i.val + 1)) (S 15) (T 14 (46 + i.val + 1))
      (T 14 (46 + i.val)) (T 15 (46 + i.val))
      (OriginalRow227Roots.root_pos 15 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 14 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0222.entries OriginalRow227TriangleForward0222.checked
    ⟨i.val, by rw [size0222]; exact i.isLt⟩
  change (entry0222 i).check = true at h
  rcases fields0222 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0223 : OriginalRow227TriangleForward0223.entries.size = 32 := rfl

def entry0223 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0223.entries[i.val]'(by rw [size0223]; exact i.isLt)

theorem fields0223 (i : Fin 32) :
    (entry0223 i).IA = shift ∧ (entry0223 i).ID = S (78 + i.val + 1) ∧
      (entry0223 i).IC = S 15 ∧ (entry0223 i).Inext = T 14 (78 + i.val + 1) ∧
      (entry0223 i).Icur = T 14 (78 + i.val) ∧
      (entry0223 i).output = T 15 (78 + i.val) ∧
      (entry0223 i).charge = charge 14 (78 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0239_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0223 (i : Fin 32) :
    forwardStepOK (-768) (charge 14 (78 + i.val)) shift
      (S (78 + i.val + 1)) (S 15) (T 14 (78 + i.val + 1))
      (T 14 (78 + i.val)) (T 15 (78 + i.val))
      (OriginalRow227Roots.root_pos 15 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 14 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0223.entries OriginalRow227TriangleForward0223.checked
    ⟨i.val, by rw [size0223]; exact i.isLt⟩
  change (entry0223 i).check = true at h
  rcases fields0223 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0224 : OriginalRow227TriangleForward0224.entries.size = 32 := rfl

def entry0224 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0224.entries[i.val]'(by rw [size0224]; exact i.isLt)

theorem fields0224 (i : Fin 32) :
    (entry0224 i).IA = shift ∧ (entry0224 i).ID = S (110 + i.val + 1) ∧
      (entry0224 i).IC = S 15 ∧ (entry0224 i).Inext = T 14 (110 + i.val + 1) ∧
      (entry0224 i).Icur = T 14 (110 + i.val) ∧
      (entry0224 i).output = T 15 (110 + i.val) ∧
      (entry0224 i).charge = charge 14 (110 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0240_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0224 (i : Fin 32) :
    forwardStepOK (-768) (charge 14 (110 + i.val)) shift
      (S (110 + i.val + 1)) (S 15) (T 14 (110 + i.val + 1))
      (T 14 (110 + i.val)) (T 15 (110 + i.val))
      (OriginalRow227Roots.root_pos 15 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 14 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0224.entries OriginalRow227TriangleForward0224.checked
    ⟨i.val, by rw [size0224]; exact i.isLt⟩
  change (entry0224 i).check = true at h
  rcases fields0224 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0225 : OriginalRow227TriangleForward0225.entries.size = 32 := rfl

def entry0225 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0225.entries[i.val]'(by rw [size0225]; exact i.isLt)

theorem fields0225 (i : Fin 32) :
    (entry0225 i).IA = shift ∧ (entry0225 i).ID = S (142 + i.val + 1) ∧
      (entry0225 i).IC = S 15 ∧ (entry0225 i).Inext = T 14 (142 + i.val + 1) ∧
      (entry0225 i).Icur = T 14 (142 + i.val) ∧
      (entry0225 i).output = T 15 (142 + i.val) ∧
      (entry0225 i).charge = charge 14 (142 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0241_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0225 (i : Fin 32) :
    forwardStepOK (-768) (charge 14 (142 + i.val)) shift
      (S (142 + i.val + 1)) (S 15) (T 14 (142 + i.val + 1))
      (T 14 (142 + i.val)) (T 15 (142 + i.val))
      (OriginalRow227Roots.root_pos 15 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 14 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0225.entries OriginalRow227TriangleForward0225.checked
    ⟨i.val, by rw [size0225]; exact i.isLt⟩
  change (entry0225 i).check = true at h
  rcases fields0225 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0226 : OriginalRow227TriangleForward0226.entries.size = 32 := rfl

def entry0226 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0226.entries[i.val]'(by rw [size0226]; exact i.isLt)

theorem fields0226 (i : Fin 32) :
    (entry0226 i).IA = shift ∧ (entry0226 i).ID = S (174 + i.val + 1) ∧
      (entry0226 i).IC = S 15 ∧ (entry0226 i).Inext = T 14 (174 + i.val + 1) ∧
      (entry0226 i).Icur = T 14 (174 + i.val) ∧
      (entry0226 i).output = T 15 (174 + i.val) ∧
      (entry0226 i).charge = charge 14 (174 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0242_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0226 (i : Fin 32) :
    forwardStepOK (-768) (charge 14 (174 + i.val)) shift
      (S (174 + i.val + 1)) (S 15) (T 14 (174 + i.val + 1))
      (T 14 (174 + i.val)) (T 15 (174 + i.val))
      (OriginalRow227Roots.root_pos 15 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 14 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0226.entries OriginalRow227TriangleForward0226.checked
    ⟨i.val, by rw [size0226]; exact i.isLt⟩
  change (entry0226 i).check = true at h
  rcases fields0226 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0227 : OriginalRow227TriangleForward0227.entries.size = 32 := rfl

def entry0227 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0227.entries[i.val]'(by rw [size0227]; exact i.isLt)

theorem fields0227 (i : Fin 32) :
    (entry0227 i).IA = shift ∧ (entry0227 i).ID = S (206 + i.val + 1) ∧
      (entry0227 i).IC = S 15 ∧ (entry0227 i).Inext = T 14 (206 + i.val + 1) ∧
      (entry0227 i).Icur = T 14 (206 + i.val) ∧
      (entry0227 i).output = T 15 (206 + i.val) ∧
      (entry0227 i).charge = charge 14 (206 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0243_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0227 (i : Fin 32) :
    forwardStepOK (-768) (charge 14 (206 + i.val)) shift
      (S (206 + i.val + 1)) (S 15) (T 14 (206 + i.val + 1))
      (T 14 (206 + i.val)) (T 15 (206 + i.val))
      (OriginalRow227Roots.root_pos 15 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 14 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0227.entries OriginalRow227TriangleForward0227.checked
    ⟨i.val, by rw [size0227]; exact i.isLt⟩
  change (entry0227 i).check = true at h
  rcases fields0227 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0228 : OriginalRow227TriangleForward0228.entries.size = 32 := rfl

def entry0228 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0228.entries[i.val]'(by rw [size0228]; exact i.isLt)

theorem fields0228 (i : Fin 32) :
    (entry0228 i).IA = shift ∧ (entry0228 i).ID = S (238 + i.val + 1) ∧
      (entry0228 i).IC = S 15 ∧ (entry0228 i).Inext = T 14 (238 + i.val + 1) ∧
      (entry0228 i).Icur = T 14 (238 + i.val) ∧
      (entry0228 i).output = T 15 (238 + i.val) ∧
      (entry0228 i).charge = charge 14 (238 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0244_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0228 (i : Fin 32) :
    forwardStepOK (-768) (charge 14 (238 + i.val)) shift
      (S (238 + i.val + 1)) (S 15) (T 14 (238 + i.val + 1))
      (T 14 (238 + i.val)) (T 15 (238 + i.val))
      (OriginalRow227Roots.root_pos 15 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 14 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0228.entries OriginalRow227TriangleForward0228.checked
    ⟨i.val, by rw [size0228]; exact i.isLt⟩
  change (entry0228 i).check = true at h
  rcases fields0228 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0229 : OriginalRow227TriangleForward0229.entries.size = 32 := rfl

def entry0229 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0229.entries[i.val]'(by rw [size0229]; exact i.isLt)

theorem fields0229 (i : Fin 32) :
    (entry0229 i).IA = shift ∧ (entry0229 i).ID = S (270 + i.val + 1) ∧
      (entry0229 i).IC = S 15 ∧ (entry0229 i).Inext = T 14 (270 + i.val + 1) ∧
      (entry0229 i).Icur = T 14 (270 + i.val) ∧
      (entry0229 i).output = T 15 (270 + i.val) ∧
      (entry0229 i).charge = charge 14 (270 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0245_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0229 (i : Fin 32) :
    forwardStepOK (-768) (charge 14 (270 + i.val)) shift
      (S (270 + i.val + 1)) (S 15) (T 14 (270 + i.val + 1))
      (T 14 (270 + i.val)) (T 15 (270 + i.val))
      (OriginalRow227Roots.root_pos 15 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 14 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0229.entries OriginalRow227TriangleForward0229.checked
    ⟨i.val, by rw [size0229]; exact i.isLt⟩
  change (entry0229 i).check = true at h
  rcases fields0229 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0230 : OriginalRow227TriangleForward0230.entries.size = 32 := rfl

def entry0230 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0230.entries[i.val]'(by rw [size0230]; exact i.isLt)

theorem fields0230 (i : Fin 32) :
    (entry0230 i).IA = shift ∧ (entry0230 i).ID = S (302 + i.val + 1) ∧
      (entry0230 i).IC = S 15 ∧ (entry0230 i).Inext = T 14 (302 + i.val + 1) ∧
      (entry0230 i).Icur = T 14 (302 + i.val) ∧
      (entry0230 i).output = T 15 (302 + i.val) ∧
      (entry0230 i).charge = charge 14 (302 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0246_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0230 (i : Fin 32) :
    forwardStepOK (-768) (charge 14 (302 + i.val)) shift
      (S (302 + i.val + 1)) (S 15) (T 14 (302 + i.val + 1))
      (T 14 (302 + i.val)) (T 15 (302 + i.val))
      (OriginalRow227Roots.root_pos 15 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 14 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0230.entries OriginalRow227TriangleForward0230.checked
    ⟨i.val, by rw [size0230]; exact i.isLt⟩
  change (entry0230 i).check = true at h
  rcases fields0230 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0231 : OriginalRow227TriangleForward0231.entries.size = 32 := rfl

def entry0231 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0231.entries[i.val]'(by rw [size0231]; exact i.isLt)

theorem fields0231 (i : Fin 32) :
    (entry0231 i).IA = shift ∧ (entry0231 i).ID = S (334 + i.val + 1) ∧
      (entry0231 i).IC = S 15 ∧ (entry0231 i).Inext = T 14 (334 + i.val + 1) ∧
      (entry0231 i).Icur = T 14 (334 + i.val) ∧
      (entry0231 i).output = T 15 (334 + i.val) ∧
      (entry0231 i).charge = charge 14 (334 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0247_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0231 (i : Fin 32) :
    forwardStepOK (-768) (charge 14 (334 + i.val)) shift
      (S (334 + i.val + 1)) (S 15) (T 14 (334 + i.val + 1))
      (T 14 (334 + i.val)) (T 15 (334 + i.val))
      (OriginalRow227Roots.root_pos 15 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 14 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0231.entries OriginalRow227TriangleForward0231.checked
    ⟨i.val, by rw [size0231]; exact i.isLt⟩
  change (entry0231 i).check = true at h
  rcases fields0231 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0232 : OriginalRow227TriangleForward0232.entries.size = 32 := rfl

def entry0232 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0232.entries[i.val]'(by rw [size0232]; exact i.isLt)

theorem fields0232 (i : Fin 32) :
    (entry0232 i).IA = shift ∧ (entry0232 i).ID = S (366 + i.val + 1) ∧
      (entry0232 i).IC = S 15 ∧ (entry0232 i).Inext = T 14 (366 + i.val + 1) ∧
      (entry0232 i).Icur = T 14 (366 + i.val) ∧
      (entry0232 i).output = T 15 (366 + i.val) ∧
      (entry0232 i).charge = charge 14 (366 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0248_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0232 (i : Fin 32) :
    forwardStepOK (-768) (charge 14 (366 + i.val)) shift
      (S (366 + i.val + 1)) (S 15) (T 14 (366 + i.val + 1))
      (T 14 (366 + i.val)) (T 15 (366 + i.val))
      (OriginalRow227Roots.root_pos 15 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 14 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0232.entries OriginalRow227TriangleForward0232.checked
    ⟨i.val, by rw [size0232]; exact i.isLt⟩
  change (entry0232 i).check = true at h
  rcases fields0232 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0233 : OriginalRow227TriangleForward0233.entries.size = 32 := rfl

def entry0233 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0233.entries[i.val]'(by rw [size0233]; exact i.isLt)

theorem fields0233 (i : Fin 32) :
    (entry0233 i).IA = shift ∧ (entry0233 i).ID = S (398 + i.val + 1) ∧
      (entry0233 i).IC = S 15 ∧ (entry0233 i).Inext = T 14 (398 + i.val + 1) ∧
      (entry0233 i).Icur = T 14 (398 + i.val) ∧
      (entry0233 i).output = T 15 (398 + i.val) ∧
      (entry0233 i).charge = charge 14 (398 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0249_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0233 (i : Fin 32) :
    forwardStepOK (-768) (charge 14 (398 + i.val)) shift
      (S (398 + i.val + 1)) (S 15) (T 14 (398 + i.val + 1))
      (T 14 (398 + i.val)) (T 15 (398 + i.val))
      (OriginalRow227Roots.root_pos 15 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 14 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0233.entries OriginalRow227TriangleForward0233.checked
    ⟨i.val, by rw [size0233]; exact i.isLt⟩
  change (entry0233 i).check = true at h
  rcases fields0233 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0234 : OriginalRow227TriangleForward0234.entries.size = 32 := rfl

def entry0234 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0234.entries[i.val]'(by rw [size0234]; exact i.isLt)

theorem fields0234 (i : Fin 32) :
    (entry0234 i).IA = shift ∧ (entry0234 i).ID = S (430 + i.val + 1) ∧
      (entry0234 i).IC = S 15 ∧ (entry0234 i).Inext = T 14 (430 + i.val + 1) ∧
      (entry0234 i).Icur = T 14 (430 + i.val) ∧
      (entry0234 i).output = T 15 (430 + i.val) ∧
      (entry0234 i).charge = charge 14 (430 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0250_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0234 (i : Fin 32) :
    forwardStepOK (-768) (charge 14 (430 + i.val)) shift
      (S (430 + i.val + 1)) (S 15) (T 14 (430 + i.val + 1))
      (T 14 (430 + i.val)) (T 15 (430 + i.val))
      (OriginalRow227Roots.root_pos 15 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 14 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0234.entries OriginalRow227TriangleForward0234.checked
    ⟨i.val, by rw [size0234]; exact i.isLt⟩
  change (entry0234 i).check = true at h
  rcases fields0234 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0235 : OriginalRow227TriangleForward0235.entries.size = 25 := rfl

def entry0235 (i : Fin 25) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0235.entries[i.val]'(by rw [size0235]; exact i.isLt)

theorem fields0235 (i : Fin 25) :
    (entry0235 i).IA = shift ∧ (entry0235 i).ID = S (462 + i.val + 1) ∧
      (entry0235 i).IC = S 15 ∧ (entry0235 i).Inext = T 14 (462 + i.val + 1) ∧
      (entry0235 i).Icur = T 14 (462 + i.val) ∧
      (entry0235 i).output = T 15 (462 + i.val) ∧
      (entry0235 i).charge = charge 14 (462 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root483).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root484).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root485).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root486).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root487).symm, (OriginalRow227RootBindings00.S_eq_root15).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow015.block0251_value ⟨24, by decide⟩).symm, rfl⟩

theorem step0235 (i : Fin 25) :
    forwardStepOK (-768) (charge 14 (462 + i.val)) shift
      (S (462 + i.val + 1)) (S 15) (T 14 (462 + i.val + 1))
      (T 14 (462 + i.val)) (T 15 (462 + i.val))
      (OriginalRow227Roots.root_pos 15 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 14 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0235.entries OriginalRow227TriangleForward0235.checked
    ⟨i.val, by rw [size0235]; exact i.isLt⟩
  change (entry0235 i).check = true at h
  rcases fields0235 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 14 ≤ d) (hhi : d < 487) :
    forwardStepOK (-768) (charge 14 d) shift (S (d + 1)) (S 15)
      (T 14 (d + 1)) (T 14 d) (T 15 d)
      (OriginalRow227Roots.root_pos 15 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 14 (by decide)) = true := by
  by_cases h238 : d < 238
  ·
    by_cases h110 : d < 110
    ·
      by_cases h46 : d < 46
      ·
        have hi : d - 14 < 32 := by omega
        have heq : 14 + (d - 14) = d := by omega
        simpa only [heq] using step0221 ⟨d - 14, hi⟩
      ·
        by_cases h78 : d < 78
        ·
          have hi : d - 46 < 32 := by omega
          have heq : 46 + (d - 46) = d := by omega
          simpa only [heq] using step0222 ⟨d - 46, hi⟩
        ·
          have hi : d - 78 < 32 := by omega
          have heq : 78 + (d - 78) = d := by omega
          simpa only [heq] using step0223 ⟨d - 78, hi⟩
    ·
      by_cases h174 : d < 174
      ·
        by_cases h142 : d < 142
        ·
          have hi : d - 110 < 32 := by omega
          have heq : 110 + (d - 110) = d := by omega
          simpa only [heq] using step0224 ⟨d - 110, hi⟩
        ·
          have hi : d - 142 < 32 := by omega
          have heq : 142 + (d - 142) = d := by omega
          simpa only [heq] using step0225 ⟨d - 142, hi⟩
      ·
        by_cases h206 : d < 206
        ·
          have hi : d - 174 < 32 := by omega
          have heq : 174 + (d - 174) = d := by omega
          simpa only [heq] using step0226 ⟨d - 174, hi⟩
        ·
          have hi : d - 206 < 32 := by omega
          have heq : 206 + (d - 206) = d := by omega
          simpa only [heq] using step0227 ⟨d - 206, hi⟩
  ·
    by_cases h366 : d < 366
    ·
      by_cases h302 : d < 302
      ·
        by_cases h270 : d < 270
        ·
          have hi : d - 238 < 32 := by omega
          have heq : 238 + (d - 238) = d := by omega
          simpa only [heq] using step0228 ⟨d - 238, hi⟩
        ·
          have hi : d - 270 < 32 := by omega
          have heq : 270 + (d - 270) = d := by omega
          simpa only [heq] using step0229 ⟨d - 270, hi⟩
      ·
        by_cases h334 : d < 334
        ·
          have hi : d - 302 < 32 := by omega
          have heq : 302 + (d - 302) = d := by omega
          simpa only [heq] using step0230 ⟨d - 302, hi⟩
        ·
          have hi : d - 334 < 32 := by omega
          have heq : 334 + (d - 334) = d := by omega
          simpa only [heq] using step0231 ⟨d - 334, hi⟩
    ·
      by_cases h430 : d < 430
      ·
        by_cases h398 : d < 398
        ·
          have hi : d - 366 < 32 := by omega
          have heq : 366 + (d - 366) = d := by omega
          simpa only [heq] using step0232 ⟨d - 366, hi⟩
        ·
          have hi : d - 398 < 32 := by omega
          have heq : 398 + (d - 398) = d := by omega
          simpa only [heq] using step0233 ⟨d - 398, hi⟩
      ·
        by_cases h462 : d < 462
        ·
          have hi : d - 430 < 32 := by omega
          have heq : 430 + (d - 430) = d := by omega
          simpa only [heq] using step0234 ⟨d - 430, hi⟩
        ·
          have hi : d - 462 < 25 := by omega
          have heq : 462 + (d - 462) = d := by omega
          simpa only [heq] using step0235 ⟨d - 462, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.fields0221,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.step0221,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.fields0222,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.step0222,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.fields0223,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.step0223,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.fields0224,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.step0224,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.fields0225,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.step0225,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.fields0226,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.step0226,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.fields0227,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.step0227,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.fields0228,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.step0228,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.fields0229,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.step0229,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.fields0230,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.step0230,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.fields0231,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.step0231,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.fields0232,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.step0232,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.fields0233,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.step0233,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.fields0234,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.step0234,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.fields0235,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.step0235,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow015
