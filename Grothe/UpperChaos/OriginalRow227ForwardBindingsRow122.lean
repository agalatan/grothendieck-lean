import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow121
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122
import Grothe.UpperChaos.OriginalRow227TriangleForward1502
import Grothe.UpperChaos.OriginalRow227TriangleForward1503
import Grothe.UpperChaos.OriginalRow227TriangleForward1504
import Grothe.UpperChaos.OriginalRow227TriangleForward1505
import Grothe.UpperChaos.OriginalRow227TriangleForward1506
import Grothe.UpperChaos.OriginalRow227TriangleForward1507
import Grothe.UpperChaos.OriginalRow227TriangleForward1508
import Grothe.UpperChaos.OriginalRow227TriangleForward1509
import Grothe.UpperChaos.OriginalRow227TriangleForward1510

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1502 : OriginalRow227TriangleForward1502.entries.size = 32 := rfl

def entry1502 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1502.entries[i.val]'(by rw [size1502]; exact i.isLt)

theorem fields1502 (i : Fin 32) :
    (entry1502 i).IA = shift ∧ (entry1502 i).ID = S (121 + i.val + 1) ∧
      (entry1502 i).IC = S 122 ∧ (entry1502 i).Inext = T 121 (121 + i.val + 1) ∧
      (entry1502 i).Icur = T 121 (121 + i.val) ∧
      (entry1502 i).output = T 122 (121 + i.val) ∧
      (entry1502 i).charge = charge 121 (121 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1509_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1502 (i : Fin 32) :
    forwardStepOK (-768) (charge 121 (121 + i.val)) shift
      (S (121 + i.val + 1)) (S 122) (T 121 (121 + i.val + 1))
      (T 121 (121 + i.val)) (T 122 (121 + i.val))
      (OriginalRow227Roots.root_pos 122 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 121 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1502.entries OriginalRow227TriangleForward1502.checked
    ⟨i.val, by rw [size1502]; exact i.isLt⟩
  change (entry1502 i).check = true at h
  rcases fields1502 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1503 : OriginalRow227TriangleForward1503.entries.size = 32 := rfl

def entry1503 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1503.entries[i.val]'(by rw [size1503]; exact i.isLt)

theorem fields1503 (i : Fin 32) :
    (entry1503 i).IA = shift ∧ (entry1503 i).ID = S (153 + i.val + 1) ∧
      (entry1503 i).IC = S 122 ∧ (entry1503 i).Inext = T 121 (153 + i.val + 1) ∧
      (entry1503 i).Icur = T 121 (153 + i.val) ∧
      (entry1503 i).output = T 122 (153 + i.val) ∧
      (entry1503 i).charge = charge 121 (153 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1510_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1503 (i : Fin 32) :
    forwardStepOK (-768) (charge 121 (153 + i.val)) shift
      (S (153 + i.val + 1)) (S 122) (T 121 (153 + i.val + 1))
      (T 121 (153 + i.val)) (T 122 (153 + i.val))
      (OriginalRow227Roots.root_pos 122 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 121 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1503.entries OriginalRow227TriangleForward1503.checked
    ⟨i.val, by rw [size1503]; exact i.isLt⟩
  change (entry1503 i).check = true at h
  rcases fields1503 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1504 : OriginalRow227TriangleForward1504.entries.size = 32 := rfl

def entry1504 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1504.entries[i.val]'(by rw [size1504]; exact i.isLt)

theorem fields1504 (i : Fin 32) :
    (entry1504 i).IA = shift ∧ (entry1504 i).ID = S (185 + i.val + 1) ∧
      (entry1504 i).IC = S 122 ∧ (entry1504 i).Inext = T 121 (185 + i.val + 1) ∧
      (entry1504 i).Icur = T 121 (185 + i.val) ∧
      (entry1504 i).output = T 122 (185 + i.val) ∧
      (entry1504 i).charge = charge 121 (185 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1511_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1504 (i : Fin 32) :
    forwardStepOK (-768) (charge 121 (185 + i.val)) shift
      (S (185 + i.val + 1)) (S 122) (T 121 (185 + i.val + 1))
      (T 121 (185 + i.val)) (T 122 (185 + i.val))
      (OriginalRow227Roots.root_pos 122 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 121 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1504.entries OriginalRow227TriangleForward1504.checked
    ⟨i.val, by rw [size1504]; exact i.isLt⟩
  change (entry1504 i).check = true at h
  rcases fields1504 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1505 : OriginalRow227TriangleForward1505.entries.size = 32 := rfl

def entry1505 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1505.entries[i.val]'(by rw [size1505]; exact i.isLt)

theorem fields1505 (i : Fin 32) :
    (entry1505 i).IA = shift ∧ (entry1505 i).ID = S (217 + i.val + 1) ∧
      (entry1505 i).IC = S 122 ∧ (entry1505 i).Inext = T 121 (217 + i.val + 1) ∧
      (entry1505 i).Icur = T 121 (217 + i.val) ∧
      (entry1505 i).output = T 122 (217 + i.val) ∧
      (entry1505 i).charge = charge 121 (217 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1512_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1505 (i : Fin 32) :
    forwardStepOK (-768) (charge 121 (217 + i.val)) shift
      (S (217 + i.val + 1)) (S 122) (T 121 (217 + i.val + 1))
      (T 121 (217 + i.val)) (T 122 (217 + i.val))
      (OriginalRow227Roots.root_pos 122 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 121 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1505.entries OriginalRow227TriangleForward1505.checked
    ⟨i.val, by rw [size1505]; exact i.isLt⟩
  change (entry1505 i).check = true at h
  rcases fields1505 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1506 : OriginalRow227TriangleForward1506.entries.size = 32 := rfl

def entry1506 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1506.entries[i.val]'(by rw [size1506]; exact i.isLt)

theorem fields1506 (i : Fin 32) :
    (entry1506 i).IA = shift ∧ (entry1506 i).ID = S (249 + i.val + 1) ∧
      (entry1506 i).IC = S 122 ∧ (entry1506 i).Inext = T 121 (249 + i.val + 1) ∧
      (entry1506 i).Icur = T 121 (249 + i.val) ∧
      (entry1506 i).output = T 122 (249 + i.val) ∧
      (entry1506 i).charge = charge 121 (249 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1513_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1506 (i : Fin 32) :
    forwardStepOK (-768) (charge 121 (249 + i.val)) shift
      (S (249 + i.val + 1)) (S 122) (T 121 (249 + i.val + 1))
      (T 121 (249 + i.val)) (T 122 (249 + i.val))
      (OriginalRow227Roots.root_pos 122 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 121 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1506.entries OriginalRow227TriangleForward1506.checked
    ⟨i.val, by rw [size1506]; exact i.isLt⟩
  change (entry1506 i).check = true at h
  rcases fields1506 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1507 : OriginalRow227TriangleForward1507.entries.size = 32 := rfl

def entry1507 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1507.entries[i.val]'(by rw [size1507]; exact i.isLt)

theorem fields1507 (i : Fin 32) :
    (entry1507 i).IA = shift ∧ (entry1507 i).ID = S (281 + i.val + 1) ∧
      (entry1507 i).IC = S 122 ∧ (entry1507 i).Inext = T 121 (281 + i.val + 1) ∧
      (entry1507 i).Icur = T 121 (281 + i.val) ∧
      (entry1507 i).output = T 122 (281 + i.val) ∧
      (entry1507 i).charge = charge 121 (281 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1514_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1507 (i : Fin 32) :
    forwardStepOK (-768) (charge 121 (281 + i.val)) shift
      (S (281 + i.val + 1)) (S 122) (T 121 (281 + i.val + 1))
      (T 121 (281 + i.val)) (T 122 (281 + i.val))
      (OriginalRow227Roots.root_pos 122 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 121 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1507.entries OriginalRow227TriangleForward1507.checked
    ⟨i.val, by rw [size1507]; exact i.isLt⟩
  change (entry1507 i).check = true at h
  rcases fields1507 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1508 : OriginalRow227TriangleForward1508.entries.size = 32 := rfl

def entry1508 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1508.entries[i.val]'(by rw [size1508]; exact i.isLt)

theorem fields1508 (i : Fin 32) :
    (entry1508 i).IA = shift ∧ (entry1508 i).ID = S (313 + i.val + 1) ∧
      (entry1508 i).IC = S 122 ∧ (entry1508 i).Inext = T 121 (313 + i.val + 1) ∧
      (entry1508 i).Icur = T 121 (313 + i.val) ∧
      (entry1508 i).output = T 122 (313 + i.val) ∧
      (entry1508 i).charge = charge 121 (313 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1515_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1508 (i : Fin 32) :
    forwardStepOK (-768) (charge 121 (313 + i.val)) shift
      (S (313 + i.val + 1)) (S 122) (T 121 (313 + i.val + 1))
      (T 121 (313 + i.val)) (T 122 (313 + i.val))
      (OriginalRow227Roots.root_pos 122 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 121 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1508.entries OriginalRow227TriangleForward1508.checked
    ⟨i.val, by rw [size1508]; exact i.isLt⟩
  change (entry1508 i).check = true at h
  rcases fields1508 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1509 : OriginalRow227TriangleForward1509.entries.size = 32 := rfl

def entry1509 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1509.entries[i.val]'(by rw [size1509]; exact i.isLt)

theorem fields1509 (i : Fin 32) :
    (entry1509 i).IA = shift ∧ (entry1509 i).ID = S (345 + i.val + 1) ∧
      (entry1509 i).IC = S 122 ∧ (entry1509 i).Inext = T 121 (345 + i.val + 1) ∧
      (entry1509 i).Icur = T 121 (345 + i.val) ∧
      (entry1509 i).output = T 122 (345 + i.val) ∧
      (entry1509 i).charge = charge 121 (345 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1517_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1516_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1517_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1517_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1509 (i : Fin 32) :
    forwardStepOK (-768) (charge 121 (345 + i.val)) shift
      (S (345 + i.val + 1)) (S 122) (T 121 (345 + i.val + 1))
      (T 121 (345 + i.val)) (T 122 (345 + i.val))
      (OriginalRow227Roots.root_pos 122 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 121 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1509.entries OriginalRow227TriangleForward1509.checked
    ⟨i.val, by rw [size1509]; exact i.isLt⟩
  change (entry1509 i).check = true at h
  rcases fields1509 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1510 : OriginalRow227TriangleForward1510.entries.size = 3 := rfl

def entry1510 (i : Fin 3) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1510.entries[i.val]'(by rw [size1510]; exact i.isLt)

theorem fields1510 (i : Fin 3) :
    (entry1510 i).IA = shift ∧ (entry1510 i).ID = S (377 + i.val + 1) ∧
      (entry1510 i).IC = S 122 ∧ (entry1510 i).Inext = T 121 (377 + i.val + 1) ∧
      (entry1510 i).Icur = T 121 (377 + i.val) ∧
      (entry1510 i).output = T 122 (377 + i.val) ∧
      (entry1510 i).charge = charge 121 (377 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1517_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1517_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1526_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1517_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1517_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1526_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings03.S_eq_root122).symm,
      (OriginalRow227TriangleBindingsRow121.block1517_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow121.block1517_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1526_value ⟨2, by decide⟩).symm, rfl⟩

theorem step1510 (i : Fin 3) :
    forwardStepOK (-768) (charge 121 (377 + i.val)) shift
      (S (377 + i.val + 1)) (S 122) (T 121 (377 + i.val + 1))
      (T 121 (377 + i.val)) (T 122 (377 + i.val))
      (OriginalRow227Roots.root_pos 122 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 121 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1510.entries OriginalRow227TriangleForward1510.checked
    ⟨i.val, by rw [size1510]; exact i.isLt⟩
  change (entry1510 i).check = true at h
  rcases fields1510 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 121 ≤ d) (hhi : d < 380) :
    forwardStepOK (-768) (charge 121 d) shift (S (d + 1)) (S 122)
      (T 121 (d + 1)) (T 121 d) (T 122 d)
      (OriginalRow227Roots.root_pos 122 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 121 (by decide)) = true := by
  by_cases h249 : d < 249
  ·
    by_cases h185 : d < 185
    ·
      by_cases h153 : d < 153
      ·
        have hi : d - 121 < 32 := by omega
        have heq : 121 + (d - 121) = d := by omega
        simpa only [heq] using step1502 ⟨d - 121, hi⟩
      ·
        have hi : d - 153 < 32 := by omega
        have heq : 153 + (d - 153) = d := by omega
        simpa only [heq] using step1503 ⟨d - 153, hi⟩
    ·
      by_cases h217 : d < 217
      ·
        have hi : d - 185 < 32 := by omega
        have heq : 185 + (d - 185) = d := by omega
        simpa only [heq] using step1504 ⟨d - 185, hi⟩
      ·
        have hi : d - 217 < 32 := by omega
        have heq : 217 + (d - 217) = d := by omega
        simpa only [heq] using step1505 ⟨d - 217, hi⟩
  ·
    by_cases h313 : d < 313
    ·
      by_cases h281 : d < 281
      ·
        have hi : d - 249 < 32 := by omega
        have heq : 249 + (d - 249) = d := by omega
        simpa only [heq] using step1506 ⟨d - 249, hi⟩
      ·
        have hi : d - 281 < 32 := by omega
        have heq : 281 + (d - 281) = d := by omega
        simpa only [heq] using step1507 ⟨d - 281, hi⟩
    ·
      by_cases h345 : d < 345
      ·
        have hi : d - 313 < 32 := by omega
        have heq : 313 + (d - 313) = d := by omega
        simpa only [heq] using step1508 ⟨d - 313, hi⟩
      ·
        by_cases h377 : d < 377
        ·
          have hi : d - 345 < 32 := by omega
          have heq : 345 + (d - 345) = d := by omega
          simpa only [heq] using step1509 ⟨d - 345, hi⟩
        ·
          have hi : d - 377 < 3 := by omega
          have heq : 377 + (d - 377) = d := by omega
          simpa only [heq] using step1510 ⟨d - 377, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122.fields1502,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122.step1502,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122.fields1503,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122.step1503,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122.fields1504,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122.step1504,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122.fields1505,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122.step1505,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122.fields1506,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122.step1506,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122.fields1507,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122.step1507,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122.fields1508,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122.step1508,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122.fields1509,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122.step1509,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122.fields1510,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122.step1510,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow122
