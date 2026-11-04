import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014
import Grothe.UpperChaos.OriginalRow227TriangleForward0206
import Grothe.UpperChaos.OriginalRow227TriangleForward0207
import Grothe.UpperChaos.OriginalRow227TriangleForward0208
import Grothe.UpperChaos.OriginalRow227TriangleForward0209
import Grothe.UpperChaos.OriginalRow227TriangleForward0210
import Grothe.UpperChaos.OriginalRow227TriangleForward0211
import Grothe.UpperChaos.OriginalRow227TriangleForward0212
import Grothe.UpperChaos.OriginalRow227TriangleForward0213
import Grothe.UpperChaos.OriginalRow227TriangleForward0214
import Grothe.UpperChaos.OriginalRow227TriangleForward0215
import Grothe.UpperChaos.OriginalRow227TriangleForward0216
import Grothe.UpperChaos.OriginalRow227TriangleForward0217
import Grothe.UpperChaos.OriginalRow227TriangleForward0218
import Grothe.UpperChaos.OriginalRow227TriangleForward0219
import Grothe.UpperChaos.OriginalRow227TriangleForward0220

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0206 : OriginalRow227TriangleForward0206.entries.size = 32 := rfl

def entry0206 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0206.entries[i.val]'(by rw [size0206]; exact i.isLt)

