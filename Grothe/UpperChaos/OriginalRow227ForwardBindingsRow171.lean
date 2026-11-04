import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow170
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow171
import Grothe.UpperChaos.OriginalRow227TriangleForward1850
import Grothe.UpperChaos.OriginalRow227TriangleForward1851
import Grothe.UpperChaos.OriginalRow227TriangleForward1852
import Grothe.UpperChaos.OriginalRow227TriangleForward1853
import Grothe.UpperChaos.OriginalRow227TriangleForward1854
import Grothe.UpperChaos.OriginalRow227TriangleForward1855

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow171

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1850 : OriginalRow227TriangleForward1850.entries.size = 32 := rfl

def entry1850 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1850.entries[i.val]'(by rw [size1850]; exact i.isLt)

theorem fields1850 (i : Fin 32) :
    (entry1850 i).IA = shift ∧ (entry1850 i).ID = S (170 + i.val + 1) ∧
      (entry1850 i).IC = S 171 ∧ (entry1850 i).Inext = T 170 (170 + i.val + 1) ∧
      (entry1850 i).Icur = T 170 (170 + i.val) ∧
      (entry1850 i).output = T 171 (170 + i.val) ∧
      (entry1850 i).charge = charge 170 (170 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1866_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1850 (i : Fin 32) :
    forwardStepOK (-768) (charge 170 (170 + i.val)) shift
      (S (170 + i.val + 1)) (S 171) (T 170 (170 + i.val + 1))
      (T 170 (170 + i.val)) (T 171 (170 + i.val))
      (OriginalRow227Roots.root_pos 171 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 170 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1850.entries OriginalRow227TriangleForward1850.checked
    ⟨i.val, by rw [size1850]; exact i.isLt⟩
  change (entry1850 i).check = true at h
  rcases fields1850 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1851 : OriginalRow227TriangleForward1851.entries.size = 32 := rfl

def entry1851 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1851.entries[i.val]'(by rw [size1851]; exact i.isLt)

theorem fields1851 (i : Fin 32) :
    (entry1851 i).IA = shift ∧ (entry1851 i).ID = S (202 + i.val + 1) ∧
      (entry1851 i).IC = S 171 ∧ (entry1851 i).Inext = T 170 (202 + i.val + 1) ∧
      (entry1851 i).Icur = T 170 (202 + i.val) ∧
      (entry1851 i).output = T 171 (202 + i.val) ∧
      (entry1851 i).charge = charge 170 (202 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1867_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1851 (i : Fin 32) :
    forwardStepOK (-768) (charge 170 (202 + i.val)) shift
      (S (202 + i.val + 1)) (S 171) (T 170 (202 + i.val + 1))
      (T 170 (202 + i.val)) (T 171 (202 + i.val))
      (OriginalRow227Roots.root_pos 171 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 170 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1851.entries OriginalRow227TriangleForward1851.checked
    ⟨i.val, by rw [size1851]; exact i.isLt⟩
  change (entry1851 i).check = true at h
  rcases fields1851 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1852 : OriginalRow227TriangleForward1852.entries.size = 32 := rfl

def entry1852 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1852.entries[i.val]'(by rw [size1852]; exact i.isLt)

theorem fields1852 (i : Fin 32) :
    (entry1852 i).IA = shift ∧ (entry1852 i).ID = S (234 + i.val + 1) ∧
      (entry1852 i).IC = S 171 ∧ (entry1852 i).Inext = T 170 (234 + i.val + 1) ∧
      (entry1852 i).Icur = T 170 (234 + i.val) ∧
      (entry1852 i).output = T 171 (234 + i.val) ∧
      (entry1852 i).charge = charge 170 (234 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1868_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1852 (i : Fin 32) :
    forwardStepOK (-768) (charge 170 (234 + i.val)) shift
      (S (234 + i.val + 1)) (S 171) (T 170 (234 + i.val + 1))
      (T 170 (234 + i.val)) (T 171 (234 + i.val))
      (OriginalRow227Roots.root_pos 171 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 170 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1852.entries OriginalRow227TriangleForward1852.checked
    ⟨i.val, by rw [size1852]; exact i.isLt⟩
  change (entry1852 i).check = true at h
  rcases fields1852 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1853 : OriginalRow227TriangleForward1853.entries.size = 32 := rfl

def entry1853 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1853.entries[i.val]'(by rw [size1853]; exact i.isLt)

theorem fields1853 (i : Fin 32) :
    (entry1853 i).IA = shift ∧ (entry1853 i).ID = S (266 + i.val + 1) ∧
      (entry1853 i).IC = S 171 ∧ (entry1853 i).Inext = T 170 (266 + i.val + 1) ∧
      (entry1853 i).Icur = T 170 (266 + i.val) ∧
      (entry1853 i).output = T 171 (266 + i.val) ∧
      (entry1853 i).charge = charge 170 (266 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1869_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1853 (i : Fin 32) :
    forwardStepOK (-768) (charge 170 (266 + i.val)) shift
      (S (266 + i.val + 1)) (S 171) (T 170 (266 + i.val + 1))
      (T 170 (266 + i.val)) (T 171 (266 + i.val))
      (OriginalRow227Roots.root_pos 171 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 170 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1853.entries OriginalRow227TriangleForward1853.checked
    ⟨i.val, by rw [size1853]; exact i.isLt⟩
  change (entry1853 i).check = true at h
  rcases fields1853 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1854 : OriginalRow227TriangleForward1854.entries.size = 32 := rfl

def entry1854 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1854.entries[i.val]'(by rw [size1854]; exact i.isLt)

theorem fields1854 (i : Fin 32) :
    (entry1854 i).IA = shift ∧ (entry1854 i).ID = S (298 + i.val + 1) ∧
      (entry1854 i).IC = S 171 ∧ (entry1854 i).Inext = T 170 (298 + i.val + 1) ∧
      (entry1854 i).Icur = T 170 (298 + i.val) ∧
      (entry1854 i).output = T 171 (298 + i.val) ∧
      (entry1854 i).charge = charge 170 (298 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1865_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1865_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1865_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1870_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1854 (i : Fin 32) :
    forwardStepOK (-768) (charge 170 (298 + i.val)) shift
      (S (298 + i.val + 1)) (S 171) (T 170 (298 + i.val + 1))
      (T 170 (298 + i.val)) (T 171 (298 + i.val))
      (OriginalRow227Roots.root_pos 171 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 170 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1854.entries OriginalRow227TriangleForward1854.checked
    ⟨i.val, by rw [size1854]; exact i.isLt⟩
  change (entry1854 i).check = true at h
  rcases fields1854 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1855 : OriginalRow227TriangleForward1855.entries.size = 1 := rfl

def entry1855 (i : Fin 1) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1855.entries[i.val]'(by rw [size1855]; exact i.isLt)

theorem fields1855 (i : Fin 1) :
    (entry1855 i).IA = shift ∧ (entry1855 i).ID = S (330 + i.val + 1) ∧
      (entry1855 i).IC = S 171 ∧ (entry1855 i).Inext = T 170 (330 + i.val + 1) ∧
      (entry1855 i).Icur = T 170 (330 + i.val) ∧
      (entry1855 i).output = T 171 (330 + i.val) ∧
      (entry1855 i).charge = charge 170 (330 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings05.S_eq_root171).symm,
      (OriginalRow227TriangleBindingsRow170.block1865_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1865_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow171.block1871_value ⟨0, by decide⟩).symm, rfl⟩

theorem step1855 (i : Fin 1) :
    forwardStepOK (-768) (charge 170 (330 + i.val)) shift
      (S (330 + i.val + 1)) (S 171) (T 170 (330 + i.val + 1))
      (T 170 (330 + i.val)) (T 171 (330 + i.val))
      (OriginalRow227Roots.root_pos 171 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 170 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1855.entries OriginalRow227TriangleForward1855.checked
    ⟨i.val, by rw [size1855]; exact i.isLt⟩
  change (entry1855 i).check = true at h
  rcases fields1855 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 170 ≤ d) (hhi : d < 331) :
    forwardStepOK (-768) (charge 170 d) shift (S (d + 1)) (S 171)
      (T 170 (d + 1)) (T 170 d) (T 171 d)
      (OriginalRow227Roots.root_pos 171 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 170 (by decide)) = true := by
  by_cases h266 : d < 266
  ·
    by_cases h202 : d < 202
    ·
      have hi : d - 170 < 32 := by omega
      have heq : 170 + (d - 170) = d := by omega
      simpa only [heq] using step1850 ⟨d - 170, hi⟩
    ·
      by_cases h234 : d < 234
      ·
        have hi : d - 202 < 32 := by omega
        have heq : 202 + (d - 202) = d := by omega
        simpa only [heq] using step1851 ⟨d - 202, hi⟩
      ·
        have hi : d - 234 < 32 := by omega
        have heq : 234 + (d - 234) = d := by omega
        simpa only [heq] using step1852 ⟨d - 234, hi⟩
  ·
    by_cases h298 : d < 298
    ·
      have hi : d - 266 < 32 := by omega
      have heq : 266 + (d - 266) = d := by omega
      simpa only [heq] using step1853 ⟨d - 266, hi⟩
    ·
      by_cases h330 : d < 330
      ·
        have hi : d - 298 < 32 := by omega
        have heq : 298 + (d - 298) = d := by omega
        simpa only [heq] using step1854 ⟨d - 298, hi⟩
      ·
        have hi : d - 330 < 1 := by omega
        have heq : 330 + (d - 330) = d := by omega
        simpa only [heq] using step1855 ⟨d - 330, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow171.fields1850,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow171.step1850,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow171.fields1851,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow171.step1851,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow171.fields1852,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow171.step1852,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow171.fields1853,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow171.step1853,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow171.fields1854,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow171.step1854,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow171.fields1855,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow171.step1855,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow171.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow171
