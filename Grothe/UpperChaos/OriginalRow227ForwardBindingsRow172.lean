import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow171
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow172
import Grothe.UpperChaos.OriginalRow227TriangleForward1856
import Grothe.UpperChaos.OriginalRow227TriangleForward1857
import Grothe.UpperChaos.OriginalRow227TriangleForward1858
import Grothe.UpperChaos.OriginalRow227TriangleForward1859
import Grothe.UpperChaos.OriginalRow227TriangleForward1860

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow172

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1856 : OriginalRow227TriangleForward1856.entries.size = 32 := rfl

def entry1856 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1856.entries[i.val]'(by rw [size1856]; exact i.isLt)

theorem fields1856 (i : Fin 32) :
    (entry1856 i).IA = shift ∧ (entry1856 i).ID = S (171 + i.val + 1) ∧
      (entry1856 i).IC = S 172 ∧ (entry1856 i).Inext = T 171 (171 + i.val + 1) ∧
      (entry1856 i).Icur = T 171 (171 + i.val) ∧
      (entry1856 i).output = T 172 (171 + i.val) ∧
      (entry1856 i).charge = charge 171 (171 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1856 (i : Fin 32) :
    forwardStepOK (-768) (charge 171 (171 + i.val)) shift
      (S (171 + i.val + 1)) (S 172) (T 171 (171 + i.val + 1))
      (T 171 (171 + i.val)) (T 172 (171 + i.val))
      (OriginalRow227Roots.root_pos 172 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 171 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1856.entries OriginalRow227TriangleForward1856.checked
    ⟨i.val, by rw [size1856]; exact i.isLt⟩
  change (entry1856 i).check = true at h
  rcases fields1856 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1857 : OriginalRow227TriangleForward1857.entries.size = 32 := rfl

def entry1857 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1857.entries[i.val]'(by rw [size1857]; exact i.isLt)

theorem fields1857 (i : Fin 32) :
    (entry1857 i).IA = shift ∧ (entry1857 i).ID = S (203 + i.val + 1) ∧
      (entry1857 i).IC = S 172 ∧ (entry1857 i).Inext = T 171 (203 + i.val + 1) ∧
      (entry1857 i).Icur = T 171 (203 + i.val) ∧
      (entry1857 i).output = T 172 (203 + i.val) ∧
      (entry1857 i).charge = charge 171 (203 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1857 (i : Fin 32) :
    forwardStepOK (-768) (charge 171 (203 + i.val)) shift
      (S (203 + i.val + 1)) (S 172) (T 171 (203 + i.val + 1))
      (T 171 (203 + i.val)) (T 172 (203 + i.val))
      (OriginalRow227Roots.root_pos 172 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 171 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1857.entries OriginalRow227TriangleForward1857.checked
    ⟨i.val, by rw [size1857]; exact i.isLt⟩
  change (entry1857 i).check = true at h
  rcases fields1857 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1858 : OriginalRow227TriangleForward1858.entries.size = 32 := rfl

def entry1858 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1858.entries[i.val]'(by rw [size1858]; exact i.isLt)

theorem fields1858 (i : Fin 32) :
    (entry1858 i).IA = shift ∧ (entry1858 i).ID = S (235 + i.val + 1) ∧
      (entry1858 i).IC = S 172 ∧ (entry1858 i).Inext = T 171 (235 + i.val + 1) ∧
      (entry1858 i).Icur = T 171 (235 + i.val) ∧
      (entry1858 i).output = T 172 (235 + i.val) ∧
      (entry1858 i).charge = charge 171 (235 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1858 (i : Fin 32) :
    forwardStepOK (-768) (charge 171 (235 + i.val)) shift
      (S (235 + i.val + 1)) (S 172) (T 171 (235 + i.val + 1))
      (T 171 (235 + i.val)) (T 172 (235 + i.val))
      (OriginalRow227Roots.root_pos 172 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 171 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1858.entries OriginalRow227TriangleForward1858.checked
    ⟨i.val, by rw [size1858]; exact i.isLt⟩
  change (entry1858 i).check = true at h
  rcases fields1858 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1859 : OriginalRow227TriangleForward1859.entries.size = 32 := rfl

def entry1859 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1859.entries[i.val]'(by rw [size1859]; exact i.isLt)

theorem fields1859 (i : Fin 32) :
    (entry1859 i).IA = shift ∧ (entry1859 i).ID = S (267 + i.val + 1) ∧
      (entry1859 i).IC = S 172 ∧ (entry1859 i).Inext = T 171 (267 + i.val + 1) ∧
      (entry1859 i).Icur = T 171 (267 + i.val) ∧
      (entry1859 i).output = T 172 (267 + i.val) ∧
      (entry1859 i).charge = charge 171 (267 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1859 (i : Fin 32) :
    forwardStepOK (-768) (charge 171 (267 + i.val)) shift
      (S (267 + i.val + 1)) (S 172) (T 171 (267 + i.val + 1))
      (T 171 (267 + i.val)) (T 172 (267 + i.val))
      (OriginalRow227Roots.root_pos 172 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 171 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1859.entries OriginalRow227TriangleForward1859.checked
    ⟨i.val, by rw [size1859]; exact i.isLt⟩
  change (entry1859 i).check = true at h
  rcases fields1859 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1860 : OriginalRow227TriangleForward1860.entries.size = 31 := rfl

def entry1860 (i : Fin 31) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1860.entries[i.val]'(by rw [size1860]; exact i.isLt)

theorem fields1860 (i : Fin 31) :
    (entry1860 i).IA = shift ∧ (entry1860 i).ID = S (299 + i.val + 1) ∧
      (entry1860 i).IC = S 172 ∧ (entry1860 i).Inext = T 171 (299 + i.val + 1) ∧
      (entry1860 i).Icur = T 171 (299 + i.val) ∧
      (entry1860 i).output = T 172 (299 + i.val) ∧
      (entry1860 i).charge = charge 171 (299 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings05.S_eq_root172).symm,
      (OriginalRow227TriangleBindingsRow171.block1871_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨30, by decide⟩).symm, rfl⟩

theorem step1860 (i : Fin 31) :
    forwardStepOK (-768) (charge 171 (299 + i.val)) shift
      (S (299 + i.val + 1)) (S 172) (T 171 (299 + i.val + 1))
      (T 171 (299 + i.val)) (T 172 (299 + i.val))
      (OriginalRow227Roots.root_pos 172 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 171 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1860.entries OriginalRow227TriangleForward1860.checked
    ⟨i.val, by rw [size1860]; exact i.isLt⟩
  change (entry1860 i).check = true at h
  rcases fields1860 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 171 ≤ d) (hhi : d < 330) :
    forwardStepOK (-768) (charge 171 d) shift (S (d + 1)) (S 172)
      (T 171 (d + 1)) (T 171 d) (T 172 d)
      (OriginalRow227Roots.root_pos 172 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 171 (by decide)) = true := by
  by_cases h235 : d < 235
  ·
    by_cases h203 : d < 203
    ·
      have hi : d - 171 < 32 := by omega
      have heq : 171 + (d - 171) = d := by omega
      simpa only [heq] using step1856 ⟨d - 171, hi⟩
    ·
      have hi : d - 203 < 32 := by omega
      have heq : 203 + (d - 203) = d := by omega
      simpa only [heq] using step1857 ⟨d - 203, hi⟩
  ·
    by_cases h267 : d < 267
    ·
      have hi : d - 235 < 32 := by omega
      have heq : 235 + (d - 235) = d := by omega
      simpa only [heq] using step1858 ⟨d - 235, hi⟩
    ·
      by_cases h299 : d < 299
      ·
        have hi : d - 267 < 32 := by omega
        have heq : 267 + (d - 267) = d := by omega
        simpa only [heq] using step1859 ⟨d - 267, hi⟩
      ·
        have hi : d - 299 < 31 := by omega
        have heq : 299 + (d - 299) = d := by omega
        simpa only [heq] using step1860 ⟨d - 299, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow172.fields1856,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow172.step1856,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow172.fields1857,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow172.step1857,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow172.fields1858,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow172.step1858,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow172.fields1859,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow172.step1859,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow172.fields1860,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow172.step1860,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow172.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow172