theorem fields0206 (i : Fin 32) :
    (entry0206 i).IA = shift ∧ (entry0206 i).ID = S (13 + i.val + 1) ∧
      (entry0206 i).IC = S 14 ∧ (entry0206 i).Inext = T 13 (13 + i.val + 1) ∧
      (entry0206 i).Icur = T 13 (13 + i.val) ∧
      (entry0206 i).output = T 14 (13 + i.val) ∧
      (entry0206 i).charge = charge 13 (13 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root14).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root15).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root16).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root17).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root18).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root19).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root20).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root21).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root22).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root23).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root24).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root25).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root26).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root27).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0207_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0222_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0206 (i : Fin 32) :
    forwardStepOK (-768) (charge 13 (13 + i.val)) shift
      (S (13 + i.val + 1)) (S 14) (T 13 (13 + i.val + 1))
      (T 13 (13 + i.val)) (T 14 (13 + i.val))
      (OriginalRow227Roots.root_pos 14 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 13 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0206.entries OriginalRow227TriangleForward0206.checked
    ⟨i.val, by rw [size0206]; exact i.isLt⟩
  change (entry0206 i).check = true at h
  rcases fields0206 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0207 : OriginalRow227TriangleForward0207.entries.size = 32 := rfl

def entry0207 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0207.entries[i.val]'(by rw [size0207]; exact i.isLt)

theorem fields0207 (i : Fin 32) :
    (entry0207 i).IA = shift ∧ (entry0207 i).ID = S (45 + i.val + 1) ∧
      (entry0207 i).IC = S 14 ∧ (entry0207 i).Inext = T 13 (45 + i.val + 1) ∧
      (entry0207 i).Icur = T 13 (45 + i.val) ∧
      (entry0207 i).output = T 14 (45 + i.val) ∧
      (entry0207 i).charge = charge 13 (45 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0208_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0223_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0207 (i : Fin 32) :
    forwardStepOK (-768) (charge 13 (45 + i.val)) shift
      (S (45 + i.val + 1)) (S 14) (T 13 (45 + i.val + 1))
      (T 13 (45 + i.val)) (T 14 (45 + i.val))
      (OriginalRow227Roots.root_pos 14 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 13 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0207.entries OriginalRow227TriangleForward0207.checked
    ⟨i.val, by rw [size0207]; exact i.isLt⟩
  change (entry0207 i).check = true at h
  rcases fields0207 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0208 : OriginalRow227TriangleForward0208.entries.size = 32 := rfl

def entry0208 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0208.entries[i.val]'(by rw [size0208]; exact i.isLt)

theorem fields0208 (i : Fin 32) :
    (entry0208 i).IA = shift ∧ (entry0208 i).ID = S (77 + i.val + 1) ∧
      (entry0208 i).IC = S 14 ∧ (entry0208 i).Inext = T 13 (77 + i.val + 1) ∧
      (entry0208 i).Icur = T 13 (77 + i.val) ∧
      (entry0208 i).output = T 14 (77 + i.val) ∧
      (entry0208 i).charge = charge 13 (77 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0209_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0224_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0208 (i : Fin 32) :
    forwardStepOK (-768) (charge 13 (77 + i.val)) shift
      (S (77 + i.val + 1)) (S 14) (T 13 (77 + i.val + 1))
      (T 13 (77 + i.val)) (T 14 (77 + i.val))
      (OriginalRow227Roots.root_pos 14 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 13 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0208.entries OriginalRow227TriangleForward0208.checked
    ⟨i.val, by rw [size0208]; exact i.isLt⟩
  change (entry0208 i).check = true at h
  rcases fields0208 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0209 : OriginalRow227TriangleForward0209.entries.size = 32 := rfl

def entry0209 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0209.entries[i.val]'(by rw [size0209]; exact i.isLt)

theorem fields0209 (i : Fin 32) :
    (entry0209 i).IA = shift ∧ (entry0209 i).ID = S (109 + i.val + 1) ∧
      (entry0209 i).IC = S 14 ∧ (entry0209 i).Inext = T 13 (109 + i.val + 1) ∧
      (entry0209 i).Icur = T 13 (109 + i.val) ∧
      (entry0209 i).output = T 14 (109 + i.val) ∧
      (entry0209 i).charge = charge 13 (109 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0210_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0225_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0209 (i : Fin 32) :
    forwardStepOK (-768) (charge 13 (109 + i.val)) shift
      (S (109 + i.val + 1)) (S 14) (T 13 (109 + i.val + 1))
      (T 13 (109 + i.val)) (T 14 (109 + i.val))
      (OriginalRow227Roots.root_pos 14 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 13 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0209.entries OriginalRow227TriangleForward0209.checked
    ⟨i.val, by rw [size0209]; exact i.isLt⟩
  change (entry0209 i).check = true at h
  rcases fields0209 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0210 : OriginalRow227TriangleForward0210.entries.size = 32 := rfl

def entry0210 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0210.entries[i.val]'(by rw [size0210]; exact i.isLt)

theorem fields0210 (i : Fin 32) :
    (entry0210 i).IA = shift ∧ (entry0210 i).ID = S (141 + i.val + 1) ∧
      (entry0210 i).IC = S 14 ∧ (entry0210 i).Inext = T 13 (141 + i.val + 1) ∧
      (entry0210 i).Icur = T 13 (141 + i.val) ∧
      (entry0210 i).output = T 14 (141 + i.val) ∧
      (entry0210 i).charge = charge 13 (141 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0211_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0226_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0210 (i : Fin 32) :
    forwardStepOK (-768) (charge 13 (141 + i.val)) shift
      (S (141 + i.val + 1)) (S 14) (T 13 (141 + i.val + 1))
      (T 13 (141 + i.val)) (T 14 (141 + i.val))
      (OriginalRow227Roots.root_pos 14 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 13 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0210.entries OriginalRow227TriangleForward0210.checked
    ⟨i.val, by rw [size0210]; exact i.isLt⟩
  change (entry0210 i).check = true at h
  rcases fields0210 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0211 : OriginalRow227TriangleForward0211.entries.size = 32 := rfl

def entry0211 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0211.entries[i.val]'(by rw [size0211]; exact i.isLt)

theorem fields0211 (i : Fin 32) :
    (entry0211 i).IA = shift ∧ (entry0211 i).ID = S (173 + i.val + 1) ∧
      (entry0211 i).IC = S 14 ∧ (entry0211 i).Inext = T 13 (173 + i.val + 1) ∧
      (entry0211 i).Icur = T 13 (173 + i.val) ∧
      (entry0211 i).output = T 14 (173 + i.val) ∧
      (entry0211 i).charge = charge 13 (173 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0212_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0227_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0211 (i : Fin 32) :
    forwardStepOK (-768) (charge 13 (173 + i.val)) shift
      (S (173 + i.val + 1)) (S 14) (T 13 (173 + i.val + 1))
      (T 13 (173 + i.val)) (T 14 (173 + i.val))
      (OriginalRow227Roots.root_pos 14 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 13 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0211.entries OriginalRow227TriangleForward0211.checked
    ⟨i.val, by rw [size0211]; exact i.isLt⟩
  change (entry0211 i).check = true at h
  rcases fields0211 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0212 : OriginalRow227TriangleForward0212.entries.size = 32 := rfl

def entry0212 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0212.entries[i.val]'(by rw [size0212]; exact i.isLt)

theorem fields0212 (i : Fin 32) :
    (entry0212 i).IA = shift ∧ (entry0212 i).ID = S (205 + i.val + 1) ∧
      (entry0212 i).IC = S 14 ∧ (entry0212 i).Inext = T 13 (205 + i.val + 1) ∧
      (entry0212 i).Icur = T 13 (205 + i.val) ∧
      (entry0212 i).output = T 14 (205 + i.val) ∧
      (entry0212 i).charge = charge 13 (205 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0213_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0228_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0212 (i : Fin 32) :
    forwardStepOK (-768) (charge 13 (205 + i.val)) shift
      (S (205 + i.val + 1)) (S 14) (T 13 (205 + i.val + 1))
      (T 13 (205 + i.val)) (T 14 (205 + i.val))
      (OriginalRow227Roots.root_pos 14 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 13 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0212.entries OriginalRow227TriangleForward0212.checked
    ⟨i.val, by rw [size0212]; exact i.isLt⟩
  change (entry0212 i).check = true at h
  rcases fields0212 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0213 : OriginalRow227TriangleForward0213.entries.size = 32 := rfl

def entry0213 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0213.entries[i.val]'(by rw [size0213]; exact i.isLt)

theorem fields0213 (i : Fin 32) :
    (entry0213 i).IA = shift ∧ (entry0213 i).ID = S (237 + i.val + 1) ∧
      (entry0213 i).IC = S 14 ∧ (entry0213 i).Inext = T 13 (237 + i.val + 1) ∧
      (entry0213 i).Icur = T 13 (237 + i.val) ∧
      (entry0213 i).output = T 14 (237 + i.val) ∧
      (entry0213 i).charge = charge 13 (237 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0214_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0229_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0213 (i : Fin 32) :
    forwardStepOK (-768) (charge 13 (237 + i.val)) shift
      (S (237 + i.val + 1)) (S 14) (T 13 (237 + i.val + 1))
      (T 13 (237 + i.val)) (T 14 (237 + i.val))
      (OriginalRow227Roots.root_pos 14 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 13 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0213.entries OriginalRow227TriangleForward0213.checked
    ⟨i.val, by rw [size0213]; exact i.isLt⟩
  change (entry0213 i).check = true at h
  rcases fields0213 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0214 : OriginalRow227TriangleForward0214.entries.size = 32 := rfl

def entry0214 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0214.entries[i.val]'(by rw [size0214]; exact i.isLt)

theorem fields0214 (i : Fin 32) :
    (entry0214 i).IA = shift ∧ (entry0214 i).ID = S (269 + i.val + 1) ∧
      (entry0214 i).IC = S 14 ∧ (entry0214 i).Inext = T 13 (269 + i.val + 1) ∧
      (entry0214 i).Icur = T 13 (269 + i.val) ∧
      (entry0214 i).output = T 14 (269 + i.val) ∧
      (entry0214 i).charge = charge 13 (269 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0215_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0230_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0214 (i : Fin 32) :
    forwardStepOK (-768) (charge 13 (269 + i.val)) shift
      (S (269 + i.val + 1)) (S 14) (T 13 (269 + i.val + 1))
      (T 13 (269 + i.val)) (T 14 (269 + i.val))
      (OriginalRow227Roots.root_pos 14 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 13 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0214.entries OriginalRow227TriangleForward0214.checked
    ⟨i.val, by rw [size0214]; exact i.isLt⟩
  change (entry0214 i).check = true at h
  rcases fields0214 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0215 : OriginalRow227TriangleForward0215.entries.size = 32 := rfl

def entry0215 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0215.entries[i.val]'(by rw [size0215]; exact i.isLt)

theorem fields0215 (i : Fin 32) :
    (entry0215 i).IA = shift ∧ (entry0215 i).ID = S (301 + i.val + 1) ∧
      (entry0215 i).IC = S 14 ∧ (entry0215 i).Inext = T 13 (301 + i.val + 1) ∧
      (entry0215 i).Icur = T 13 (301 + i.val) ∧
      (entry0215 i).output = T 14 (301 + i.val) ∧
      (entry0215 i).charge = charge 13 (301 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0216_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0231_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0215 (i : Fin 32) :
    forwardStepOK (-768) (charge 13 (301 + i.val)) shift
      (S (301 + i.val + 1)) (S 14) (T 13 (301 + i.val + 1))
      (T 13 (301 + i.val)) (T 14 (301 + i.val))
      (OriginalRow227Roots.root_pos 14 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 13 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0215.entries OriginalRow227TriangleForward0215.checked
    ⟨i.val, by rw [size0215]; exact i.isLt⟩
  change (entry0215 i).check = true at h
  rcases fields0215 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0216 : OriginalRow227TriangleForward0216.entries.size = 32 := rfl

def entry0216 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0216.entries[i.val]'(by rw [size0216]; exact i.isLt)

theorem fields0216 (i : Fin 32) :
    (entry0216 i).IA = shift ∧ (entry0216 i).ID = S (333 + i.val + 1) ∧
      (entry0216 i).IC = S 14 ∧ (entry0216 i).Inext = T 13 (333 + i.val + 1) ∧
      (entry0216 i).Icur = T 13 (333 + i.val) ∧
      (entry0216 i).output = T 14 (333 + i.val) ∧
      (entry0216 i).charge = charge 13 (333 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0217_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0232_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0216 (i : Fin 32) :
    forwardStepOK (-768) (charge 13 (333 + i.val)) shift
      (S (333 + i.val + 1)) (S 14) (T 13 (333 + i.val + 1))
      (T 13 (333 + i.val)) (T 14 (333 + i.val))
      (OriginalRow227Roots.root_pos 14 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 13 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0216.entries OriginalRow227TriangleForward0216.checked
    ⟨i.val, by rw [size0216]; exact i.isLt⟩
  change (entry0216 i).check = true at h
  rcases fields0216 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0217 : OriginalRow227TriangleForward0217.entries.size = 32 := rfl

def entry0217 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0217.entries[i.val]'(by rw [size0217]; exact i.isLt)

theorem fields0217 (i : Fin 32) :
    (entry0217 i).IA = shift ∧ (entry0217 i).ID = S (365 + i.val + 1) ∧
      (entry0217 i).IC = S 14 ∧ (entry0217 i).Inext = T 13 (365 + i.val + 1) ∧
      (entry0217 i).Icur = T 13 (365 + i.val) ∧
      (entry0217 i).output = T 14 (365 + i.val) ∧
      (entry0217 i).charge = charge 13 (365 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0218_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0233_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0217 (i : Fin 32) :
    forwardStepOK (-768) (charge 13 (365 + i.val)) shift
      (S (365 + i.val + 1)) (S 14) (T 13 (365 + i.val + 1))
      (T 13 (365 + i.val)) (T 14 (365 + i.val))
      (OriginalRow227Roots.root_pos 14 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 13 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0217.entries OriginalRow227TriangleForward0217.checked
    ⟨i.val, by rw [size0217]; exact i.isLt⟩
  change (entry0217 i).check = true at h
  rcases fields0217 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0218 : OriginalRow227TriangleForward0218.entries.size = 32 := rfl

def entry0218 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0218.entries[i.val]'(by rw [size0218]; exact i.isLt)

theorem fields0218 (i : Fin 32) :
    (entry0218 i).IA = shift ∧ (entry0218 i).ID = S (397 + i.val + 1) ∧
      (entry0218 i).IC = S 14 ∧ (entry0218 i).Inext = T 13 (397 + i.val + 1) ∧
      (entry0218 i).Icur = T 13 (397 + i.val) ∧
      (entry0218 i).output = T 14 (397 + i.val) ∧
      (entry0218 i).charge = charge 13 (397 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0219_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0234_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0218 (i : Fin 32) :
    forwardStepOK (-768) (charge 13 (397 + i.val)) shift
      (S (397 + i.val + 1)) (S 14) (T 13 (397 + i.val + 1))
      (T 13 (397 + i.val)) (T 14 (397 + i.val))
      (OriginalRow227Roots.root_pos 14 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 13 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0218.entries OriginalRow227TriangleForward0218.checked
    ⟨i.val, by rw [size0218]; exact i.isLt⟩
  change (entry0218 i).check = true at h
  rcases fields0218 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0219 : OriginalRow227TriangleForward0219.entries.size = 32 := rfl

def entry0219 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0219.entries[i.val]'(by rw [size0219]; exact i.isLt)

theorem fields0219 (i : Fin 32) :
    (entry0219 i).IA = shift ∧ (entry0219 i).ID = S (429 + i.val + 1) ∧
      (entry0219 i).IC = S 14 ∧ (entry0219 i).Inext = T 13 (429 + i.val + 1) ∧
      (entry0219 i).Icur = T 13 (429 + i.val) ∧
      (entry0219 i).output = T 14 (429 + i.val) ∧
      (entry0219 i).charge = charge 13 (429 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0220_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0235_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0219 (i : Fin 32) :
    forwardStepOK (-768) (charge 13 (429 + i.val)) shift
      (S (429 + i.val + 1)) (S 14) (T 13 (429 + i.val + 1))
      (T 13 (429 + i.val)) (T 14 (429 + i.val))
      (OriginalRow227Roots.root_pos 14 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 13 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0219.entries OriginalRow227TriangleForward0219.checked
    ⟨i.val, by rw [size0219]; exact i.isLt⟩
  change (entry0219 i).check = true at h
  rcases fields0219 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0220 : OriginalRow227TriangleForward0220.entries.size = 27 := rfl

def entry0220 (i : Fin 27) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0220.entries[i.val]'(by rw [size0220]; exact i.isLt)

theorem fields0220 (i : Fin 27) :
    (entry0220 i).IA = shift ∧ (entry0220 i).ID = S (461 + i.val + 1) ∧
      (entry0220 i).IC = S 14 ∧ (entry0220 i).Inext = T 13 (461 + i.val + 1) ∧
      (entry0220 i).Icur = T 13 (461 + i.val) ∧
      (entry0220 i).output = T 14 (461 + i.val) ∧
      (entry0220 i).charge = charge 13 (461 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root475).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root476).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root477).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root478).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root479).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root480).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root481).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root482).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root483).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root484).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root485).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root486).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root487).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings15.S_eq_root488).symm, (OriginalRow227RootBindings00.S_eq_root14).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow013.block0221_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow014.block0236_value ⟨26, by decide⟩).symm, rfl⟩

theorem step0220 (i : Fin 27) :
    forwardStepOK (-768) (charge 13 (461 + i.val)) shift
      (S (461 + i.val + 1)) (S 14) (T 13 (461 + i.val + 1))
      (T 13 (461 + i.val)) (T 14 (461 + i.val))
      (OriginalRow227Roots.root_pos 14 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 13 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0220.entries OriginalRow227TriangleForward0220.checked
    ⟨i.val, by rw [size0220]; exact i.isLt⟩
  change (entry0220 i).check = true at h
  rcases fields0220 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 13 ≤ d) (hhi : d < 488) :
    forwardStepOK (-768) (charge 13 d) shift (S (d + 1)) (S 14)
      (T 13 (d + 1)) (T 13 d) (T 14 d)
      (OriginalRow227Roots.root_pos 14 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 13 (by decide)) = true := by
  by_cases h237 : d < 237
  ·
    by_cases h109 : d < 109
    ·
      by_cases h45 : d < 45
      ·
        have hi : d - 13 < 32 := by omega
        have heq : 13 + (d - 13) = d := by omega
        simpa only [heq] using step0206 ⟨d - 13, hi⟩
      ·
        by_cases h77 : d < 77
        ·
          have hi : d - 45 < 32 := by omega
          have heq : 45 + (d - 45) = d := by omega
          simpa only [heq] using step0207 ⟨d - 45, hi⟩
        ·
          have hi : d - 77 < 32 := by omega
          have heq : 77 + (d - 77) = d := by omega
          simpa only [heq] using step0208 ⟨d - 77, hi⟩
    ·
      by_cases h173 : d < 173
      ·
        by_cases h141 : d < 141
        ·
          have hi : d - 109 < 32 := by omega
          have heq : 109 + (d - 109) = d := by omega
          simpa only [heq] using step0209 ⟨d - 109, hi⟩
        ·
          have hi : d - 141 < 32 := by omega
          have heq : 141 + (d - 141) = d := by omega
          simpa only [heq] using step0210 ⟨d - 141, hi⟩
      ·
        by_cases h205 : d < 205
        ·
          have hi : d - 173 < 32 := by omega
          have heq : 173 + (d - 173) = d := by omega
          simpa only [heq] using step0211 ⟨d - 173, hi⟩
        ·
          have hi : d - 205 < 32 := by omega
          have heq : 205 + (d - 205) = d := by omega
          simpa only [heq] using step0212 ⟨d - 205, hi⟩
  ·
    by_cases h365 : d < 365
    ·
      by_cases h301 : d < 301
      ·
        by_cases h269 : d < 269
        ·
          have hi : d - 237 < 32 := by omega
          have heq : 237 + (d - 237) = d := by omega
          simpa only [heq] using step0213 ⟨d - 237, hi⟩
        ·
          have hi : d - 269 < 32 := by omega
          have heq : 269 + (d - 269) = d := by omega
          simpa only [heq] using step0214 ⟨d - 269, hi⟩
      ·
        by_cases h333 : d < 333
        ·
          have hi : d - 301 < 32 := by omega
          have heq : 301 + (d - 301) = d := by omega
          simpa only [heq] using step0215 ⟨d - 301, hi⟩
        ·
          have hi : d - 333 < 32 := by omega
          have heq : 333 + (d - 333) = d := by omega
          simpa only [heq] using step0216 ⟨d - 333, hi⟩
    ·
      by_cases h429 : d < 429
      ·
        by_cases h397 : d < 397
        ·
          have hi : d - 365 < 32 := by omega
          have heq : 365 + (d - 365) = d := by omega
          simpa only [heq] using step0217 ⟨d - 365, hi⟩
        ·
          have hi : d - 397 < 32 := by omega
          have heq : 397 + (d - 397) = d := by omega
          simpa only [heq] using step0218 ⟨d - 397, hi⟩
      ·
        by_cases h461 : d < 461
        ·
          have hi : d - 429 < 32 := by omega
          have heq : 429 + (d - 429) = d := by omega
          simpa only [heq] using step0219 ⟨d - 429, hi⟩
        ·
          have hi : d - 461 < 27 := by omega
          have heq : 461 + (d - 461) = d := by omega
          simpa only [heq] using step0220 ⟨d - 461, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.fields0206,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.step0206,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.fields0207,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.step0207,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.fields0208,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.step0208,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.fields0209,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.step0209,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.fields0210,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.step0210,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.fields0211,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.step0211,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.fields0212,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.step0212,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.fields0213,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.step0213,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.fields0214,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.step0214,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.fields0215,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.step0215,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.fields0216,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.step0216,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.fields0217,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.step0217,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.fields0218,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.step0218,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.fields0219,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.step0219,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.fields0220,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.step0220,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow014
