import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow184
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow185
import Grothe.UpperChaos.OriginalRow227TriangleForward1921
import Grothe.UpperChaos.OriginalRow227TriangleForward1922
import Grothe.UpperChaos.OriginalRow227TriangleForward1923
import Grothe.UpperChaos.OriginalRow227TriangleForward1924
import Grothe.UpperChaos.OriginalRow227TriangleForward1925

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow185

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1921 : OriginalRow227TriangleForward1921.entries.size = 32 := rfl

def entry1921 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1921.entries[i.val]'(by rw [size1921]; exact i.isLt)

theorem fields1921 (i : Fin 32) :
    (entry1921 i).IA = shift ∧ (entry1921 i).ID = S (184 + i.val + 1) ∧
      (entry1921 i).IC = S 185 ∧ (entry1921 i).Inext = T 184 (184 + i.val + 1) ∧
      (entry1921 i).Icur = T 184 (184 + i.val) ∧
      (entry1921 i).output = T 185 (184 + i.val) ∧
      (entry1921 i).charge = charge 184 (184 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1932_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1921 (i : Fin 32) :
    forwardStepOK (-768) (charge 184 (184 + i.val)) shift
      (S (184 + i.val + 1)) (S 185) (T 184 (184 + i.val + 1))
      (T 184 (184 + i.val)) (T 185 (184 + i.val))
      (OriginalRow227Roots.root_pos 185 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 184 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1921.entries OriginalRow227TriangleForward1921.checked
    ⟨i.val, by rw [size1921]; exact i.isLt⟩
  change (entry1921 i).check = true at h
  rcases fields1921 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1922 : OriginalRow227TriangleForward1922.entries.size = 32 := rfl

def entry1922 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1922.entries[i.val]'(by rw [size1922]; exact i.isLt)

theorem fields1922 (i : Fin 32) :
    (entry1922 i).IA = shift ∧ (entry1922 i).ID = S (216 + i.val + 1) ∧
      (entry1922 i).IC = S 185 ∧ (entry1922 i).Inext = T 184 (216 + i.val + 1) ∧
      (entry1922 i).Icur = T 184 (216 + i.val) ∧
      (entry1922 i).output = T 185 (216 + i.val) ∧
      (entry1922 i).charge = charge 184 (216 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1933_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1922 (i : Fin 32) :
    forwardStepOK (-768) (charge 184 (216 + i.val)) shift
      (S (216 + i.val + 1)) (S 185) (T 184 (216 + i.val + 1))
      (T 184 (216 + i.val)) (T 185 (216 + i.val))
      (OriginalRow227Roots.root_pos 185 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 184 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1922.entries OriginalRow227TriangleForward1922.checked
    ⟨i.val, by rw [size1922]; exact i.isLt⟩
  change (entry1922 i).check = true at h
  rcases fields1922 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1923 : OriginalRow227TriangleForward1923.entries.size = 32 := rfl

def entry1923 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1923.entries[i.val]'(by rw [size1923]; exact i.isLt)

theorem fields1923 (i : Fin 32) :
    (entry1923 i).IA = shift ∧ (entry1923 i).ID = S (248 + i.val + 1) ∧
      (entry1923 i).IC = S 185 ∧ (entry1923 i).Inext = T 184 (248 + i.val + 1) ∧
      (entry1923 i).Icur = T 184 (248 + i.val) ∧
      (entry1923 i).output = T 185 (248 + i.val) ∧
      (entry1923 i).charge = charge 184 (248 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1934_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1923 (i : Fin 32) :
    forwardStepOK (-768) (charge 184 (248 + i.val)) shift
      (S (248 + i.val + 1)) (S 185) (T 184 (248 + i.val + 1))
      (T 184 (248 + i.val)) (T 185 (248 + i.val))
      (OriginalRow227Roots.root_pos 185 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 184 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1923.entries OriginalRow227TriangleForward1923.checked
    ⟨i.val, by rw [size1923]; exact i.isLt⟩
  change (entry1923 i).check = true at h
  rcases fields1923 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1924 : OriginalRow227TriangleForward1924.entries.size = 32 := rfl

def entry1924 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1924.entries[i.val]'(by rw [size1924]; exact i.isLt)

theorem fields1924 (i : Fin 32) :
    (entry1924 i).IA = shift ∧ (entry1924 i).ID = S (280 + i.val + 1) ∧
      (entry1924 i).IC = S 185 ∧ (entry1924 i).Inext = T 184 (280 + i.val + 1) ∧
      (entry1924 i).Icur = T 184 (280 + i.val) ∧
      (entry1924 i).output = T 185 (280 + i.val) ∧
      (entry1924 i).charge = charge 184 (280 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1936_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1935_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1936_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1936_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1924 (i : Fin 32) :
    forwardStepOK (-768) (charge 184 (280 + i.val)) shift
      (S (280 + i.val + 1)) (S 185) (T 184 (280 + i.val + 1))
      (T 184 (280 + i.val)) (T 185 (280 + i.val))
      (OriginalRow227Roots.root_pos 185 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 184 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1924.entries OriginalRow227TriangleForward1924.checked
    ⟨i.val, by rw [size1924]; exact i.isLt⟩
  change (entry1924 i).check = true at h
  rcases fields1924 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1925 : OriginalRow227TriangleForward1925.entries.size = 5 := rfl

def entry1925 (i : Fin 5) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1925.entries[i.val]'(by rw [size1925]; exact i.isLt)

theorem fields1925 (i : Fin 5) :
    (entry1925 i).IA = shift ∧ (entry1925 i).ID = S (312 + i.val + 1) ∧
      (entry1925 i).IC = S 185 ∧ (entry1925 i).Inext = T 184 (312 + i.val + 1) ∧
      (entry1925 i).Icur = T 184 (312 + i.val) ∧
      (entry1925 i).output = T 185 (312 + i.val) ∧
      (entry1925 i).charge = charge 184 (312 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1936_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1936_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1941_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1936_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1936_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1941_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1936_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1936_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1941_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1936_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1936_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1941_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root185).symm,
      (OriginalRow227TriangleBindingsRow184.block1936_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow184.block1936_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1941_value ⟨4, by decide⟩).symm, rfl⟩

theorem step1925 (i : Fin 5) :
    forwardStepOK (-768) (charge 184 (312 + i.val)) shift
      (S (312 + i.val + 1)) (S 185) (T 184 (312 + i.val + 1))
      (T 184 (312 + i.val)) (T 185 (312 + i.val))
      (OriginalRow227Roots.root_pos 185 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 184 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1925.entries OriginalRow227TriangleForward1925.checked
    ⟨i.val, by rw [size1925]; exact i.isLt⟩
  change (entry1925 i).check = true at h
  rcases fields1925 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 184 ≤ d) (hhi : d < 317) :
    forwardStepOK (-768) (charge 184 d) shift (S (d + 1)) (S 185)
      (T 184 (d + 1)) (T 184 d) (T 185 d)
      (OriginalRow227Roots.root_pos 185 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 184 (by decide)) = true := by
  by_cases h248 : d < 248
  ·
    by_cases h216 : d < 216
    ·
      have hi : d - 184 < 32 := by omega
      have heq : 184 + (d - 184) = d := by omega
      simpa only [heq] using step1921 ⟨d - 184, hi⟩
    ·
      have hi : d - 216 < 32 := by omega
      have heq : 216 + (d - 216) = d := by omega
      simpa only [heq] using step1922 ⟨d - 216, hi⟩
  ·
    by_cases h280 : d < 280
    ·
      have hi : d - 248 < 32 := by omega
      have heq : 248 + (d - 248) = d := by omega
      simpa only [heq] using step1923 ⟨d - 248, hi⟩
    ·
      by_cases h312 : d < 312
      ·
        have hi : d - 280 < 32 := by omega
        have heq : 280 + (d - 280) = d := by omega
        simpa only [heq] using step1924 ⟨d - 280, hi⟩
      ·
        have hi : d - 312 < 5 := by omega
        have heq : 312 + (d - 312) = d := by omega
        simpa only [heq] using step1925 ⟨d - 312, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow185.fields1921,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow185.step1921,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow185.fields1922,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow185.step1922,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow185.fields1923,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow185.step1923,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow185.fields1924,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow185.step1924,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow185.fields1925,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow185.step1925,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow185.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow185
